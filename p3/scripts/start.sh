echo "--------- Creating \"iot\" cluster---------"

sudo k3d cluster delete iot
sudo k3d cluster create iot

echo "--------- Creating namespaces ---------"

sudo kubectl create namespace argocd
sudo kubectl create namespace dev

echo "--------- Installing argocd ---------"

sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "--------- Waiting for all pods to start. ---------"

ready=$(sudo kubectl get pods -n argocd | grep Running | wc -l)

while [ $ready != 7 ]
do
    echo "$ready/7 pods are running"
    sleep 10
    ready=$(sudo kubectl get pods -n argocd | grep Running | wc -l)
done

echo "--------- All pods started. ---------"
echo "--------- Forwarding server port ---------"

sudo kubectl port-forward -n argocd svc/argocd-server 8080:443 &

echo "--------- You can now connect on localhost:8080 ---------"
echo "--------- Default credentials : admin:$(sudo kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) ---------"

argocd app create wil --repo https://github.com/Kalinololo/asebrech-iot-deploy --dest-server https://kubernetes.default.svc --dest-namespace argocd
