#!/bin/bash

echo "Ativando ataque Wormhole/Blackhole..."

# Função para executar comando no host pelo PID
executa_host() {
    HOST=$1
    shift
    CMD=$@
    PID=$(ps -e -o pid,cmd | grep "mininet:$HOST" | grep -v grep | awk '{print $1}')
    if [[ -z "$PID" ]]; then
        echo "❌ Host $HOST não encontrado. Verifique se a topologia está em execução."
        exit 1
    fi
    echo "✅ Executando no $HOST (PID $PID): $CMD"
    sudo mnexec -a $PID $CMD
}

# Configurações

# Ativa roteamento IP em h7
executa_host h7 sysctl -w net.ipv4.ip_forward=1

# Desativa ICMP redirects em h6
executa_host h6 sysctl -w net.ipv4.conf.all.accept_redirects=0
executa_host h6 sysctl -w net.ipv4.conf.h6-eth0.accept_redirects=0

# Remove rota padrão de h6
executa_host h6 route del -net 10.0.0.0 netmask 255.0.0.0 || true

# Define h7 como gateway padrão de h6
executa_host h6 route add default gw 10.0.0.7

# Estabelece túnel Wormhole h7 <-> h8 usando socat
executa_host h7 socat TCP-LISTEN:5555,fork TCP:10.0.0.8:6666 &
executa_host h8 socat TCP-LISTEN:6666,fork TCP:10.0.0.7:5555 &

# Configura blackhole local em h7
executa_host h7 iptables -A FORWARD -s 10.0.0.6 -d 10.0.0.1 -j DROP

# Aplica regra no ONOS
echo "Aplicando regra DROP no ONOS..."

curl -u onos:rocks -X POST -H 'Content-Type: application/json' \
  -d '{
    "flows": [{
      "priority": 40000,
      "timeout": 0,
      "isPermanent": true,
      "deviceId": "of:0000000000000005",
      "treatment": { "instructions": [{ "type": "NOACTION" }] },
      "selector": {
        "criteria": [
          { "type": "ETH_SRC", "mac": "00:00:00:00:00:06" },
          { "type": "ETH_DST", "mac": "00:00:00:00:00:01" }
        ]
      }
    }]
  }' http://172.17.0.2:8181/onos/v1/flows

echo "✅ Ataque configurado com sucesso."

