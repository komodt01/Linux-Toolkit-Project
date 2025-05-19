# Project Summary: Linux Security & Automation Toolkit

## 🔍 Problem Statement
Linux servers are frequently launched without proper security configuration, leaving organizations exposed to brute-force attacks, misconfigured SSH settings, and unmonitored performance issues.

## 🎯 Project Definition
This project automates security hardening for a Linux EC2 instance using Bash scripts. It focuses on OS-level protections that can be adapted to multiple environments and reused in cloud provisioning workflows.

## 🎯 Goals
- Disable insecure defaults (e.g., root SSH access)
- Enforce UFW-based firewall rules
- Install and configure intrusion detection tools (fail2ban)
- Set up automated updates and performance logging
- Demonstrate alignment with NIST 800-53 and CIS hardening recommendations

## 🛠️ Methodology
- Provisioned Ubuntu EC2 instance in AWS
- Connected securely using SSH and `.pem` key
- Created and executed `setup.sh` and `healthcheck.sh`
- Configured cron job to run health check hourly

## ✅ Results
- System hardened with UFW, auto-updates, fail2ban
- Root SSH login disabled
- Hourly logs being generated and stored for monitoring

## 📌 Recommendations
- Integrate into Packer or cloud-init for automation
- Expand to support RHEL/CentOS environments
- Visualize logs using Grafana or send to CloudWatch/SIEM

