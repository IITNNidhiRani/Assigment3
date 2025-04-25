gcloud compute instance-groups managed set-autoscaling nidhi-instance-group-1 \
  --max-num-replicas=5 \
  --min-num-replicas=1 \
  --target-cpu-utilization=0.75 \
  --cool-down-period=60 \
  --zone=us-central1-c
