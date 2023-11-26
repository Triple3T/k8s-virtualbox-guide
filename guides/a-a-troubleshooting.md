## Appendix A. Troubleshooting 

### 스크립트 파일 실행 중간 오류 발생

스크립트 파일이 Windows 스타일 줄바꿈(`CRLF`)인 경우 실행 중 오류가 발생합니다. 줄바꿈 문자가 `CRLF`가 아닌 `LF`인지 반드시 확인하시기 바랍니다.

### 사설 레지스트리의 Docker 이미지 다운로드 실패

아래 중 최소 하나일 수 있습니다.
- Image Pull Secret을 해당 namespace에 등록하지 않음
- 해당 배포에 Image Pull Secret을 등록하지 않음
- 잘못된 Secret을 저장함

원인 파악 후 적절한 조치를 취해 주세요.
Image Pull Secret을 namespace에 등록하지 않았거나 잘못된 Secret을 등록했다면 올바른 인증 정보를 포함한 Secret을 (재)등록해 주시고,
배포에 Image Pull Secret을 등록하지 않았다면 `spec.template.spec.imagePullSecrets`에 적절하게 지정해 주세요.

Image Pull Secret을 포함해 배포하는 경우 아래 형식과 같이 지정되어 있어야 합니다.
아래 내용 중 `your-secret-name`은 Image Pull Secret의 이름입니다.
```yaml
spec:
  ...
  template:
    ...
    spec:
      ...
      imagePullSecrets:
        - name: your-secret-name
```

Base64 인코딩된 인증 정보를 만드는 방법은 바로 다음 섹션을 참고해 주세요.


### 사설 레지스트리의 인증 정보를 제작하는 방법을 모름

아래 절차를 거쳐 Base64로 인코딩된 인증 정보를 만들 수 있습니다.

1. 해당 레지스트리에서 사용하는 username과 password를 `:` 문자를 사이에 두고 작성합니다. `username:password`와 같은 문자열이 만들어집니다.
2. 만든 문자열을 Base64로 인코딩합니다.
3. 아래 JSON을 작성합니다. `"your-registry-url"`에는 사설 레지스트리의 주소, `"encoded-auth"`에는 직전에 인코딩한 문자열을 넣습니다.
```json
{"auths":{"your-registry-url":{"auth":"encoded-auth"}}}
```
4. 작성한 JSON 형식 문자열을 Base64로 인코딩합니다.
5. 아래 yaml을 작성합니다. `your-registry-url`에는 사설 레지스트리의 주소, `your-registry-config-b64`에는 직전에 인코딩한 문자열을 넣습니다.
```yaml
apiVersion: v1
kind: Secret
metadata:
  name: your-registry-url
  namespace: default
data:
  .dockerconfigjson: your-registry-config-b64
type: kubernetes.io/dockerconfigjson
```

만들어진 인증 정보는 `kubectl apply -f` 명령어 또는 Kubernetes Dashboard에서 적용할 수 있습니다.

### 배포한 디플로이먼트가 정상 동작한다고 나오지만 외부에서 접근할 수 없음

배포 시 외부 포트를 적용했는지 다시 확인해 보시기 바랍니다.
만약 적용했다면, Service 목록을 살펴보셔서 Pending 등의 상태에 빠져 있는 서비스가 있는지 살펴보시기 바랍니다.

해당 디플로이먼트에 속하는 서비스가 Pending 상태에 빠져 있는 `LoadBalancer` 서비스라면,
`externalIPs` 속성을 지정하는 것과 같이 엔드포인트를 설정하면 접근할 수 있게 됩니다.

`externalIPs` 속성을 지정하는 방법은 아래와 같습니다.
```diff
 type: LoadBalancer
+externalIPs:
+  - x.x.x.x
```

### Kubernetes Dashboard의 그래프에 색이 정상 출력되지 않음

언어를 English로 바꿔 보세요.
안 된다면, 다른 언어로 바꾼 뒤 다시 English로 바꿔 보세요.
