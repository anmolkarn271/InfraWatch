#!/bin/bash

# ==========================================
# InfraWatch - Linux Infrastructure Monitor
# ==========================================

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$BASE_DIR/config/thresholds.conf"
LOG_DIR="$BASE_DIR/logs"
REPORT_DIR="$BASE_DIR/reports"

mkdir -p "$LOG_DIR" "$REPORT_DIR"

source "$CONFIG"

TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
HOST=$(hostname)

CPU=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}' | cut -d. -f1)
RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {gsub("%",""); print $5}')
LOAD=$(uptime | awk -F'load average:' '{print $2}' | xargs)

STATUS="HEALTHY"

if [ "$CPU" -ge "$CPU_THRESHOLD" ]; then
    STATUS="WARNING"
fi

if [ "$RAM" -ge "$RAM_THRESHOLD" ]; then
    STATUS="WARNING"
fi

if [ "$DISK" -ge "$DISK_THRESHOLD" ]; then
    STATUS="WARNING"
fi

REPORT="$REPORT_DIR/report-$(date '+%Y-%m-%d_%H-%M-%S').txt"

{
echo "=========================================="
echo "             INFRAWATCH REPORT"
echo "=========================================="
echo "Hostname       : $HOST"
echo "Timestamp      : $TIMESTAMP"
echo "Status         : $STATUS"
echo
echo "CPU Usage      : ${CPU}%"
echo "RAM Usage      : ${RAM}%"
echo "Disk Usage     : ${DISK}%"
echo "Load Average   : $LOAD"
echo "Uptime         : $(uptime -p)"
echo
echo "Top Processes:"
ps aux --sort=-%cpu | head -6
echo
echo "Network:"
ip -br addr
echo "=========================================="
} | tee "$REPORT"

echo "$TIMESTAMP | HOST=$HOST | CPU=${CPU}% | RAM=${RAM}% | DISK=${DISK}% | STATUS=$STATUS" \
>> "$LOG_DIR/infrwatch.log"
