# Risks and Mitigations – Linux Security Hardening Lab

## Purpose

This document identifies security risks addressed by the lab, the controls used to reduce those risks, and the risks that remain outside the scope of the implementation.

| Risk | Potential Impact | Lab Control | Remaining Consideration |
|---|---|---|---|
| Direct remote root access | Increased impact from credential compromise or unauthorized access | Remote root login disabled | Authorized administrative accounts can still be compromised |
| Unnecessary inbound network exposure | Unauthorized access to host services | UFW default-deny inbound policy with explicit allowed services | Allowed ports must still be justified for the workload |
| Missing security updates | Exposure to known vulnerabilities | Unattended upgrades enabled | Production environments require patch verification, testing, and exception management |
| Repeated authentication attempts | Increased likelihood of unauthorized access | Fail2ban installed | Custom jail policies and validation are not implemented in this lab |
| Host resource exhaustion | Availability or performance degradation | Health check reports CPU/load, memory, disk, and high-memory processes | No automated alerting or centralized monitoring is implemented |
| Security-control failure or drift | Host may no longer meet the intended baseline | Health check reports status of selected controls | Continuous configuration assessment and drift remediation are outside the lab scope |
| Local-only visibility | Security events may not be detected or correlated centrally | Basic local health and control-status checks | Production environments should forward relevant security telemetry to centralized monitoring |
| Excessive administrative privilege | Compromised admin account could affect the entire host | Non-root administrative account used instead of direct root login | Sudo privileges are broad and would require stronger governance in production |

## Defense in Depth

The controls in this lab operate at the Linux host layer.

They should complement rather than replace:

- Cloud network controls
- Identity and access management
- Centralized logging and detection
- Vulnerability management
- Secrets management
- Configuration management
- Workload-specific security controls

## Residual Risk

Even after the lab controls are applied, compromise remains possible through an authorized account, vulnerable application, misconfigured service, excessive privilege, or failure of a security control.

A production architecture would therefore require additional preventive and detective controls beyond host hardening.

## Key Security Principle

> Hardening reduces attack surface, but it does not eliminate risk. Security architecture must also provide a way to verify that controls remain effective and detect when they fail.
