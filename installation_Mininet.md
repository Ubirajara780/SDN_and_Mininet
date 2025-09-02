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
