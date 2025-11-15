# Security Requirements  
_Project:_ **Linux Security Toolkit**  
_Generated:_ 2025-11-13  
_Cloud:_ AWS (EC2 Linux-based systems)

## 1. Security Objectives
- Protect system integrity by enforcing consistent OS-level hardening  
- Maintain confidentiality via secure SSH access and restricted network boundaries  
- Ensure availability through automated updates and health monitoring  
- Improve auditability with recurring log generation  
- Reduce misconfiguration risk through repeatable automation  

## 2. Derived Requirements
| Category | Requirement |
|----------|-------------|
| Identity & Access | Disable root login; enforce key-based SSH; least-privilege sudo |
| Data Protection | Encrypt SSH traffic; secure permissions on scripts/logs |
| Network Security | Default-deny firewall; allowlist required service ports only |
| Monitoring | Periodic health checks; track auth events; optional log forwarding |
| Governance | Documented procedures; automation through scripts for consistency |

## 3. Controls Implemented
- Host-level SSH hardening (`sshd_config` modifications)  
- Non-root administrative user creation  
- UFW firewall with minimal inbound allowlist  
- Installation and configuration of fail2ban  
- Automated security patching via unattended-upgrades  
- Hourly system health monitoring via cron  
- Local log retention for operational review  

## 4. Residual Risks & Mitigations
- **Risk:** Local logs only (no central SIEM)  
  **Mitigation:** Optional integration with CloudWatch or Elastic Stack  

- **Risk:** Manual deployment of scripts may vary across environments  
  **Mitigation:** Package scripts into a Packer image or cloud-init for consistency  

- **Risk:** UFW may not cover advanced use cases  
  **Mitigation:** Migrate to iptables/nftables where granular control is required  
