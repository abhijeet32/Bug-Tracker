## Project Overview

- **Language:** TypeScript  
- **Build System:** Docker  
- **CI/CD:** GitHub Actions  
- **Container Registry:** GitHub Container Registry (GHCR)  
- **Deployment:** Minikube (Kubernetes)

## Setup Instructions
### Prerequisites
Make sure the following tools are installed on your system:

- [Node.js](https://nodejs.org/) 
- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [GitHub CLI](https://cli.github.com/) (optional, for GHCR login)

## Run Locally
### 1. Clone the repository
```bash
git clone https://github.com/abhijeet32/bug-tracker.git
```
### 2. Getting Started
First, run the development server:

```bash
npm install (Install dependencies)
npm run dev (Run locally)
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Docker Setup
### 1. Build Docker Image
```bash
docker build -t ghcr.io/<github-username-or-org>/<image-name>:<version-tag>
```

### 2. Run the container
```bash
docker images
docker run -it -p 3000:3000 <image-id>
```
Now visit http://localhost:3000 .

## GitHub Actions
#### This project uses GitHub Actions to automatically:
 1. Build the Docker image on every commit.
 2. Push the built image to GitHub Container Registry (GHCR).

### 1. Workflow File: [workflow file](https://github.com/abhijeet32/bug-tracker/blob/main/.github/workflows/ci.yaml)

### 2. After a successful workflow run, the image is available at: [IMAGE](https://github.com/users/abhijeet32/packages/container/package/bug-tracker)

## Deploy to Minikube
### 1. Start Minikube
```bash
minikube start
```

### 2. Create Kubernetes Deployments

1. deployment.yaml
2. service.yaml

### 3. Apply it
```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

## Access the Deployed Application
Once the pod is running, expose it using Minikube:
```bash
minikube service <service-name>
```
This command will open the application in your default browser or displays the URL

## Clean Up
To remove everything:
```bash
kubectl delete deploy <deployment-name>
kubectl delete svc <service-name>

minikube stop
```