#!/bin/bash

# Log file location
LOG_FILE="system_report.log"

# Get system uptime
UPTIME=$(uptime -p)

# Get CPU usage
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')

# Get memory usage
MEMORY_USAGE=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')

# Get disk usage
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')

# Check if Docker is running
DOCKER_STATUS=$(systemctl is-active docker)

# Print system health report
echo "System Health Report - $(date)" > $LOG_FILE
echo "-----------------------------------" >> $LOG_FILE
echo "Uptime: $UPTIME" >> $LOG_FILE
echo "CPU Usage: $CPU_USAGE%" >> $LOG_FILE
echo "Memory Usage: $MEMORY_USAGE" >> $LOG_FILE
echo "Disk Usage: $DISK_USAGE" >> $LOG_FILE
echo "Docker Service: $DOCKER_STATUS" >> $LOG_FILE
echo "-----------------------------------" >> $LOG_FILE

# Display the report to the user
cat $LOG_FILE

