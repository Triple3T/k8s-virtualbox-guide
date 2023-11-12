# k8s-virtualbox-guide
VirtualBox에 k8s 설치하는 방법

## [시작하기 전에](/guides/00-before-start.md)

시작하기 전에, 어떤 환경에서 테스트되었는지와 짤막한 주의사항을 적어두었습니다.

## [1. 가상 머신 만들기](/guides/01-creating-vms.md)

OS 이미지 파일을 다운로드받고, 호스트 전용 네트워크를 만들어 VM에 연결하게 됩니다.

## [2. 게스트 OS 설치](/guides/02-install-guest-os.md)

만들어진 VM에 OS를 설치하며 내부 네트워크를 설정하게 됩니다.

## [3. Kubernetes 설치](/guides/03-install-kubernetes.md)

Kubernetes가 작동하는 데 필요한 환경을 구성하고 필수 소프트웨어를 설치하게 됩니다.

## [4-1. 마스터 노드 설정](/guides/04-1-master-config.md)

컨트롤 플레인 역할을 할 마스터 노드를 준비하게 됩니다.

## [4-2. 워커 노드 설정](/guides/04-2-node-config.md)

소프트웨어가 배포될 노드를 준비하고 마스터 노드에 연결하게 됩니다.

## [5. 추가 소프트웨어 설정](/guides/05-additional-softwares.md)

Calico 네트워크 플러그인과 대시보드를 설치하고 사용하게 됩니다.
