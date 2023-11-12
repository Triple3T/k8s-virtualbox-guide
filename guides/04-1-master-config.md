## 4-1. 마스터 노드 설정

VM 중 `k8s-master`에만, 아래 명령어를 한 줄씩 실행하십시오. `<ip>` 자리에는 `k8s-master`에 지정한 IP 주소를 입력하십시오.
[master-config.sh](/scripts/master-config.sh)에서 다운받고 수정 후 실행해도 됩니다.

```shell
sudo kubeadm config images pull --cri-socket unix:///run/cri-dockerd.sock
sudo kubeadm init --apiserver-advertise-address <ip> --cri-socket /var/run/cri-dockerd.sock --pod-network-cidr=20.96.0.0/12
sudo kubeadm token create --print-join-command | sed 's/$/ --cri-socket \/var\/run\/cri-dockerd.sock/' > ~/join.sh
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

`sudo` 명령어가 포함되어 있으므로 비밀번호를 요구할 수 있습니다.

모두 성공했다면 ssh 연결이 되지 않은 cmd에서 아래 명령어를 입력해 join 명령어와 config 파일을 가져옵니다.
현재 cmd에서 `k8s-master`와의 ssh 연결을 끊고 진행해도 무방합니다.

아래 명령어에서 `<master-username>` 자리에는 `k8s-master`의 username을, `<msater-ip>` 자리에는 `k8s-master`에 지정한 IP 주소를 입력하십시오.

```shell
scp <master-username>@<master-ip>:/home/<master-username>/join.sh join.sh
scp <master-username>@<master-ip>:/home/<master-username>/.kube/config cfg
```

비밀번호를 요구할 수 있습니다.

완료했다면 현재 폴더에 `join.sh` 파일과 `cfg` 파일이 저장됩니다.
