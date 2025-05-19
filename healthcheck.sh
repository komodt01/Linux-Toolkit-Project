#!/bin/bash

echo "=== System Health Report - $(date) ==="
echo ""

echo "[CPU Load]"
uptime

echo ""
echo "[Disk Usage]"
df -h

echo ""
echo "[Memory Usage]"
free -m

echo ""
echo "[Top 3 Memory-Consuming Processes]"
ps aux --sort=-%mem | head -n 4

echo "-----------------------------------------"
