
#!/bin/bash  


THRESHOLD=75  

LOG_FILE="/home/Nidhi/Nidhi_Assigment3/nidhi_logs.log"


CPU_USAGE=$(mpstat 1 1 | awk '/Average:.*all/ {print 100 - $NF}' | tr -d '[:space:]')  

echo "Raw mpstat output:"  
mpstat 1 1  
echo "Extracted CPU usage: $CPU_USAGE"  

# Ensure CPU_USAGE is a valid numeric value with improved validation  
if ! [[ "$CPU_USAGE" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then  
  echo "Error: Failed to parse CPU usage. Ensure mpstat is installed and running correctly."  
  exit 1  
fi  

if (( $(echo "$CPU_USAGE > $THRESHOLD" | bc -l) )); then  
  echo "CPU usage is at $CPU_USAGE%, migrating to GCP."  
  
  # Log the migration with timestamp and save output to log file  
  {  
    echo "===================================="  
    echo "Migration triggered: $(date)"  
    echo "CPU usage: $CPU_USAGE%"  
    echo "------------------------------------"  
    /home/Nidhi/migrate_to_gcp.sh
    echo "Migration completed: $(date)"  
    echo "===================================="  
    echo ""  # Empty line for better readability  
  } >> "$LOG_FILE" 2>&1  
  
  # Also print confirmation to terminal  
  echo "Migration completed. Log saved to $LOG_FILE"  
else  
  echo "CPU usage is below threshold ($CPU_USAGE%)."  
fi  

