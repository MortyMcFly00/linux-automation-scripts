#!/bin/bash
# Basic System Information Script

# This script gather basic system information

# Get system information
HOSTNAME=$(hostname)
UPTIME=$(uptime -p)
KERNEL=$(uname -r)
MEMORY=$(free -h | grep Mem | awk '{print $2, $3, $4}')
DISK=$(df -h / | awk 'NR==2 {print $2, $3, $5}')
CPU=$(lscpu | grep "Model name" | awk -F ':' '{print $2}' | xargs)
USERS=$(who | wc -l)
IP_ADDRESS=$(hostname -I)

#Display the gathered information
echo "===== System Information ====="
echo "Hostname: $HOSTNAME"
echo "Uptime: $UPTIME"
echo "Kernel Version: $KERNEL"
echo "Memory (Total, Used, Used%): $DISK"
echo "Disk Usage (Total, Used, Used%): $DISK"
echo "CPU Model: $CPU"
echo "Number of Active Users: $USERS"
echo "IP Address: $IP_ADDRESS"
echo "=============================="
