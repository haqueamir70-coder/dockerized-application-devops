# Container and Kubernetes Security Checklist

Use this checklist to review the current Dockerfile, workflow, and Kubernetes manifests. Items are recommendations until verified in code and a successful test run.

## Image build
- [ ] Use a small, maintained base image and update it regularly.
- [ ] Pin production image versions; avoid relying on mutable latest tags.
- [ ] Run the application as a non-root user where the workload allows it.
- [ ] Use multi-stage builds when compiling or packaging application code.
- [ ] Add image vulnerability scanning and review critical/high findings.
- [ ] Generate an SBOM and retain it with the build artifact when practical.
- [ ] Avoid copying secrets into image layers; inject secrets at runtime.

## CI/CD
- [ ] Grant workflow permissions only as needed; set minimal GitHub token permissions.
- [ ] Pin third-party Actions to reviewed versions or immutable SHAs.
- [ ] Use short-lived registry/cloud identity where supported.
- [ ] Scan before publishing and use immutable image digests for deployment.
- [ ] Protect release and deployment environments with approval rules.

## Kubernetes
- [ ] Set CPU/memory requests and limits.
- [ ] Define readiness and liveness probes appropriate to the application.
- [ ] Set runAsNonRoot, allowPrivilegeEscalation: false, and drop unnecessary Linux capabilities where compatible.
- [ ] Use a read-only root filesystem when possible.
- [ ] Avoid privileged containers and hostPath mounts unless justified.
- [ ] Apply NetworkPolicies when the cluster CNI enforces them.
- [ ] Use namespace-scoped RBAC and workload identity for cloud access.
- [ ] Configure logs, metrics, alerts, and resource quotas.

## Validation evidence
Record commit SHA, scanner versions, test output, and unresolved findings. A checklist is not proof that a control is configured.
