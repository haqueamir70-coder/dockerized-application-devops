# Kubernetes Deployment Guide

This repository separates manifest validation from a real cluster deployment. The GitHub Actions workflow `.github/workflows/kubernetes-deploy.yml` validates YAML/basic structure without cluster access. The guarded manual deployment workflow is `.github/workflows/kubernetes-manual-deploy.yml`.

## Security hardening included

- Runs the Nginx unprivileged image as UID/GID 101.
- Uses a read-only root filesystem, drops Linux capabilities, disables privilege escalation, and applies the RuntimeDefault seccomp profile.
- Adds startup, readiness, and liveness probes plus CPU/memory requests and limits.
- Disables automatic ServiceAccount token mounting.
- Uses a ClusterIP Service by default to avoid creating a billable public load balancer automatically.

## Configure a real deployment

1. Create or choose a **non-production test cluster** first. Confirm its context and access controls.
2. In GitHub, open **Settings → Environments** and create an environment named `kubernetes`.
3. Create a dedicated, least-privilege Kubernetes identity that can manage only the resources needed in the `docker-app` namespace. Avoid cluster-admin credentials.
4. Store the kubeconfig encoded as base64 in the environment secret named `KUBE_CONFIG_DATA`. Never commit kubeconfig files or tokens to the repository.
5. Confirm the image is published and pullable by the cluster. The Docker Build CI workflow currently publishes `amiruldevops/dockerized-application-devops:latest`; immutable SHA tags are preferable for production.
6. Open **Actions → Kubernetes Manual Deploy → Run workflow** and enter `deploy` in the confirmation field. The workflow performs server-side dry-run validation, applies manifests, waits for rollout, and reports resource status.
7. Verify the app with `kubectl get pods,svc -n docker-app` and `kubectl rollout status deployment/dockerized-app -n docker-app`.

## Encode kubeconfig

Linux/macOS:

```bash
base64 -w 0 ~/.kube/config
```

PowerShell:

```powershell
[Convert]::ToBase64String([IO.File]::ReadAllBytes("$HOME\.kube\config"))
```

Treat the output as a secret. Prefer a dedicated, narrowly scoped kubeconfig over a personal admin kubeconfig.

## Access the app

The default Service is `ClusterIP`, so it is internal to the cluster. For a local test, use port-forwarding:

```bash
kubectl port-forward -n docker-app service/dockerized-app-service 8080:80
```

Then open `http://localhost:8080`. Do not change to `LoadBalancer` unless public exposure is intended and the cloud cost/network policy has been reviewed.

## Scope and honest status

Manifest CI validates YAML structure. A real deployment is **not confirmed** until a cluster, credentials, image pull access, and a successful manual workflow run are configured. This guide does not claim that any cluster has already been provisioned.
