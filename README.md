# 🚀 Flask App Deployment on Minikube

This repository provides two methods to deploy a Flask application to a local Kubernetes cluster using **Minikube**:

- ✅ **Method 1**: Using Kubernetes YAML files
- ✅ **Method 2**: Using Terraform

---

## 📁 Project Structure

├── app/ # Flask app source code
├── k8s/ # Kubernetes YAML manifests
│ ├── deployment.yaml
│ └── service.yaml
├── terraform/ # Terraform configuration
│ ├── main.tf
│ ├── provider.tf
│ ├── variables.tf
│ └── terraform.tfvars
├── deploy_with_k8s.sh # Bash script to deploy using Kubernetes YAML
├── deploy.sh # Bash script to deploy using Terraform
└── README.md


---

## 🧰 Prerequisites

- [Docker](https://www.docker.com/)
- [Minikube](https://minikube.sigs.k8s.io/docs/)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Terraform](https://developer.hashicorp.com/terraform/downloads)

---

## 🚀 Method 1: Deploy with Kubernetes YAML

### 📜 Description

This method uses raw Kubernetes YAML files (`deployment.yaml`, `service.yaml`) to deploy your app.

### 🔧 Steps

1. **Start Minikube**

```bash
minikube start
./deploy_with_k8s.sh
```

## ⚙️ Method 2: Deploy with Terraform

### 📜 Description

This method uses Terraform to define and deploy Kubernetes resources.

### 🔧 Steps
Start Minikube

```bash
minikube start
```
Build the Docker image in Minikube

This is done automatically by the deploy script.

Run the Terraform deployment

./deploy.sh
This script will:

Switch to Minikube's Docker daemon

Build flask-k8s-app:latest locally inside Minikube

Initialize and apply the Terraform code

Open the service in your browser

🧹 Clean Up
To remove all resources created by Terraform:

bash
Copy
Edit
cd terraform
terraform destroy -auto-approve
🧾 Notes
The image flask-k8s-app:latest is built locally inside Minikube, so no imagePull is necessary.

Ensure you're running Minikube and have the context switched before applying Terraform.

📬 Author
Dinesh Ravi
GitHub Profile
