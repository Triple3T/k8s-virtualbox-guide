## 4-2. 워커 노드 설정

### Master 노드에 Join

VM 중 `k8s-msater`를 제외한 나머지를 `k8s-master`에 연동시켜야 합니다.

우선 아래 명령어를 cmd에 입력해 `k8s-master`에서 가져온 `join.sh` 파일과 `cfg` 파일을 `k8s-master`를 제외한 각 노드에 넣어 주십시오. 아래 명령어에서 `<node-username>` 자리에는 해당 노드의 username을, `<node-ip>`에는 해당 노드에 지정한 IP 주소를 입력하십시오.

```shell
scp join.sh <node-username>@<node-ip>:/home/<node-username>/join.sh
scp cfg <node-username>@<node-ip>:/home/<node-username>/admin.conf
```

완료했다면 각 노드 VM에 `join.sh` 파일과 `admin.conf` 파일이 저장됩니다.
이후, 각 노드에 ssh로 연결하고 다음을 실행하십시오. 각 줄의 실행이 성공한 것을 확인한 후 다음 줄을 실행하십시오.

```shell
sudo sh ./join.sh
mkdir -p $HOME/.kube
sudo cp -i ./admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

![img](/images/37.png)

`sudo sh ./join.sh` 명령이 성공했다면 위와 같이 `This node has joined the cluster` 문구가 출력됩니다.

### Join 명령이 실패한 경우

`sudo sh ./join.sh` 명령이 실패한 경우 아래를 참고해 `k8s-master`에서 파일을 다시 생성해야 합니다.

아래 명령을 `k8s-master`에 실행해 새로운 `join.sh` 파일을 생성하십시오.

```shell
sudo kubeadm token create --print-join-command | sed 's/$/ --cri-socket \/var\/run\/cri-dockerd.sock/' > ~/join.sh
```

아래 명령을 cmd에 입력해 `join.sh`를 다시 가져오십시오. `<master-username>` 자리에는 k8s-master의 username을, `<master-ip>` 자리에는 `k8s-master`에 지정한 IP 주소를 입력하십시오.

```shell
scp <master-username>@<master-ip>:/home/<master-username>/join.sh join.sh
```

완료했다면, 실패한 노드부터 이 섹션을 처음부터 다시 시도하십시오.

