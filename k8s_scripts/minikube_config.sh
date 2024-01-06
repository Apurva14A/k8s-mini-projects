#!/usr/bin/bash


# Check if kubectl is installed
if ! [ -x "$(command -v kubectl)" ]; then
  echo "Installing kubectl..."
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  chmod +x minikube
  sudo mv minikube /usr/local/bin/
fi

# Check if minikube is installed
if ! [ -x "$(command -v minikube)" ]; then
  echo "Installing minikube..."
  curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
  chmod +x minikube
  sudo mv minikube /usr/local/bin/
fi

# Start minikube
minikube start

# Verify that minikube is running
kubectl get nodes
