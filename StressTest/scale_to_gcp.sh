#!/bin/bash
# Create GCP VM instance
INSTANCE_NAME="cloud-instance"
gcloud compute instances create $INSTANCE_NAME \
    --zone=us-central1-a \
    --machine-type=e2-medium \
    --image-family=debian-11 \
    --image-project=debian-cloud \
    --tags=http-server,https-server

# Deploy docker app on remote VM via SSH
# You may preconfigure a startup script for automation
