## Appendix C. Metrics

**CPU/Memory Usage Graph** 기능을 사용하려면 **metrics-server**가 설치되어 있어야 합니다.

원하는 경우 https://github.com/kubernetes-sigs/metrics-server 리포지토리 소개의 Installation 섹션을 참고하여 설치할 수 있습니다.
k8s-master 노드에 커맨드를 이용해 설치하면 됩니다.

설치되었다면, All namespaces 기준으로 Deployments 목록에서 `metrics-server` 디플로이먼트를 볼 수 있습니다.


----

> x509: cannot validate certificate for <host> because it doesn't contain any IP SANs

위 오류 로그와 함께 작동되지 않는 경우, metrics-server 디플로이먼트에 아래와 같이 옵션을 추가하십시오. 위치는 `spec.template.spec.containers.args`입니다.

```diff
          args:
            - '--cert-dir=/tmp'
            - '--secure-port=4443'
            - '--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname'
            - '--kubelet-use-node-status-port'
            - '--metric-resolution=15s'
+           - '--kubelet-insecure-tls'
```
