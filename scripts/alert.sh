#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$BASE_DIR/config/thresholds.conf"

source "$CONFIG"

CPU=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}' | cut -d. -f1)
RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

ALERT=0

echo "========== InfraWatch Alert Check =========="

if [ "$CPU" -ge "$CPU_THRESHOLD" ]; then
    echo "⚠️ CPU ALERT: ${CPU}%"
    ALERT=1
fi

if [ "$RAM" -ge "$RAM_THRESHOLD" ]; then
    echo "⚠️ RAM ALERT: ${RAM}%"
    ALERT=1
fi

if [ "$DISK" -ge "$DISK_THRESHOLD" ]; then
    echo "⚠️ DISK ALERT: ${DISK}%"
    ALERT=1
fi

if [ "$ALERT" -eq 0 ]; then
    echo "✅ System healthy"
else
    echo "🚨 Infrastructure warning detected!"
fi
