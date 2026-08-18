# 🚀 Dockerized Application DevOps

Enterprise-level containerized application deployment using Docker, GitHub Actions, Docker Hub, and Kubernetes.

---

## 📌 Project Overview

This project demonstrates a complete DevOps workflow for deploying a containerized web application.

The project includes:

- Application containerization using Docker
- Docker image management with Docker Hub
- Automated CI pipeline using GitHub Actions
- Kubernetes deployment and service configuration
- Cloud-native application architecture

---

# 🏗️ Application Architecture

---

# 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| Docker | Application Containerization |
| Docker Hub | Container Image Registry |
| GitHub Actions | CI/CD Automation |
| Kubernetes | Container Orchestration |
| YAML | Infrastructure Configuration |
| Nginx | Web Server |
| GitHub | Source Code Management |

---

# 📂 Project Structure

---

# 🐳 Docker Implementation

## Dockerfile

The application is packaged inside an Nginx container.

Docker Image:
```dockerfile
FROM nginx:latest

COPY app /usr/share/nginx/html

EXPOSE 80
```
Application files are copied into:

---
```text
Docker Build
      |
      v
Docker Login
      |
      v
Docker Push
      |
      v
Docker Hub Registry
```

```text
Code Commit
      |
      v
GitHub Actions Trigger
      |
      v
Build Docker Image
      |
      v
Push Image
      |
      v
Ready For Deployment
```
