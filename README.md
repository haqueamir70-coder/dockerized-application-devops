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

Application files are copied into:

---
## Build Docker Image

```bash
docker build -t docker-devops-app .
docker run -p 80:80 docker-devops-app
http://localhost


amiruldevops/dockerized-application-devops

Docker Build
      |
      ↓
Docker Login
      |
      ↓
Docker Push
      |
      ↓
Docker Hub Registry
