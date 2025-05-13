#!/bin/bash

set -e

APP_NAME="flask-app"
IMAGE_NAME="flask-k8s-app:latest"

echo "🔁 Switching to Minikube Docker daemon..."
eval $(minikube docker-env)

echo "🐳 Building Docker image inside Minikube..."
docker build -t $IMAGE_NAME ./app

echo "📁 Switching to Terraform directory..."
cd terraform

echo "📦 Initializing Terraform..."
terraform init -input=false

echo "🧹 Cleaning up old resources (if any)..."
terraform destroy -auto-approve || true

echo "🚀 Applying Terraform to deploy Kubernetes resources..."
terraform apply -auto-approve

echo "🌐 Exposing the Flask app via Minikube service..."
minikube service ${APP_NAME}-service
