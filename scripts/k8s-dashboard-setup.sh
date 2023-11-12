kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
curl https://triple-lab.com/k8s-dashboard-service-account.yaml -LO
kubectl apply -f k8s-dashboard-service-account.yaml
