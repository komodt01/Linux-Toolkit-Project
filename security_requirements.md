# Security Requirements – Linux Security Hardening Lab

## Purpose

This document defines the security requirements explored through the Linux Security Hardening Lab.

The lab focuses on foundational host-security controls and Bash-based automation. It is not intended to represent a complete enterprise Linux hardening standard.

## Security Objectives

The lab is designed to:

- Reduce unnecessary privileged access
- Restrict unnecessary inbound network connectivity
- Support timely operating-system security updates
- Establish basic protection against repeated authentication attempts
- Provide basic visibility into host health and control status
- Improve consistency through repeatable configuration

## Administrative Access

### Requirement

Remote administration should not rely on direct root login.

### Implemented Control

The setup script:

- Creates a non-root administrative user
- Adds the user to the `sudo` group
- Configures SSH to disable remote root login
- Validates the SSH configuration before restarting the service

### Production Considerations

A production baseline should additionally define:

- Approved SSH authentication methods
- Administrative source-network restrictions
- Privileged access requirements
- MFA or identity-aware administrative access where appropriate
- Administrative session logging

## Host Firewall

### Requirement

Inbound network access should be denied by default and explicitly permitted only when required.

### Implemented Control

UFW is configured to:

- Deny inbound traffic by default
- Allow outbound traffic by default
- Permit SSH
- Permit HTTP
- Permit HTTPS

### Production Considerations

Production firewall rules should be derived from the workload's actual communication requirements rather than enabling standard service ports by default.

Network controls should also be coordinated with cloud-level controls such as security groups, network ACLs, and segmentation policies.

## Security Updates

### Requirement

The operating system should receive security updates in a consistent manner.

### Implemented Control

The lab installs and enables Ubuntu's unattended-upgrades capability.

### Production Considerations

Enterprise patch management should also address:

- Testing and deployment windows
- Application compatibility
- Reboot requirements
- Patch exceptions
- Vulnerability prioritization
- Verification that required updates were successfully applied

## Authentication Protection

### Requirement

Linux hosts should include controls that help reduce exposure to repeated authentication attempts.

### Implemented Control

Fail2ban is installed as part of the lab.

The lab does not define custom Fail2ban jail policies.

### Production Considerations

Production use would require validated policies appropriate to the workload, authentication method, logging configuration, and organizational security requirements.

## Host Visibility

### Requirement

Administrators should be able to verify basic host health and the status of selected security controls.

### Implemented Control

The health-check script reports:

- System uptime and load
- Disk utilization
- Memory utilization
- High-memory processes
- UFW status
- Fail2ban service status
- Unattended-upgrades status

### Limitation

This is local operational visibility. It does not provide centralized logging, security analytics, alerting, or SIEM capabilities.

## Control Verification

Security automation should not assume that a command executing successfully proves that the intended security outcome remains effective.

Production environments should independently verify important controls such as:

- SSH configuration
- Firewall policy
- Patch status
- Security-service operation
- Unauthorized configuration changes

## Residual Risk

The lab does not eliminate host-security risk.

Remaining risks include:

- Compromise of an authorized administrative account
- Excessive sudo privileges
- Unnecessary service exposure
- Vulnerable applications running on the host
- Local log tampering
- Configuration drift
- Missing centralized detection
- Failure or misconfiguration of installed security services

## Production Security Baseline

A production Linux hardening standard would typically extend beyond this lab to include areas such as:

- Formal CIS Benchmark assessment
- Centralized logging and alerting
- Audit logging
- File-integrity monitoring
- Vulnerability management
- Configuration management and drift detection
- Secrets management
- Privileged-access governance
- Endpoint security controls
- Backup and recovery requirements

## Security Principle

> Host hardening is one layer of defense. Operating-system controls should complement identity, network, workload, monitoring, and cloud-platform security controls rather than operate in isolation.
