
## Assignment 3
## Project Overview

## 📘 Project Overview
This project implements **real-time monitoring** and **auto-scaling of a local VM** to **Google Cloud Platform (GCP)**. When the local VM's CPU usage exceeds 75%, a GCP VM instance is automatically launched using a service account and `gcloud` CLI, or alternatively, via **Pub/Sub** and **Cloud Functions**. The system uses **Prometheus** for monitoring and **Docker** to simulate load.

---


## 1.	Scope:
 Scope
This project demonstrates an automated system for real-time CPU monitoring and cloud-based auto-scaling of virtual machines using open-source tools and cloud-native services. The implementation focuses on:

🖥️ Monitoring CPU usage of a local VM using Prometheus + Node Exporter

🐍 Script-based automation using Python and shell scripts

☁️ Triggering auto-scaling to GCP when CPU usage exceeds 75%

🐳 Simulating high CPU load using a lightweight Docker container

🔁 Scaling Google Cloud Managed Instance Groups via:

Google Cloud CLI (gcloud)

Optional Pub/Sub and Cloud Functions integration

📈 Verifying the system behavior through logging and visual monitoring tools (Grafana optional)

🧪 Testing the responsiveness and correctness of scaling actions under controlled conditions

This setup is modular and suitable for:

Demonstrating auto-scaling concepts

Cloud infrastructure learning

Lightweight DevOps test environments

Resource-aware academic workloads



## 3.	Tools and Technologies used

VirtualBox – Local VM environment

Ubuntu 22.04 – OS for local monitoring VM

Docker – Simulated CPU-intensive application

Prometheus + Node Exporter – Real-time monitoring

Grafana – Visual dashboard for monitoring CPU metrics

Python – CPU monitoring logic

Google Cloud Compute Engine – Scalable infrastructure

GCP Pub/Sub + Cloud Functions – Event-driven automation

gcloud SDK – Command-line GCP control

Systemd + Shell Scripting – Background task automation


## Project Setup & Execution
**Created Local Virtual Machine**

-Installed VirtualBox and created a VM with Ubuntu 22.04.

-Allocated 2 vCPUs and 4 GB RAM to simulate high CPU load.

**Configured networking**:

-Adapter 1: NAT (internet access)

-Adapter 2: Host-Only Adapter (internal communication)

**Installed Required Software**

-Updated package manager and installed essential packages:

sudo apt update && sudo apt install -y python3 python3-pip docker.io prometheus node-exporter


Enabled and started Prometheus and Node Exporter services.

**Configured Prometheus Monitoring**


Downloaded and extracted the latest Prometheus release.

Modified the prometheus.yml configuration:

yaml

global:
  scrape_interval: 5s

scrape_configs:
  - job_name: "node"
    static_configs:
      - targets: ["localhost:9090"]
Started Prometheus and accessed the dashboard at http://localhost:9090.

**Deployed Node Exporter**

Launched Node Exporter using:

bash

nohup node_exporter &
Verified Prometheus target was up and collecting metrics.

**Simulated CPU Load**

Created a Docker container using a Dockerfile with the stress utility.

Ran the container using:


docker run -d --name stress-app stress-app
Implemented CPU Monitoring

Developed monitor_cpu.sh to track real-time CPU usage.

Created monitor_cpu_loop.sh to execute the monitoring every 30 seconds.

**Launched it using:**

bash

nohup bash monitor_cpu_loop.sh &
Configured Auto-Scaling to GCP

Wrote migrate_to_gcp.sh to trigger scaling using gcloud CLI.

**Authenticated the service account:**

arduino

gcloud auth activate-service-account --key-file=/home/Nidhi/Downloads/my-key.json
gcloud config set project my-first-project-456006

**Resized the instance group with:**

sql

gcloud compute instance-groups managed resize nidhi-instance-group-1 --size=3 --zone=us-central1-c

**Monitored and Verified Auto-Scaling**

Observed real-time CPU metrics in Prometheus.

Triggered scaling when CPU usage exceeded 75%.

**Verified new instances using:**

nginx

gcloud compute instances list
Tested Security Configuration

Ensured SSH (port 22) and HTTP (port 80) access were allowed.

Confirmed port 8080 was blocked using telnet and nc.

**Documented Observations**

CPU usage rose to 82%, triggering scale-up.

Instance count increased from 1 to 3.

All results were logged and screenshots were included in the final report.

**Architecture Diagrams**

1️⃣ **Application Architecture** – Retrieval-Augmented Generation (RAG) System
This diagram illustrates a RAG-based system where responses are enhanced by retrieving relevant information from a pre-indexed vector database. The architecture combines document processing, vector similarity search, and large language model (LLM) generation.

Key Components:

Document Processing: Raw documents are parsed and chunked.

Embedding Layer: Chunks are converted into vector representations using an embedding model.

Vector Store: Embeddings are indexed and stored for similarity search.

Query Pipeline: User queries are embedded and searched against the vector store.

Prompt Constructor: Top-k retrieved chunks + query are passed to an LLM to generate a grounded response.

📌 This architecture ensures more accurate, context-aware answers and minimizes hallucinations by grounding outputs in real data.
![image](https://github.com/user-attachments/assets/97d1ff73-4880-41c2-ad55-766ec2011240)

2️⃣ **Auto-Scaling Architecture – Local VM to GCP**
This diagram represents a system that monitors CPU usage on a local virtual machine and triggers auto-scaling on Google Cloud Platform (GCP) when usage exceeds a defined threshold (e.g., 75%).

Key Components:

Local VM (Ubuntu):

Prometheus + Node Exporter for real-time CPU monitoring

Shell scripts (monitor_cpu.sh, migrate_to_gcp.sh) to track and trigger scaling

Docker + stress to simulate high CPU load

Google Cloud:

Managed Instance Group (MIG) configured with auto-scaling policy

GCP CLI (gcloud) triggered from local machine

New VM instances created dynamically when CPU crosses threshold

📌 This architecture enables intelligent and cost-effective cloud resource scaling based on local infrastructure performance.
![Articutre_diagram](https://github.com/user-attachments/assets/c5d0f02e-5a4f-407b-b24c-8f81df35f4ae)

## Testing & Observation
During simulated high CPU load using the stress tool within a Docker container, the system behavior was continuously monitored through Prometheus and GCP Monitoring dashboards. Auto-scaling was tested by observing the instance group's response to CPU usage crossing the defined threshold.

## Key Observations:
The local VM's CPU usage reached above 82%, which successfully triggered the auto-scaling script.

GCP Managed Instance Group scaled from 1 to 5 instances, confirming the trigger mechanism worked.

Prometheus correctly reported CPU usage at 5-second intervals, and the usage graph showed expected spikes.

The monitor_cpu_loop.sh script executed at 30-second intervals and consistently responded to threshold breaches.

Firewall rules were verified using telnet and nc, confirming that:

Ports 22 (SSH) and 80 (HTTP) were open.

Port 8080 was correctly blocked.

IAM roles applied to the service account successfully restricted access to only the necessary GCP resources.

All log messages, Prometheus metrics, and scaling events aligned with expected behavior, validating the implementation.
## Repository & Demo
**Source Code:**  https://github.com/IITNNidhiRani/Assigment3.git

**Video Demonstration:**  https://youtu.be/zBqPbVZuGz4
## ✅ Conclusion
This project successfully demonstrates the design and implementation of a real-time CPU monitoring and auto-scaling system using both open-source and cloud-native tools. By leveraging Prometheus and Node Exporter for local resource monitoring, Docker for generating CPU load, and Google Cloud services for compute scalability, the system effectively automates the migration and scaling of workloads based on CPU usage.

The automation scripts written in Python and Bash, combined with GCP's scalable infrastructure and optional event-driven integration via Pub/Sub and Cloud Functions, provide a reliable and flexible foundation for building intelligent cloud resource management systems.

This implementation not only reinforces practical skills in monitoring, DevOps automation, and cloud deployment but also sets the stage for future improvements such as integration with load balancers, dynamic thresholds, and cross-cloud scaling.
## Limitations 
The system does not use a load balancer to distribute requests across instances

CPU threshold is hard-coded (75%) and not dynamically adjustable during runtime

The system uses a local service account key for authentication, which is not secure for production environments

There is no cooldown or hysteresis logic implemented to prevent frequent scaling up and down

The system has only been tested with a limited number of virtual machines and may not scale to production-grade workloads
## Assumptions
The user has sudo access to the local Ubuntu VM

Prometheus and Node Exporter are correctly installed and running

Docker is installed and functioning on the local machine

A Google Cloud project is configured and billing is enabled

The service account used has appropriate IAM roles for Compute Engine and Pub/Sub

A Managed Instance Group already exists on GCP with the name nidhi-instance-group-1
## Future Enhancements
Add a load balancer to manage traffic across multiple instances

Implement alert notifications via Slack, email, or SMS using GCP Monitoring

Add logic for automatic scale-down with proper cooldown intervals

Integrate Prometheus Pushgateway to collect data from multiple sources

Use Terraform or Ansible to manage infrastructure as code

Use Docker Compose to manage Prometheus, Node Exporter, and the CPU stress container

Extend to Kubernetes for pod-level auto-scaling with HPA

Build a cost visualization dashboard using GCP Billing APIs



## Author

Name: Nidhi Rani


Institution: Indian Institute of Technology Jodhpur

Program: M.Tech – Data and Computational Sciences
