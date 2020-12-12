## 실행 및 사용방법

- github에 있는 파일을 모두 받은 후 압축을 해제합니다.

visual studio code로 압축을 해제한 폴더를 오픈합니다.

visual studio code에 있는 extensions 항목에 Tomcat for java를 설치합니다.

왼쪽 하단에 추가된 tomcat servers에 톰캣에 add 버튼을 눌러서 톰캣이 설치된 폴더를 지정해 줍니다.

추가된 tomcat 서버를 오른쪽 클릭하여 open server configuration을 선택하면 server.xml파일이 열립니다.

Host태그 밑에 Context태그를 추가하고 docBase의 값을 JSP작업을 진행할 위치로 지정한다.

Host태그에는 workDir을 추가하고 값은 docBase에서 입력한 값 뒤에 \jsp를 붙여준다.

그리고 위에 Connector태그에 port값을 80번으로 수정한다.

**참고 : https://myhappyman.tistory.com/134

설정이 끝난뒤 visual studio code에서 tomact 서버를 시작한다.

브라우저에서 localhost를 입력하면 실행이된다.


## 프로그램 제작 환경
IDE : visual studio, eclipse

OS : windows 10
