## Appendix B. VMWare Config

VMWare의 Host-only network 설정은 VirtualBox와 약간 다릅니다. 아래 설명을 참고하시기 바랍니다.

1. VMWare에서 **Edit** > **Virtual Network Editor...** 순서로 Virtual Network Editor를 엽니다. 관리자 권한이 부여되지 않았다면 **Change Settings** 버튼을 눌러 관리자 권한을 부여합니다.
2. **Add Network...** 버튼을 눌러 새로 생성합니다. 이름은 비어 있는 이름 중 아무거나 선택해도 무방합니다. 고른 이름을 기억해두세요.
3. 생성한 네트워크를 다음과 같이 수정합니다.
   - Host-only로 설정
   - Use local DHCP server 체크 해제
   - Subnet IP를 `192.168.x.0`으로 설정, x 자리에는 기존 Virtual Network와 겹치지 않는 주소 중 아무거나 선택
   - Subnet Mask는 `255.255.255.0`
   - 이외 설정은 기본 설정 그대로
4. **OK** 버튼을 눌러 저장하고 빠져나옵니다.
5. 가상 기기를 생성할 때, Virtual Machine Settings 메뉴의 Hardware에서 **Add** 버튼을 눌러 Network Adapter 하나를 추가합니다.
6. 5에서 추가한 어댑터 설정 중 Network Connection을 **Custom**으로 변경한 후 드롭다운을 열어 2에서 추가한 가상 네트워크의 이름을 고르십시오.
7. **OK** 버튼을 눌러 빠져나옵니다.
