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
- Validates the SSH configuration before restarting the service

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

### System Health and Control Status

`healthcheck.sh` reports:

- System uptime and load
- Disk utilization
- Memory utilization
- Highest memory-consuming processes
- UFW status
- Fail2ban service status
- Unattended-upgrades status

This provides basic local operational visibility rather than centralized security monitoring, alerting, or SIEM integration.

## Repository Structure

```text
Linux-Toolkit-Project/
├── README.md
├── setup.sh
├── healthcheck.sh
├── security_requirements.md
├── risks_mitigations.md
├── project_summary.md
├── .gitignore
└── LICENSE
```

## Running the Lab

Make the scripts executable:

```bash
chmod +x setup.sh healthcheck.sh
```

Run the hardening setup with administrative privileges:

```bash
sudo ./setup.sh
```

Run the health check manually:

```bash
./healthcheck.sh
```

The health check can also be scheduled through cron for recurring execution.

## Security Considerations

This lab demonstrates foundational host-security controls. It is not intended to represent a complete production Linux security baseline.

A production implementation would require additional consideration of:

- Explicit SSH authentication policy
- Administrative source-network restrictions
- Privileged-access governance
- Fail2ban policy configuration and validation
- Centralized security logging and monitoring
- Audit logging
- File and directory permissions
- Configuration-drift detection
- Vulnerability management
- Secrets and credential management
- Workload-specific firewall requirements
- Formal CIS Benchmark validation

## Key Lessons

Host security is one layer of cloud security rather than a replacement for cloud-level controls.

Cloud identity, network controls, centralized logging, and security services do not eliminate the need to secure the operating system itself. Likewise, host controls should complement protections implemented elsewhere in the architecture.

The lab also reinforces an important security principle:

> Applying a security control and verifying that the control remains effective are separate responsibilities.

Automation can improve consistency, but automated configuration should only be considered effective when the resulting security state can also be validated.

## Lab Scope

This repository is intentionally a focused hands-on lab. It demonstrates Linux security fundamentals and Bash-based automation rather than a complete enterprise hardening framework.

The value of the exercise is understanding how foundational host controls work, how they can be automated, and where additional controls would be required for production use.
