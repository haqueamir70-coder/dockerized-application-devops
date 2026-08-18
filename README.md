# 🚀 Dockerized Application DevOps

Enterprise-level containerized application deployment using Docker, GitHub Actions, Docker Hub, and Kubernetes.

---

# 📌 Project Overview

This project demonstrates a complete DevOps workflow for deploying a containerized web application.

The project includes:

- Application containerization using Docker
- Docker image management with Docker Hub
- Automated CI pipeline using GitHub Actions
- Kubernetes deployment and service configuration
- Cloud-native application architecture

---

# 🏗️ Application Architecture

```text
Developer
    |
    v
GitHub Repository
    |
    v
GitHub Actions CI/CD
    |
    v
Docker Build
    |
    v
Docker Hub Registry
    |
    v
Kubernetes Cluster
    |
    v
Running Application
```

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

```text
dockerized-application-devops

│
├── app
│   └── index.html
│
├── kubernetes
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
│
├── .github
│   └── workflows
│       └── docker-build.yml
│
├── Dockerfile
├── docker-compose.yml
├── README.md
└── LICENSE
```

---

# 🐳 Docker Implementation

## Dockerfile

The application is packaged inside an Nginx container.

```dockerfile
FROM nginx:latest

COPY app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

---

# Build Docker Image

```bash
docker build -t docker-devops-app .
```

---

# Run Docker Container

```bash
docker run -p 80:80 docker-devops-app
```

Application URL:

```
http://localhost
```

---

# Docker Hub Image

Docker image is pushed to Docker Hub:

```
amiruldevops/dockerized-application-devops
```

---

# 🐳 Docker Workflow

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

---

# ⚙️ CI/CD Pipeline

GitHub Actions automatically performs:

✅ Checkout Repository  
✅ Build Docker Image  
✅ Login to Docker Hub  
✅ Push Image to Docker Hub  

Workflow:

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

---

# ☸️ Kubernetes Deployment

Kubernetes configuration files:

```text
kubernetes/

├── namespace.yaml
├── deployment.yaml
└── service.yaml
```

## Namespace

Creates an isolated Kubernetes environment.

## Deployment

Features:

- 3 replicas
- Docker Hub image deployment
- Container port 80

## Service

Features:

- LoadBalancer service
- External application access

---

# 🚀 Deployment Flow

```text
Developer
    |
    v
Push Code To GitHub
    |
    v
GitHub Actions Runs
    |
    v
Docker Image Created
    |
    v
Image Uploaded To Docker Hub
    |
    v
Kubernetes Pulls Image
    |
    v
Application Deployed
```

---

# 🔮 Future Improvements

- Kubernetes CI/CD deployment automation
- Helm Charts
- Monitoring with Prometheus & Grafana
- Infrastructure as Code using Terraform
- Cloud deployment on AWS/Azure

---

# 👨‍💻 Author

**Amirul DevOps**

DevOps Engineer Portfolio Project
