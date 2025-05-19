# 🛡️ Linux Security & Automation Toolkit

## 📌 Project Overview
This project automates the initial hardening of a Linux-based system using Bash scripts. It creates a secure baseline for Linux virtual machines in AWS, on-premises, or hybrid environments.

## 💼 Business Value
This toolkit reduces misconfiguration risk by automating core hardening tasks: disabling root SSH login, installing fail2ban, enabling automatic updates, enforcing firewall rules, and monitoring system health. It's aligned with compliance best practices (NIST 800-53, PCI-DSS, CIS Benchmarks) and can be adapted to provisioning workflows or CI/CD pipelines.

## 🧰 Features
- Creates a non-root sudo user
- Configures UFW firewall
- Enables automatic security updates
- Installs `fail2ban` to detect brute-force attempts
- Logs system performance hourly via `cron`

## 🧠 Linux Command Reference Guide

| Command or Script Line                            | What It Does                                                                 |
|--------------------------------------------------|------------------------------------------------------------------------------|
| adduser                                           | Creates a new user on the system                                            |
| usermod -aG sudo                                  | Adds the new user to the 'sudo' group for admin rights                      |
| sed -i ...                                        | Edits the SSH config file to disable remote root login                      |
| systemctl restart ssh                            | Restarts the SSH service to apply the new config                            |
| apt update && apt install -y ...                 | Updates the system and installs packages like ufw and fail2ban              |
| ufw allow ssh/http/https                         | Configures the firewall to allow required ports                             |
| ufw --force enable                                | Enables the firewall without confirmation                                   |
| dpkg-reconfigure unattended-upgrades             | Enables automatic security updates                                          |
| crontab                                           | Schedules recurring tasks                                                   |

## 📝 How to Use
1. Upload `setup.sh` and `healthcheck.sh` to your Linux VM
2. Run `chmod +x setup.sh && sudo ./setup.sh`
3. Run `chmod +x healthcheck.sh`
4. Add to cron:  
```bash
(crontab -l 2>/dev/null; echo "0 * * * * /home/ubuntu/linux-toolkit/healthcheck.sh >> /home/ubuntu/healthlog.txt 2>&1") | crontab -
```

## 📈 Output
Hourly system health logs are saved to `healthlog.txt` and include CPU load, memory usage, disk space, and top processes.

## 📜 License
MIT License
