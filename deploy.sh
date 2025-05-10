#!/bin/bash

set -e

echo "🔁 Switching to Minikube's Docker daemon..."
eval $(minikube docker-env)

echo "🐳 Building Docker image inside Minikube..."
docker build -t flask-k8s-app:latest ./app

echo "🧹 Cleaning up old Kubernetes resources..."
kubectl delete deployment flask-app-deployment --ignore-not-found
kubectl delete service flask-app-service --ignore-not-found

echo "🚀 Applying Kubernetes manifests..."
kubectl apply -f ./k8s/deployment.yaml
kubectl apply -f ./k8s/service.yaml

echo "⏳ Waiting for pod to be ready..."
kubectl wait --for=condition=ready pod -l app=flask-app --timeout=60s

echo "🌐 Launching the app via Minikube service tunnel..."
minikube service flask-app-service
