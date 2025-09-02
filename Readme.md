
# SDN and Mininet Overview

## 1. Software-Defined Networking (SDN)

**Software-Defined Networking (SDN)** is a network architecture approach where the network's control plane is separated from the forwarding plane. Instead of each switch or router making independent decisions, a **centralized controller** manages the entire network programmatically.

### Key Features

1. **Control Plane Separate from Data Plane**  
   - **Control Plane:** Makes forwarding decisions (managed by the SDN controller).  
   - **Data Plane:** Forwards packets according to the rules from the controller.

2. **Centralized Control**  
   - One or more controllers manage the entire network, simplifying configuration, monitoring, and policy enforcement.

3. **Programmability**  
   - Networks can be programmed through APIs (e.g., OpenFlow), enabling automation, dynamic routing, QoS, and security policies.

4. **Flexibility and Agility**  
   - Network changes do not require manual reconfiguration of each physical device.  
   - Allows experimentation, traffic optimization, and integration with virtualized networks.

---

## 2. Mininet

**Mininet** is a network emulator that allows creating **virtual network topologies** with hosts, switches, and links on a single machine. It is widely used for **research, teaching, and SDN testing**.

### Features

- Emulates hosts, OpenFlow switches, and network links.  
- Allows testing SDN controllers (e.g., **ONOS**, **Ryu**, **POX**) without real hardware.  
- Supports Python scripts for custom topologies.  
- Enables experiments with attacks, traffic monitoring, and policy simulation.

### How it Works with SDN

1. Mininet creates virtual switches that support **OpenFlow**.  
2. These switches connect to an SDN controller (like ONOS).  
3. The controller sends forwarding rules to the switches, managing network traffic in real-time.

### Example Use Cases

- Testing new routing algorithms.  
- Simulating attacks like **MAC flooding** or **blackhole**.  
- Evaluating QoS or load-balancing policies.  
- Teaching and demonstrating SDN concepts without physical hardware.
