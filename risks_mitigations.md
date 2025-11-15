# Risks and Mitigations

The following risks apply to Linux host deployments and operational security when using automated hardening scripts.

| Risk | Impact | Likelihood | Mitigation |
|------|--------|------------|------------|
| Weak or misconfigured SSH settings | Unauthorized access, credential compromise | Medium | SSH hardening, key-based access, root login disabled |
| Firewall misconfiguration | Accidental exposure of services | Medium | UFW default-deny policy + explicit allow rules |
| Missing or incomplete logs | Reduced forensic and investigative capability | Low | Enable log retention, forward to CloudWatch or SIEM if required |
| Outdated system packages | Vulnerability exposure | Medium | Automated security updates via unattended-upgrades |
| Fail2ban misconfiguration | Ineffective intrusion detection | Low | Validate jail configuration, test brute-force simulation |
| Cost overrun from log forwarding or CloudWatch | Unnecessary spend | Low | Use local logging unless centralization is required |
