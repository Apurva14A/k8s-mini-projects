#!/bin/bash


# Checking the health of K8s api
kubectl get --raw '/healthz/verbose'

# List all k8s APIs

kubectl get --raw /

