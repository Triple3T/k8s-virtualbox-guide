## 2. 게스트 OS 설치

### 설치 시작

만들어진 가상 머신을 시작하십시오. 아래와 같은 화면이 보이게 됩니다.

![img](/images/12.png)

운영체제 설치를 위해 **Try or Install Ubuntu Server** 항목을 지정한 후 <kbd>Enter</kbd>키를 누르십시오.

![img](/images/13.png)

원하는 언어를 선택한 후 <kbd>Enter</kbd>키를 누르십시오. 여기에서는 **English** 기준으로 설명합니다.

![img](/images/14.png)

23버전으로 업데이트하지 않을 것이기 때문에 업데이트하지 않습니다. <kbd>Enter</kbd>키를 누르십시오.

![img](/images/15.png)

키보드에 특이사항이 없다면 <kbd>Enter</kbd>키를 누르십시오.

![img](/images/16.png)

Ubuntu Server 설치 기본값으로 진행하기 위해 <kbd>Enter</kbd>키를 누르십시오.

### 네트워크 설정

![img](/images/17.png)

네트워크 연결 설정창에서는 고정 IP를 부여해야 합니다.

어댑터 2에 호스트 전용 네트워크를 연결했으므로, 두 번째 네트워크 어댑터를 선택한 후 <kbd>Enter</kbd>키를 눌러 메뉴를 열고, Edit IPv4를 선택해 <kbd>Enter</kbd>키를 눌러 수동으로 입력합니다.

![img](/images/18.png)

**Automatic (DHCP)** 라고 써 있는 부분에서 <kbd>Enter</kbd>키를 이용해 메뉴를 열고 **Manual**로 지정한 후 <kbd>Enter</kbd>키를 누릅니다.

![img](/images/19.png)

**Subnet**에서는 호스트 전용 네트워크의 대역을 입력해줍니다. 단, 마지막 자리를 `.0`으로 바꾼 후 `/24` 대역을 입력해야 합니다.

**Address**에는 해당 대역 내 IP 주소를 입력하십시오. 순차적으로 증가하게 입력합니다.
예를 들어 `k8s-master`의 경우 `.30`, `k8s-node1`의 경우 `.31`, `k8s-node2`의 경우 `.32`가 되는 식으로 입력합니다.

**Gateway**, **Name servers**, **Search domains**는 입력하지 않습니다.
**Subnet**과 **Address**를 모두 입력했다면 <kbd>Enter</kbd>키로 **Save**가 눌릴 때까지 <kbd>Enter</kbd>키를 입력하십시오.

저장했다면 IP 적용 및 테스트를 위해 잠시 대기합니다.
하단에는 `Applying changes` 문구가 나왔다가 사라지고, 어댑터에는 `not connected` 문구가 나왔다가 사라집니다. **Done**으로 커서를 이동하고 <kbd>Enter</kbd>키를 누릅니다.

다음 화면에서는 프록시를 설정할 수 있습니다. 프록시를 설정하지 않을 것이므로 <kbd>Enter</kbd>키를 한 번 더 눌러 다음 화면으로 넘어갑니다.

![img](/images/20.png)
![img](/images/21.png)

넘어왔다면 실제로 인터넷이 잘 연결되는지 테스트를 하게 됩니다.
`This mirror location passed tests` 문구가 나올 때까지 기다렸다가 <kbd>Enter</kbd>키를 눌러 다음으로 진행합니다.

## 저장공간 설정

![img](/images/22.png)

업데이트가 가능하다는 문구가 나온다면 무시하고 <kbd>Enter</kbd>키로 계속 진행합니다.

![img](/images/23.png)
![img](/images/24.png)
![img](/images/25.png)

저장 공간 설정 메뉴에 진입하게 됩니다. 기본값으로 진행하게 되므로 **Done** - **Done** - **Continue**로 커서를 이동시킨 후 <kbd>Enter</kbd>키로 진행합니다.

**Continue**는 녹색이 아닌 적색으로 표시되나 새 디스크에는 손실될 데이터가 없으므로 안심하고 다음으로 넘어가도록 합니다.

## 로그인 정보 설정

![img](/images/26.png)

이름, 호스트 이름, 로그인 정보를 지정하게 됩니다.

**Your name**에는 아무 이름이나 원하는 이름을 지정하십시오.

**Your server’s name**에는 해당 머신의 이름(`k8s-master`, `k8s-node1` 등)을 지정하십시오.

**Pick a username** 이하에는 원하는 로그인 정보를 입력하십시오.

**Done**에서 <kbd>Enter</kbd>키를 눌러 설정을 완료합니다. **Done**이 선택되지 않는다면 잘못된 정보를 입력한 것이므로 수정하고 진행합니다.
다음 화면에서는 Ubuntu Pro를 사용할 것이냐고 묻는데, **Skip for now**가 기본값이므로 그냥 <kbd>Enter</kbd>키를 눌러 계속 진행합니다.

## SSH 설정

![img](/images/27.png)

다음은 SSH 서버를 설치할 것이냐고 묻는데, SSH 연결을 위해 반드시 필요하므로 <kbd>Space</kbd>로 체크하고, **Done**으로 커서를 이동해 <kbd>Enter</kbd>키를 눌러 다음으로 진행합니다.
추후 이 VM에 SSH를 연결할 경우 로그인 정보는 위에서 지정한 username과 password가 됩니다.

다음 화면에서는 추가 소프트웨어를 다운로드하여 쉽게 서버를 세팅할 수 있도록 도와주려고 합니다.
고마운 일이지만 거절하기 위해 아무것도 체크하지 않고 **Done**으로 커서를 이동해 <kbd>Enter</kbd>키를 눌러 다음으로 이동합니다.

## 업데이트 및 마무리

![img](/images/28.png)

이제 마무리 단계입니다. 필수 소프트웨어 설치 및 업데이트가 완료될 때까지 잠시 기다리시기 바랍니다. 

![img](/images/29.png)

**Reboot Now**가 표시되면 **Reboot Now**로 커서를 이동한 후 <kbd>Enter</kbd>키를 눌러 재시작합니다.
재시작 시 `Failed unmounting /cdrom` 오류 메시지가 출력되는데, VirtualBox가 자체적으로 설치 미디어를 제거한 것이므로 안심하시고 <kbd>Enter</kbd>키로 진행하십시오.
