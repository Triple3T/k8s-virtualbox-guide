## 3. Kubernetes 설치

### 설치 스크립트 준비

A 또는 B 중 하나를 따라서 `init.sh` 파일을 다운로드 받으십시오.

#### A. 직접 다운로드 후 수정

이 리포지토리의 [init.sh](/scripts/init.sh) 파일을 다운로드 받아서 호스트 전용 네트워크 및 VM 개수에 따라 수정하십시오.

`IPHEAD=`에는 호스트 전용 네트워크에 지정한 IP 대역의 첫 3개 자리, `MASTER=`에는 `k8s-master`에 지정한 IP 주소의 마지막 자리, `NODECNT=`에는 마스터 노드를 제외한 다른 노드의 개수를 입력하면 됩니다.

#### B. 사이트에서 생성 후 다운로드

또는 [이 URL](https://triple-lab.com/k8s-init-script.html)로 접속해, 호스트 전용 네트워크에 지정한 IP 대역 및 `k8s-master`에 지정한 IP, 그리고 `k8s-master`를 제외한 다른 노드의 개수를 올바르게 입력한 후 다운로드 버튼을 눌러 `init.sh` 파일을 다운로드 받으십시오.

![img](/images/32.png)

위와 같은 화면이 표시됩니다. 상황에 맞게 값을 바꾼 후 다운로드 버튼을 누르십시오.

### 설치 스크립트 실행

![img](/images/33.png)

다운로드 받은 `init.sh` 파일을 다운로드 받은 폴더를 열고 `cmd`를 실행하십시오.
경로 표시란에 `cmd`라고 입력한 후 <kbd>Enter</kbd>키를 눌러 빠르게 실행할 수 있습니다.

![img](/images/34.png)

`cmd`에서 각 VM에 대해 아래 명령어를 실행해 다운로드 받은 `init.sh` 파일을 VM 내에 넣어 주십시오. `<username>` 자리에 VM에 설정한 username을, `<ip>` 자리에 VM에 설정한 IP를 입력해야 합니다.

```shell
scp init.sh <username>@<ip>:/home/<username>/init.sh
```

이미지의 푸른 부분이 VM의 username, 붉은 부분이 VM의 IP입니다.

해당 VM에 SSH 연결이 처음인 경우 VM의 핑거프린트를 등록합니다. yes를 입력해 계속하십시오.

비밀번호를 요구하면 VM에 설정한 password를 입력하십시오.

![img](/images/35.png)

그 다음, 아래 명령어를 이용해 SSH 연결로 VM에 접속하십시오.

```shell
ssh <username>@<ip>
```

비밀번호를 요구하면 VM에 설정한 password를 입력하십시오.

![img](/images/36.png)

접속했다면 `ls` 명령어로 `init.sh` 파일이 존재하는지 확인하십시오.
존재하지 않는다면, 조금 전으로 돌아가 `scp`로 시작하는 명령어를 다시 입력해 `init.sh` 파일을 전송해야 합니다.

`init.sh` 파일이 존재한다면, 아래 명령어로 해당 파일을 실행할 수 있는 권한을 부여하십시오.
```shell
chmod +x init.sh
```

부여했다면, 아래 명령어로 `bash` 셸 안에서 `init.sh` 파일을 실행하십시오.
```shell
bash ./init.sh
```

해당 파일은 `sudo` 명령어를 포함하고 있으므로 비밀번호를 요구할 수 있습니다.
비밀번호를 요구하는 경우 해당 VM에 설정한 password를 입력하십시오.

실행이 완료될 때까지 잠시 기다리십시오.
