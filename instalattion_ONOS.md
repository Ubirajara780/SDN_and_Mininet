# 🌐 ONOS and Mininet Setup Guide

## 📘 Introduction

**ONOS (Open Network Operating System)** is an operating system for Software Defined Networking (SDN).

### 🔹 Key Features:
- Acts as a centralized and distributed controller.  
- Designed for operators and service providers.  
- Manages the network using protocols such as **OpenFlow**.  
- Separates the control plane from the data plane.  
- Supports multiple instances for high availability and scalability.  

---

## 🐳 1. Download ONOS Docker Image
```bash
sudo docker pull onosproject/onos
```

---

## 🚀 2. Run ONOS Container
```bash
sudo docker run -t -d \
  -p 8181:8181 \
  -p 8101:8101 \
  -p 5005:5005 \
  -p 830:830 \
  --name onos onosproject/onos
```

### 🔎 2.1 View Logs
```bash
sudo docker container logs onos
```

### 📌 2.2 Get Container IP
```bash
sudo docker container inspect onos
```

### ⏹️ 2.3 Stop ONOS
```bash
sudo docker container stop onos
```

### 🗑️ 2.4 Remove ONOS
```bash
sudo docker container rm onos
```

---

## 🌐 3. Access Web Interface

Open in your browser:

```
http://<Your_IP_Address>:8181/onos/ui/login.html
```

**User:** `onos`  
**Password:** `rocks`

---

## ⚙️ 4. Activate Forwarding Components

Activate the following components in ONOS:
- OpenFlow Base Provider  
- Reactive Forwarding  
- Control Message Stats Provider  
- OpenFlow Agent  
- OpenFlow Provider Suite  
- OpenFlow Overlay  

---

## 🖥️ 5. Access ONOS Container
```bash
sudo docker exec -it onos bash
```

Inside the container:
```bash
cd bin
./onos -l karaf
```

**User:** `karaf`  
**Password:** `karaf`  
