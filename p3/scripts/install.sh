echo "---------------------------------------- DOCKER ----------------------------------------------------"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh ./get-docker.sh --dry-run
rm get-docker.sh

echo "---------------------------------------- K3D ----------------------------------------------------"

curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash

echo "---------------------------------------- KUBECTL ----------------------------------------------------"

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
rm kubectl

echo "---------------------------------------- ARGOCD CLI ----------------------------------------------------"

curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64
