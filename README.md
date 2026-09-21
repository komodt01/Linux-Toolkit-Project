# Linux Security Hardening Lab

## Overview

This hands-on lab explores foundational Linux host security using an Ubuntu EC2 instance and Bash automation.

The objective was to practice applying repeatable host-level security controls rather than relying entirely on manual configuration. The lab focuses on administrative access, host firewall rules, security updates, basic protective tooling, and system health visibility.

## Security Objectives

The lab focuses on several fundamental Linux security concerns:

- Reduce reliance on privileged root access
- Restrict unnecessary inbound network traffic
- Maintain current security updates
- Install protection against repeated authentication attempts
- Automate basic system health collection
- Make host-security configuration more repeatable

## Implemented Controls

### Administrative Access

The setup script:

- Creates a non-root administrative user
- Adds the user to the `sudo` group
- Disables remote root login through the SSH configuration

This reduces direct use of the root account for remote administration.

### Host Firewall

UFW is configured with:

- Default deny for inbound traffic
- Default allow for outbound traffic
- SSH permitted
- HTTP permitted
- HTTPS permitted

The firewall configuration demonstrates host-level network restriction while allowing the services used by the lab.

### Security Updates

The lab installs and enables Ubuntu's `unattended-upgrades` capability to support automated security patching.

### Fail2ban

Fail2ban is installed as part of the setup process.

The current implementation installs the package but does not define custom jail policies. Production use would require validating and configuring Fail2ban policies for the specific workload and authentication requirements.

### System Health Collection

`healthcheck.sh` collects:

- System uptime and CPU load
- Disk utilization
- Memory utilization
- Highest memory-consuming processes

The script can be scheduled through cron to provide recurring local system-health information.

This is basic operational visibility rather than centralized security monitoring or SIEM integration.

## Repository Structure

```text
Linux-Toolkit-Project/
├── README.md
├── setup.sh
├── healthcheck.sh
├── ufw-rules.sh
├── security_requirements.md
├── risks_mitigations.md
├── project_summary.md
├── .gitignore
└── LICENSE
