#!/bin/bash

PURPLE="\e[1;35m"
YELLOW="\e[1;33m"
ENDCOLOR="\e[0m"

echo -e "${PURPLE}---------------------------------------- ${YELLOW}DOCKER${PURPLE} ----------------------------------------------------${ENDCOLOR}"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
rm get-docker.sh

echo -e "${PURPLE}---------------------------------------- ${YELLOW}K3D${PURPLE} ----------------------------------------------------${ENDCOLOR}"

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo -e "${PURPLE}---------------------------------------- ${YELLOW}KUBECTL${PURPLE} ----------------------------------------------------${ENDCOLOR}"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo -e "${PURPLE}---------------------------------------- ${YELLOW}ARGOCD CLI${PURPLE} ----------------------------------------------------${ENDCOLOR}"

curl -Lo argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
