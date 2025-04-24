# 📈 Assignment 3 – Real-Time CPU Monitoring and Auto-Scaling to GCP

## 📘 Project Overview
This project implements **real-time monitoring** and **auto-scaling of a local VM** to **Google Cloud Platform (GCP)**. When the local VM's CPU usage exceeds 75%, a GCP VM instance is automatically launched using a service account and `gcloud` CLI, or alternatively, via **Pub/Sub** and **Cloud Functions**. The system uses **Prometheus** for monitoring and **Docker** to simulate load.

---

## 🛠 Technologies Used

- **VirtualBox** – Local VM environment  
- **Ubuntu 22.04** – OS for local monitoring VM  
- **Docker** – Simulated CPU-intensive application  
- **Prometheus + Node Exporter** – Real-time monitoring  
- **Python** – CPU monitoring logic  
- **Google Cloud Compute Engine** – Scalable infrastructure  
- **GCP Pub/Sub + Cloud Functions** – Event-driven automation  
- **gcloud SDK** – Command-line GCP control  
- **Systemd + Shell Scripting** – Background task automation  

---

## 🔧 Project Setup & Execution

### 1️⃣ Local Virtual Machine Setup

- Created using VirtualBox with 2 vCPUs and 4GB RAM  
- Networking:
  - Adapter 1: NAT (Internet)
  - Adapter 2: Host-only (local access)  
- Installed:
```bash
sudo apt update
sudo apt install -y python3 python3-pip prometheus node-exporter docker.io
