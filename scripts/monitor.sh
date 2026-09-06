#!/bin/bash

# ==========================================
# InfraWatch - Linux Infrastructure Monitor
# ==========================================

echo "=========================================="
echo "          INFRAWATCH MONITOR"
echo "=========================================="

echo "Hostname : $(hostname)"
echo "Date     : $(date)"
echo "Uptime   : $(uptime -p)"

echo
echo "---------- CPU USAGE ----------"
top -bn1 | grep "Cpu(s)"

echo
echo "---------- MEMORY ----------"
free -h

echo
echo "---------- DISK ----------"
df -h /

echo
echo "---------- PROCESSES ----------"
ps aux --sort=-%cpu | head -6

echo
echo "---------- NETWORK ----------"
ip -br addr

echo
echo "=========================================="
echo "          MONITORING COMPLETE"
echo "=========================================="

