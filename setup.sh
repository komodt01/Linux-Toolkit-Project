#!/bin/bash

# ================================
# Linux Hardening Setup Script
# ================================

# 1. Create a new non-root user
USERNAME="clouduser"
adduser --disabled-password --gecos "" "$USERNAME"
usermod -aG sudo "$USERNAME"

# 2. Disable remote root login
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
systemctl restart ssh

# 3. Install security packages
apt update && apt install -y ufw fail2ban unattended-upgrades

# 4. Enable UFW firewall and allow only necessary ports
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow http
ufw allow https
ufw --force enable

# 5. Enable automatic security updates
dpkg-reconfigure --priority=low unattended-upgrades

echo "✅ Linux hardening complete. Please test non-root login and ensure firewall is active."
