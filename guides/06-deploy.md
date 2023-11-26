## 6. 배포하기

이 문서에서는 Docker 이미지화가 되어 있음을 전제로 하는 두 가지 배포 예시를 제시합니다.

### Before Start: 이미지 업로드

먼저, 도커 이미지를 빌드한 후 레지스트리에 업로드해야 합니다.

공식 레지스트리에 업로드하고 이를 사용한다면 아래 명령어를 적절히 사용해 이미지를 빌드한 후 태그를 붙여 업로드하세요.

```shell
docker build --tag <user>/<image-name>:<tag> . && docker push <user>/<image-name>:<tag>
```

사설 레지스트리에 업로드하고 이를 사용한다면 아래 명령어를 적절히 사용해 이미지를 빌드한 후 태그를 붙여 업로드하세요.

```shell
docker build --tag <registry-url>/<user>/<image-name>:<tag> . && docker push <registry-url>/<user>/<image-name>:<tag>
```

`<>`로 둘러싸인 항목을 적절한 값으로 치환해야 합니다.


### Option A. Docker-compose에서 생성

만약 `docker-compose.yaml`(또는 `.yml`) 파일을 사용하고 있다면, 오픈 소스 툴인 **Kompose**를 사용해 쉽게 쿠버네티스 배포용 yaml로 변환할 수 있습니다.
**Kompose**에 관해서는 https://github.com/kubernetes/kompose 링크에서 자세히 알아볼 수 있습니다.

위 링크를 통해 **Kompose** 툴에 대해 숙지했고 쿠버네티스 배포용 yaml 파일로 변환했다면
Kubernetes Dashboard에서 yaml 파일을 업로드 또는 파일의 내용물을 붙여넣어 배포하거나,
해당 파일을 k8s-master 노드 내부로 복사한 후 커맨드라인에서 `kubectl apply -f <yaml-file>` 명령어로 적용할 수 있습니다.


### Option B. Kubernetes Dashboard 폼으로 생성

기존에 `docker-compose.yaml`과 같은 파일을 사용하고 있지 않고,
`Dockerfile`에 제대로 된 `ENTRYPOINT`(또는 같은 역할을 하는 구문)가 설정되어 있다면,
Kubernetes Dashboard가 제공하는 폼을 통해 편하게 배포할 수 있습니다.

아래 이미지와 같이 항목별로 설명이 존재하니 해당하는 항목을 입력하면 됩니다.

![img](/images/44.png)
