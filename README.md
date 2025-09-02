
# ONOS and Mininet Setup Guide

## 1. Download ONOS Docker Image

```bash
sudo docker pull onosproject/onos
```

## 2. Run ONOS Container

```bash
sudo docker run -t -d -p 8181:8181 -p 8101:8101 -p 5005:5005 -p 830:830 --name onos onosproject/onos
```

### 2.1 View Logs

```bash
sudo docker container logs onos
```

### 2.2 Get Container IP

```bash
sudo docker container inspect onos
```

### 2.3 Stop ONOS

```bash
sudo docker container stop onos
```

### 2.4 Remove ONOS

```bash
sudo docker container rm onos
```

## 3. Access Web Interface

```
http://<Your_IP_Address>:8181/onos/ui/login.html
```

- **User:** onos
- **Password:** rocks

## 4. Activate Forwarding Components

- OpenFlow Base Provider  
- Reactive Forwarding  
- Control Message Stats Provider  
- OpenFlow Agent  
- OpenFlow Provider Suite  
- OpenFlow Overlay

## 5. Install Mininet on Ubuntu

```bash
sudo apt-get install mininet
git clone https://github.com/mininet/mininet
cd mininet
git tag  # Check the latest stable version (e.g., 2.3.0)
git checkout -b 2.3.0  # Replace with desired version
sudo ./util/install.sh -n  # Install Mininet only (no OpenFlow/Wireshark)
```

## 6. Access ONOS Container

```bash
sudo docker exec -it onos bash
root@container_id:~/onos# cd bin
root@container_id:~/onos# ./onos -l karaf
```

- **User:** karaf  
- **Password:** karaf

## 7. Create a Network in Mininet

- See examples and attacks: [Mininet Attacks Gist](https://gist.github.com/anselmobattis)

## 7.1 Activate Mininet Network Using ONOS Controller

```bash
sudo python mininet_remote_controller.py
```

## 8. Ping All Hosts

```bash
pingall
```

## 9. Clean Mininet

```bash
sudo mn -c
```

## Mininet Attacks

### MAC Flood Attack ("macof")

- From a host connected to the switch: execute the attack (e.g., macof) on a host interface to generate traffic that the switch must process. Flooding can affect the switch.  
- Manipulate the switch via OVS: use `ovs-ofctl` commands to modify rules, simulate floods via OpenFlow, etc.

### Blackhole Attack

- Similar methodology, can be implemented by dropping traffic or rerouting flows.
