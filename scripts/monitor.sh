#!/bin/bash

echo "================================="
echo "       INFRAWATCH MONITOR"
echo "================================="
echo
echo "Hostname: $(hostname)"
echo "Date: $(date)"
echo "Uptime: $(uptime -p)"

echo
echo "CPU:"
top -bn1 | grep "Cpu(s)"

echo
echo "Memory:"
free -h

echo
echo "Disk:"
df -h /

echo
echo "Network:"
ip -br addr
