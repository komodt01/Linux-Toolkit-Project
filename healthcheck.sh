#!/bin/bash

# Linux Security Hardening Lab
# Basic host health and security-status collection.

echo "=== Linux Host Health Report ==="
echo "Generated: $(date)"
echo

echo "=== System Uptime and Load ==="
uptime
echo

echo "=== Disk Usage ==="
df -h
echo

echo "=== Memory Usage ==="
free -m
echo

echo "=== Top Memory-Consuming Processes ==="
ps aux --sort=-%mem | head -n 6
echo

echo "=== Firewall Status ==="
ufw status
echo

echo "=== Fail2ban Service Status ==="
systemctl is-active fail2ban || true
echo

echo "=== Unattended Upgrades Status ==="
systemctl is-enabled unattended-upgrades 2>/dev/null || true
echo

echo "=== Report Complete ==="
