#!/bin/bash

PURPLE="\e[1;35m"
YELLOW="\e[1;33m"
ENDCOLOR="\e[0m"

echo -e "${PURPLE}--------- ${YELLOW}Creating \"iot\" cluster ${PURPLE}---------${ENDCOLOR}"

sudo k3d cluster delete iot
sudo k3d cluster create iot

echo -e "${PURPLE}--------- ${YELLOW}Creating namespaces ${PURPLE}---------${ENDCOLOR}"

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo -e "${PURPLE}--------- ${YELLOW}Installing argocd ${PURPLE}---------${ENDCOLOR}"

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo -e "${PURPLE}--------- ${YELLOW}Waiting for all pods to start. ${PURPLE}---------${ENDCOLOR}"

ready=$(sudo kubectl get pods -n argocd | grep Running | wc -l)

while [ $ready != 7 ]
do
    echo "$ready/7 pods are running"
    sleep 10
    ready=$(sudo kubectl get pods -n argocd | grep Running | wc -l)
done

echo -e "${PURPLE}--------- ${YELLOW}All pods started. ${PURPLE}---------${ENDCOLOR}"
echo -e "${PURPLE}--------- ${YELLOW}Forwarding server port ${PURPLE}---------${ENDCOLOR}"

sudo kubectl port-forward -n argocd svc/argocd-server 8080:443 &

echo -e "${PURPLE}--------- ${YELLOW}You can now connect on localhost:8080 ${PURPLE}---------${ENDCOLOR}"
echo -e "${PURPLE}--------- ${YELLOW}Default credentials : admin:$(sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) ${PURPLE}---------${ENDCOLOR}"

argocd app create wil --repo https://github.com/Kalinololo/asebrech-iot-deploy --dest-server https://kubernetes.default.svc --dest-namespace argocd
