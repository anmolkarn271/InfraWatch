#!/bin/bash

# ==========================================
# InfraWatch - Alert System
# ==========================================

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
CONFIG="$BASE_DIR/config/thresholds.conf"

source "$CONFIG"

CPU=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8}' | cut -d. -f1)
RAM=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {gsub("%",""); print $5}')

ALERT=0

echo "========== InfraWatch Alert Check =========="

# CPU check
if [ "$CPU" -ge "$CPU_CRITICAL" ]; then
    echo "🚨 CRITICAL CPU: ${CPU}%"
    ALERT=1
elif [ "$CPU" -ge "$CPU_WARNING" ]; then
    echo "⚠️ WARNING CPU: ${CPU}%"
    ALERT=1
fi

# RAM check
if [ "$RAM" -ge "$RAM_CRITICAL" ]; then
    echo "🚨 CRITICAL RAM: ${RAM}%"
    ALERT=1
elif [ "$RAM" -ge "$RAM_WARNING" ]; then
    echo "⚠️ WARNING RAM: ${RAM}%"
    ALERT=1
fi

# Disk check
if [ "$DISK" -ge "$DISK_CRITICAL" ]; then
    echo "🚨 CRITICAL DISK: ${DISK}%"
    ALERT=1
elif [ "$DISK" -ge "$DISK_WARNING" ]; then
    echo "⚠️ WARNING DISK: ${DISK}%"
    ALERT=1
fi

if [ "$ALERT" -eq 0 ]; then
    echo "✅ System healthy"
else
    echo "🚨 Infrastructure warning detected!"
fi

echo "============================================"
