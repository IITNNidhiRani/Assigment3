
INSTANCE_GROUP="nidhi-instance-group-1 "
ZONE="us-central1-c"
MIN_INSTANCES=2
MAX_INSTANCES=5
TARGET_INSTANCES=3
CPU_UTILIZATION=0.7
COOL_DOWN=90
# AUTHENTICATE FIRST
gcloud auth activate-service-account --key-file=/home/Nidhi/Downloads/my-first-project-456006-62d4ee0e87c3.json

# Set project (important)
gcloud config set project my-first-project-456006


echo "Increasing instances in GCP Managed Instance Group..."
/usr/bin/gcloud compute instance-groups managed resize $INSTANCE_GROUP --size=$TARGET_INSTANCES --zone=$ZONE

#usr/bin/gcloud compute instance-groups managed set-autoscaling $INSTANCE_GROUP \
#    --zone=$ZONE \
#    --min-num-replicas=$MIN_INSTANCES \
#    --max-num-replicas=$MAX_INSTANCES \
#    --target-cpu-utilization=$CPU_UTILIZATION \
#    --cool-down-period=$COOL_DOWN
	
echo "Updated scaling limits: min=$MIN_INSTANCES, max=$MAX_INSTANCES"

echo "Current instances in the instance group:"
/usr/bin/gcloud compute instance-groups managed list-instances $INSTANCE_GROUP --zone=$ZONE

