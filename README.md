# snyk-test-kitchen (intentionally vulnerable)
This repo is **intentionally vulnerable** for testing Snyk CLI (SCA/SAST), SBOM tools (e.g., `snyk sbom`, `syft`), and container scanners.

> **Warning**: Do **not** deploy anywhere public. Use only in an isolated lab.

## Quick start
```bash
# Authenticate once
snyk auth

# SCA: scan dependencies for all projects
snyk test --all-projects

# Monitor projects in Snyk (dashboards & PRs)
snyk monitor --all-projects

# SAST: scan source code (JS, Python, Go, Java)
snyk code test

# SBOM (CycloneDX JSON) for the whole repo
snyk sbom --all-projects --format=cyclonedx1.4+json --output-file=sbom-cdx.json

# Container scans (build images first)
docker build -t stk-node ./vulnerable-node
docker build -t stk-python ./vulnerable-python
snyk container test stk-node
snyk container test stk-python
```

## Projects included
- **vulnerable-node**: old dependencies + insecure Dockerfile.
- **vulnerable-python**: outdated libs + insecure Dockerfile.
- **vulnerable-java**: Log4j 2.14.1 + Spring 5.2 line (known CVEs).
- **vulnerable-go**: old `gorilla/websocket` with known CVEs.
- **k8s-manifests**: insecure securityContext & permissive settings.
- **iac-terraform**: insecure AWS security group & S3 bucket settings (for IaC scanning).

All examples are minimal to trigger findings without requiring external services.
