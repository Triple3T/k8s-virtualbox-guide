curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.3/manifests/calico.yaml -LO
kubectl apply -f calico.yaml
