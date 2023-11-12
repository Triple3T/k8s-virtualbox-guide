## 5. 추가 소프트웨어 설정

### 네트워크 플러그인 설치

다른 모든 노드에 대해 작업을 완료했다면, 다시 `k8s-master`에 ssh 연결 후 아래 명령어를 실행하십시오.

```shell
curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.3/manifests/calico.yaml -LO
kubectl apply -f calico.yaml
```

이 명령어는 Calico 네트워크 플러그인을 설치합니다.

### 대시보드 설치

아래 명령어를 `k8s-master`에 실행하십시오.

```shell
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml
curl https://triple-lab.com/k8s-dashboard-service-account.yaml -LO
kubectl apply -f k8s-dashboard-service-account.yaml
```

이 명령어는 Kubernetes Dashboard를 설치하고, 여기에서 사용할, 모든 권한을 가진 `admin-user` 서비스 계정을 생성합니다.

2번째 줄의 yaml은 이 리포지토리의 [k8s-dashboard-service-account.yaml](/yamls/k8s-dashboard-service-account.yaml)과 동일합니다.

### 대시보드 유저 확인

대시보드에서 사용할 `admin-user` 서비스 계정의 토큰이 제대로 발급되는지 확인하려면 `k8s-master`에서 아래 명령어를 입력하십시오.

```shell
kubectl -n kube-system get secret/admin-user-token
```

![img](/images/38.png)

위와 같이 `token`이 출력된다면 잘 적용된 것입니다. 이렇게 출력되는 `token`은 로그인에 쓰이며, 일정 시간이 지나면 만료되므로 만료될 때마다 다시 가져와야 합니다.

### 대시보드 사용 준비

Kubernetes Dashboard를 설치했으나, 이를 사용하기 위해서는 proxy를 통해 외부 연결을 설정해주어야 합니다.

아래 명령어를 `k8s-master`에 실행하여 `8001`번 포트에 Kubernetes Dashboard를 연결하십시오. `<ip>` 자리에 `k8s-master`에 지정한 IP 주소를 입력하십시오.
이 명령어는 VM을 종료하고 다시 시작할 때마다(정확히는 이 프로세스가 종료될 때마다) 실행해야 합니다.

```shell
nohup kubectl proxy --port=8001 --address=<ip> --accept-hosts='^*$' >/dev/null 2>&1 &
```

![img](/images/39.png)

성공한다면 위와 같이 PID가 출력되며 백그라운드에서 프록시가 동작합니다.

이제 VirtualBox에서 `k8s-master` VM의 네트워크 설정 메뉴에 진입합니다.

![img](/images/40.png)

어댑터 1을 건드리지 않았기 때문에, 기본적으로 NAT 연결이 되어 있습니다.
**고급** 섹션을 펼치고, **포트 포워딩(P)** 버튼을 눌러 포트 포워딩 메뉴에 들어갑니다.

![img](/images/41.png)

포트 포워딩 규칙 창이 나타나면, 오른쪽의 추가(+ 표시) 버튼을 눌러 규칙을 추가합니다.
이름은 임의로 지정하고, 프로토콜은 `TCP`로, 호스트 IP는 `127.0.0.1`, 호스트 포트는 `8200`, 게스트 IP는 `k8s-master`에 지정한 IP 주소를, 게스트 포트는 `8001`로 설정합니다. **확인** 버튼을 눌러 저장합니다. 다시 **확인** 버튼을 눌러서 최종적으로 저장합니다.

### 대시보드 접속

이제 다음 주소에 접속하십시오.

http://localhost:8200/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/#/login

![img](/images/42.png)

화면 중앙에 위와 같은 카드가 표시됩니다.

`token`을 얻어오는 방법은 위에서도 설명했지만 아래 명령을 `k8s-master`에 실행하면 됩니다.

```shell
kubectl -n kube-system get secret/admin-user-token
```

`token`을 복사해 로그인 화면의 입력란에 입력한 뒤 제출하면 로그인을 할 수 있습니다.

대시보드에 로그인한 상태에서는 메인 화면에서 리소스의 목록과 상태를 보거나 변경 및 삭제 등의 동작을 수행할 수 있고, 왼쪽의 메뉴에서 원하는 리소스의 목록과 상태를, 위쪽의 콤보 박스와 검색란에서 원하는 네임스페이스 또는 키워드로 검색을, 우상단의 + 버튼으로 리소스를 추가할 수 있습니다.

![img](/images/43.png)

로그인 후 아무것도 표시되지 않는다면, 상단의 네임스페이스 콤보 박스를 눌러 **모든 네임스페이스**를 표시하게 하면 시스템 현황을 조회할 수 있습니다.
원 그래프가 검정색으로만 표시된다면, 대시보드의 **설정**에서 **언어**를 **English**로 변경해 보십시오.
