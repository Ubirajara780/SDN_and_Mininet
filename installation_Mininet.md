## 1. Install Mininet on Ubuntu

```bash
sudo apt-get install mininet
git clone https://github.com/mininet/mininet
cd mininet
git tag  # Check the latest stable version (e.g., 2.3.0)
git checkout -b 2.3.0  # Replace with desired version
sudo ./util/install.sh -n  # Install Mininet only (no OpenFlow/Wireshark)
```

## 2. Create a Network in Mininet

- See examples and attacks: [Mininet Attacks Gist](https://gist.github.com/anselmobattis)

## 2.1 Activate Mininet Network Using ONOS Controller

```bash
sudo mn
```

## 3. Ping All Hosts

```bash
pingall
```

## 5. Clean Mininet

```bash
sudo mn -c
```

## 6. CLI Commands (inside Mininet)

Once you start Mininet, you can run these inside the CLI (mininet> prompt):

- **nodes** → Lists all nodes in the network (hosts, switches, controllers).
  
- **net** → Displays connections between nodes.

- **dump** → Shows detailed information about all nodes.

- **pingall** → Tests connectivity between all hosts.

- **h1 ping h2** → Makes host h1 ping host h2.

- **iperf h1 h2** → Runs a bandwidth test between h1 and h2.

- **h1 ifconfig** → Runs Linux command ifconfig on host h1.

- **h1 ls** → Lists files inside host h1.
