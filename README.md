# 🛡️ Linux Security & Automation Toolkit

## 📌 Project Overview
This project provides an automated Linux hardening and monitoring toolkit designed for EC2 instances, on-premises virtual machines, and hybrid environments. It establishes a secure baseline using Bash automation to enforce consistent, repeatable host-level controls aligned with enterprise and compliance standards.

## 💼 Business Value
Misconfigured Linux hosts are a common source of security incidents. This toolkit reduces operational and security risk by automating core protections:
- SSH hardening (disabling root login)
- Host-based firewall enforcement
- Intrusion detection with fail2ban
- Automated security updates
- Ongoing system health monitoring

The approach supports compliance with **NIST 800-53**, **CIS Benchmarks**, **PCI-DSS**, and internal cloud governance frameworks.

## 🧰 Features
- Creates a non-root administrative user with sudo privileges
- Configures UFW with a default-deny policy
- Enables unattended security updates
- Installs and configures fail2ban for SSH brute-force protection
- Generates hourly performance and security logs via cron

## 🧠 Linux Command Reference Guide
| Command or Script Line | What It Does |
|------------------------|--------------|
| `adduser` | Creates a new user on the system |
| `usermod -aG sudo` | Grants administrative privileges |
| `sed -i ...` | Hardens SSH configuration (e.g., root login disabled) |
| `systemctl restart ssh` | Applies updated SSH settings |
| `apt update && apt install -y ...` | Updates the system and installs required packages |
| `ufw allow ssh/http/https` | Defines allowed network traffic |
| `ufw --force enable` | Enables host-based firewall |
| `dpkg-reconfigure unattended-upgrades` | Enables automatic security patching |
| `crontab` | Schedules recurring automation tasks |

## 📝 How to Use
1. Upload `setup.sh` and `healthcheck.sh` to your VM.
2. Make scripts executable:  
   ```bash
   chmod +x setup.sh healthcheck.sh
