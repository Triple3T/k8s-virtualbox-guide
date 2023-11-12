sudo kubeadm config images pull --cri-socket unix:///run/cri-dockerd.sock
sudo kubeadm init --apiserver-advertise-address <ip> --cri-socket /var/run/cri-dockerd.sock --pod-network-cidr=20.96.0.0/12
sudo kubeadm token create --print-join-command | sed 's/$/ --cri-socket \/var\/run\/cri-dockerd.sock/' > ~/join.sh
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
