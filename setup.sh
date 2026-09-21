#!/bin/bash

# Linux Security Hardening Lab
# Applies foundational host-security controls to an Ubuntu system.

set -e

USERNAME="clouduser"

# 1. Create a non-root administrative user if it does not already exist.
if ! id "$USERNAME" &>/dev/null; then
    adduser --disabled-password --gecos "" "$USERNAME"
fi

usermod -aG sudo "$USERNAME"

# 2. Disable remote root login.
if grep -qE '^[#[:space:]]*PermitRootLogin' /etc/ssh/sshd_config; then
    sed -i 's/^[#[:space:]]*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
else
    echo "PermitRootLogin no" >> /etc/ssh/sshd_config
fi

# Validate SSH configuration before restarting the service.
sshd -t
systemctl restart ssh

# 3. Install security packages.
apt update
apt install -y ufw fail2ban unattended-upgrades

# 4. Configure the host firewall.
ufw default deny incoming
ufw default allow outgoing
ufw allow ssh
ufw allow http
ufw allow https
ufw --force enable

# 5. Enable unattended security updates.
dpkg-reconfigure --priority=low unattended-upgrades

echo "Linux hardening complete."
echo "Verify non-root administrative access before ending the current session."
echo "Fail2ban is installed; custom jail configuration is outside this lab's scope."
