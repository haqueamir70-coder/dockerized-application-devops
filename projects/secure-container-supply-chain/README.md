<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0F172A,45:2563EB,100:06B6D4&height=180&section=header&text=Secure%20Container%20Supply%20Chain&fontSize=32&fontColor=ffffff&animation=fadeIn" alt="Secure container supply chain banner" width="100%" />

<img src="https://readme-typing-svg.demolab.com/?font=Fira+Code&weight=600&size=16&pause=1000&color=00C7FF&center=true&vCenter=true&width=800&height=35&lines=Build+%E2%86%92+Scan+%E2%86%92+SBOM+%E2%86%92+Review;Shift-left+container+security" alt="Animated project tagline" />

[![Docker](https://img.shields.io/badge/Docker-Container-2496ED?style=for-the-badge&logo=docker&logoColor=white)](https://docs.docker.com/)
[![GitHub Actions](https://img.shields.io/badge/GitHub-Actions-2088FF?style=for-the-badge&logo=githubactions&logoColor=white)](https://docs.github.com/actions)
[![Security](https://img.shields.io/badge/Security-Trivy%20%7C%20SBOM-16A34A?style=for-the-badge&logo=owasp&logoColor=white)](https://trivy.dev/)

</div>

# Secure Container Supply Chain

A hands-on portfolio lab demonstrating how to add container security checks to a CI workflow. This project focuses on building an image, scanning for known vulnerabilities, generating a software bill of materials (SBOM), and reviewing results before release.

## Architecture

```mermaid
flowchart TD
  A[Code change / Pull Request] --> B[Build container image]
  B --> C[Trivy vulnerability scan]
  B --> D[Generate SBOM]
  C --> E{Findings reviewed?}
  D --> F[Attach SBOM artifact]
  E -- No critical/high findings or exception approved --> G[Manual release decision]
  E -- Findings need action --> H[Fix or document exception]
  H --> B
  F --> G
```

## Goals

- Add an image vulnerability scan to pull-request CI.
- Generate an SBOM as a build artifact.
- Keep workflow permissions minimal.
- Fail the security step on configured severity thresholds.
- Make findings visible for review rather than silently suppressing them.

## Included workflow

The parent repository's `.github/workflows/container-security.yml` is designed to build the repository's Docker image, run Trivy, and publish an SBOM artifact for review. Check the Actions tab for the latest run and read the workflow file to confirm the exact behavior.

## Run locally

From the parent repository root:

```bash
docker build -t secure-container-supply-chain:local .
docker run --rm -p 8080:80 secure-container-supply-chain:local
```

Scan locally if Trivy is installed:

```bash
trivy image --severity HIGH,CRITICAL secure-container-supply-chain:local
```

## Security notes

- Vulnerability scanners can produce false positives and do not prove an image is safe.
- Review base-image freshness, application dependencies, and the actual fix availability.
- Avoid placing credentials in Docker build arguments or image layers.
- For a real release pipeline, pin third-party Actions to reviewed immutable commit SHAs and use image digests for deployment.
- This is a portfolio lab, not a certified compliance control or a production security guarantee.

## Evidence checklist

- [ ] Successful workflow run on the default branch
- [ ] Reviewed Trivy output
- [ ] SBOM artifact generated and inspected
- [ ] Documented any accepted vulnerabilities and compensating controls
- [ ] Re-run after fixing findings
