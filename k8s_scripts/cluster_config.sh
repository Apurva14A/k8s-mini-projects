#!/usr/bin/bash

# ConfiGURING K8s CLuster 
# Step 1 - Set up each server in the cluster to run Kubernetes
# On each of the three Ubuntu 18.04 servers run the following commands as root, you can type the commands or highlight and copy/paste in the terminal window on the left:

# Download the Google Cloud public signing key:

  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

# Add the Kubernetes apt repository:

echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update apt package index with the new repository and install the utilities:

apt update
apt install -y kubelet=1.20.0-00 kubeadm=1.20.0-00 kubectl=1.20.0-00
apt-mark hold kubelet kubeadm kubectl

# install Docker

export VERSION=19.03 && curl -sSL get.docker.com | sh

