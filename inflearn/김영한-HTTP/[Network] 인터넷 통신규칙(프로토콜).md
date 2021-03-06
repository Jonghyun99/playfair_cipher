# [Network] 인터넷 통신규칙(프로토콜)

## 프로토콜이란?

네트워크 환경(인터넷)에서 서로 원할하게 통신하기 위해 약속한 규약이다.

IP프로토콜, TCP프로토콜, HTTP프로토콜, Telnet, FTP 등등 다양한 규약이 있다.

인터넷 프로토콜은 4계층으로 나뉨

![인터넷프로토콜](https://user-images.githubusercontent.com/75297568/126247083-268bb960-5890-492b-a0af-1efcb576fecb.png)
[https://hahahoho5915.tistory.com/15](https://hahahoho5915.tistory.com/15)

### **인터넷 프로토콜 스택의 4계층**

- 애플리케이션 계층 - HTTP, FTP
- 전송 계층 - TCP, UDP
- 인터넷 계층 - IP
- 네트워크 인터페이스 계층

## IP 프로토콜

서버와 클라이언트 간 ip만으로 통신함, 패킷 이라는 단위로 데이터를 전달하게 됨

인터넷은 출발지에서 목적지 간 직통하는 것이 아닌 중간에 여러 노드들을 갈아타면서 전송하게됨 그렇기에 아래와 같은 문제가 있음

- 비연결성 : 대상이 없어도 패킷을 전송하게 됨
- 비신뢰성 : 패킷이 소실되거나 순서대로 오지 않을 수 있음
- 프로그램 구분 : 데이터가 목적지에 도착했는데 어떤 애플리케이션에 사용되는지 구별할 수 없음

## TCP/UDP 프로토콜

기존 IP프로토콜만 사용해서 생긴 문제점을 TCP 프로토콜을 통해 극복해냈음

- **IP 프로토콜이 담는 패킷 정보** : 출발지 IP, 목적지 IP, 기타(데이터)...
- **TCP 프로토콜이 담는 패킷 정보** : 출발지 PORT, 목적지 PORT, 전송 제어, 순서, 검증정보...

이러한 정보들을 함께 보냄으로서 신뢰성 있는 데이터를 보낼 수 있게됨

### TCP 특징

- **전송 제어 프로토콜**(Transmission Control Protocol) : 전송에 관한 내용을 제어한다는 뜻
- **연결지향** - TCP 3 way handshake (가상 연결) : 연결을 한 뒤 메세지를 보냄 (연결이 안되어 있으면 메세지를 보낼 수 없음)
- **데이터 전달 보증** : 데이터가 누락된 사실을 알 수 있음
- **순서 보장** : 순서대로 도착하는 걸 알 수 있음
- 신뢰할 수 있는 프로토콜
- 현재 대부분 앱에서 TCP 사용

### TCP 3 way handshake

TCP/IP 프로토콜에서 양측 간 데이터 송수신할 때 정상적으로 데이터가 오갔는지 확인하는 과정이다.

SYN : 접속 요청 (연결 요청 플래그)

ACK : 요청 수락 (응답 플래그)

**요청자       수신자**

SYN     →    수신

수신     ←   SYN + ACK

ACK     →    수신

이 3번의 과정을 통해 서로 송수신 연결이 원활함을 판단하고

이 과정이 끝나면 4번째에 데이터를 전송한다.

### UDP 특징 (사용자 데이터그램 프로토콜, User Datagram Protocol)

- 하얀 도화지에 비유(기능이 거의 없음)
- 연결지향 - TCP 3 way handshake X
- 데이터 전달 보증 X
- 순서 보장 X
- 데이터 전달 및 순서가 보장되지 않지만 속도가 빠름
- IP와 거의 같다 + PORT + 체크섬
- 애플리케이션에서 추가 작업 필요

TCP는 패킷에 들어가는 정보가 많아 크기가 크고 속도가 비교적 느려지기 때문에 더 최적화하고 싶을 때 UDP를 사용한다. 그래서 현재까지 TCP를 많이 사용해왔지만 또 최근에는 HTTP/3 에서 UDP프로토콜을 사용하면서 UDP가 주목받고 있다.

### PORT(항구)

하나의 IP로 패킷이 도착했을 때 어떤 애플리케이션으로 가야할 지 알려주는 번호이다.

0~1023 사이 포트는 원할한 인터넷을 위해 약속하고 사용하는 포트가 많으므로 이러한 포트들은 사용하지 않는것이 좋다.

### 체크섬

 도착한 메시지가 맞는지 검증하는 간단한 방법 (중복검사)

## DNS (Domain Name System)

100.100.100.1 ↔ 200.200.200.2 사이에서 통신이 일어나고 있을 때 200번 대역 IP가 어떠한 이유로 아이피가 200.200.200.3으로 바뀌어 버릴 수도 있다. 그러면 100대역 사용자는 다시 바뀐 IP를 알아내야 통신을 할 수 있다.

이런 불편함을 줄이기 위해 DNS를 사용한다.

- 전화번호부
- 도메인 명을 IP 주소로 변환

A가 자신의 IP를 google.com으로 DNS 등록하게 되면 다른 사용자가 google.com를 입력하게 되면 A의 IP를 응답받게 된다. 그렇기에 DNS를 사용하면 IP가 변경될 때 발생하던 문제가 해결된다.

## 인터넷 네트워크 정리

- 인터넷 통신
- IP (Internet Protocol)
- TCP, UDP
- PORT
- DNS

복잡한 인터넷 망에서 서로 데이터를 교환하기 위해서는 **IP**가 필요하다.

하지만 IP만으로는 데이터 교환의 신뢰성 등에 대한 문제가 있어서 TCP, UDP를 사용하게 된다.

TCP/UDP 계층에는 PORT라는 프로그램 주소가 사용되고, DNS는 IP의 변하기 쉽고 외우기 어려운 문제를 해결해주는 기술이다.
