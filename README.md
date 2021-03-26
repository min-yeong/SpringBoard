# Spring Boot를 이용한 간단한 게시판 예제 
## Spring Framework
Java를 사용해 프로그램 개발을 위한 오픈소스 프레임워크 

### JSP, JavaBean 만을 사용한 모델 
![image](https://user-images.githubusercontent.com/58197075/108171522-fa871580-713e-11eb-9c87-8a2e343c753b.png)
- Spring을 사용하지 않고 웹 브라우저에서 JSP로 요청해 JavaBean에서 자원을 받아와 다시 JSP를 통해 웹브라우저에 전송함
- JavaBean : JSP파일의 디자인 부분과 로직 부분을 분리하여 복잡한 자바코드를 줄이고 프로그램의 재사용성을 증가시킴 

### MVC 패턴
![image](https://user-images.githubusercontent.com/58197075/108177764-f7902300-7146-11eb-9a1f-828cf6bcc809.png)
- 역할을 나눠 코드 관리를 함으로서 유지보수와 개발효율이 높아짐 

### DispatcherServle / HandlerMapping 을 이용한 MVC 패턴 
![image](https://user-images.githubusercontent.com/58197075/108174182-7767be80-7142-11eb-96f0-79249567f6e4.png)
1. DisapatcherServlet은 클라이언트에게 받은 정보를 HandlerMapping에게 보내 요청받은 정보에 매핑되어 있는 컨트롤러가 있는 지 확인
2. 해당 컨트롤러는 전송받은 요청 수행 후 DispatcherServlet에게 결과 전송 
3. 이 과정에서 Model이 생성되어 View에서 같이 사용됨 
4. 생성된 Model의 이름을 Servlet이 ViewResolver에게 보내 해당 View를 검색
5. 검색 결과를 View에 전송
6. View에서 결과 화면을 다시 DispatcherServlet에 보내 최종 출력 

- DispatcherServlet : 웹브라우저에서 요청한 정보를 받아 HandlerMapping에 역할을 분배하고 Controller에서 보내온 정보를 받아 ViewResolver에게 전달, View에서 출력된 화면을 브라우저에 다시 전송해주는 역할

### build.gradle 파일 구성
1. plugins
- Spring Boot plugin 적용 및 자바 소스 버전, 컴파일 버전, 인코딩 설정
2. dependencies 
- 저장소에서 필요한 라이브러리를 사용하기 위한 문장 (의존문)
- 종류 : implementation(컴파일시에 사용하는 라이브러리를 지정), testImplementation(테스트 컴파일에 사용하는 라이브러리를 지정), classPath(컴파일부터 실행시까지 사용하는 라이브러리 지정) 등,,
3. repositories 
- gradle이 필요한 라이브러리를 자동으로 다운로드 하기위해 사용되는 저장소 
- jcenter()-> JCoenter 저장소, mavenCentral()->Maven 중앙 저장소 주로 사용

### build.gradle 파일 LifeCycle
1. 초기화(Initialization) : 빌드 대상 프로젝트를 결정하고 각각에 대한 프로젝트 객체 생성
2. 구성(Contifuration) : 빌드 대상이 되는 모든 프로젝트의 빌드 스크립트 실행
3. 실행(Execution) : 구성 단계에서 생성하고 설정된 프로젝트의 태스크(작업의 최소 단위) 중에 실행 대상 결정 

### application.properties (외부 설정 파일) 파일
- Spring Boot가 애플리케이션을 실행할 때 자동으로 로딩되는 파일
- 여러가지 설정 값들을 내부에서 사용하게끔 정의하는 기능 (key, value 형식으로 정의하면 참조하여 사용 가능) 

## 이론

### 빌드(소스 코드 파일 -> 실행 코드로 변환되는 컴파일 과정) 관리 도구?
![image](https://user-images.githubusercontent.com/58197075/109243557-7c063400-7820-11eb-83b8-3045f390c090.png)

빌드 관리 도구 : java코드와 프로젝트 내에 필요한 각 종 파일들을 JVM이나 WAS가 인식할 수 있도록 패키징 해주는 빌드 과정, 빌드 자동화 도구 
- 프로젝트 생성, 테스트 빌드, 배포 등 작업 
- 프로젝트에 필요한 라이브러리 종류와 버전, 종속성 정보를 입력하고 이것을 자동으로 다운로드 및 관리해줌 

### Gradle 이란?
Groovy라는 언어를 기반으로 만들어진 빌드 관리 도구, Groovy는 java 가상 머신에서 실행되는 스크립트 언어로 Java 가상 머신에서 동작하지만 소스 코드를 컴파일 할 필요가 없음
Groovy를 사용하여 빌드 처리를 작성하고 실행하는 것이 Gradle 

### Gradle과 Maven의 차이?
- Maven : java용 프로젝트 관리도구, 다양한 외부 라이브러리 종속성 관계를 pom.xml 파일에 명시, 외부저장소에서 필요한 라이브러리와 플러그인들을 다운로드 한다음, 로컬시스템의 캐시에 모두 저장
- Gradle : 의존성 추가를 위한 파일 build.gradle, 프로젝트 빌드 관리 툴 (완전한 오픈소스), 업데이트가 이미 반영된 빌드의 부분은 즉 더이상 재실행되지 않음 

-> 즉, Gradle을 사용하는 이유는 프로젝트에 필요한 라이브러리 및 빌드 환경을 자동화 해줌으로써 개발에 효율성을 높여줌  
https://web2eye.tistory.com/31

### Spring과 Spring Boot?
Spring boot는 spring안에 tomcat이 내장되어 있어 web개발에 수월하게 함, 스프링부트는 스트링 프레임워크라는 큰 틀에 속하는 도구 

### Html, jsp, servlet
Html은 jsp 페이지의 기본 양식으로, 동적으로 생성된 웹 페이지를 작성하기 위한 것이 jsp
- java코드에 HTML코드를 삽입 : servlet
- HTML코드에 java코드를 삽입 : jsp 

### DAO, DTO, VO 
- DAO(Data Access Object) : 데이터베이스에 접근하는 객체, 데이터 조회, 조작 기능 
- DTO(Data Transfer Object) : 데이터 교환을 위한 객체, 로직이 들어가지 않는 순수 데이터 객체로 getter, setter 메소드를 가짐
- VO(Value Object) : DTO와 동일한 개념이지만 read only속성 

### WAR, JAR 차이
- JAR(Java Archive) : Java 어플리케이션이 동작하게 하는 자바 프로젝트를 압축한 파일 
- WAR(Web Application Archive) : servlet/jsp 컨테이너에 배치할 수 있는 웹 어플리케이션 압축 파일, WEB-INF, META-INF 디렉토리로 정의된 구조를 사용 

### WEB-INF, META-INF 차이
- META-INF : 자바에서 설정 관련 파일을 저장 
- WEB-INF : 웹 어플리케이션 용, 웹에 중요한 파일들이 노출되지 않도록 만든 폴더, 해당 폴더에 jsp파일을 저장하면 url로 직접 접근이 불가함 

### 커넥션 풀(Connection Pool) 
![image](https://user-images.githubusercontent.com/58197075/108317282-6336c680-7201-11eb-98f6-29a99af6c64a.png)
- 이전에는 데이터 접근이 필요할 때마다 DB 연결과 해제를 반복했음, DB 연결과 해제 시간이 가장 오래 소요 

![image](https://user-images.githubusercontent.com/58197075/108317847-3df68800-7202-11eb-953b-2df55778a10e.png)
- 데이터베이스와 연결된 Connection을 미리 만들어 Pool속에 저장, 필요할 때에 커넥션을 풀에서 가져다 쓰고 다시 풀에 반환하는 기법 
- 장점 : 과부화 방지, 빠른 속도

### Persistence Framework
persistence(데이터의 지속성, 영속성), framework(동작에 필요한 구조를 어느 정도갖춘 개발 도구) 
데이터의 저장, 조회, 변경, 삭제를 다루는 클래스 및 설정 파일들의 집합 
- 장점 : JDBC프로그래밍의 복잡함이나 번거로움 없이 간단하게 데이터베이스와 연동되는 시스템 개발, 안정적인 구동 
- 종류
1. SQL Mapper(SQL 문장으로 직접 DB데이터를 다룸) : mybatis
2. ORM(객체를 통해 간접적으로 DB데이터를 다룸) : JPA(Hibernate)

### Spring JDBC (java Database Connecting) 
- DB에 접근할 수 있도록 JAVA에서 제공하는 API, 모든 Persistence Framework는 내부적으로 JDBC API를 이용함 
- 동작 과정
Application(DAO) - Persistence Framework – JDBC Interface(Spring JDBC) – JDBC Implemetation(JDBC Driver) - DB

### ORM (Object Relational Mapping, JPA)
객체와 DB테이블을 맵핑하여 method를 호출해 쿼리 실행
JPA (Java Persistence API) : JAVA ORM을 사용하기 위한 인터페이스를 모아놓은 API
- 장점 : 데이터 접근을 위한 기본적인 method가 정의되어 있음
- 단점 : 복잡한 쿼리가 필요한 경우 부적합 

### MyBatis 
임의의 SQL 쿼리문, 그리고 그 쿼리의 결과를 객체와 맵핑할 수 있도록 지원하는 SQL Mapper
- 동작 과정
DB <-> Mapper <-> DAO(Data Access Object) <-> Controller <-> UI
- 장점 : 복잡한 쿼리가 필요한 경우 적합, 가공된 데이터 또는 특정 컬럼만 추출하기 적합
- 단점 : 반복적인 작업이 필요, 일일히 SQL문과 데이터를 맵핑해줘야 한다. 

## IntelliJ 개발 환경 구축
1.IntelliJ, JDK, Tomcat, Gradle 설치 

2. 새 프로젝트 생성 후, 상단에 
testApplication -> Edit configurations -> Templates -> Tomcat Server -> Local 에서 톰캣 설치 경로 입력  
![image](https://user-images.githubusercontent.com/58197075/108022364-c12da780-7063-11eb-9606-20f72d86790c.png)

3. Mysql driver 라이브러리 추가 
https://dev.mysql.com/downloads/connector/j/ 에서 zip 다운 후, C 드라이브에 저장 
file -> project structure -> Libraries 에서 +, java -> mysql-connecter .jar 파일 선택 후 저장

4. 한글 설정 
- IntelliJ VM 설정
IntelliJ 설치 파일의 bin 파일로 이동 후, vmoptions 파일 열기 
C:\Program Files\IntelliJ IDEA 2020.2.2\bin -> idea64.exe.vmoptions
해당 파일 백업본 하나 생성 후, 맨 마지막에 “-Dfile.encoding=UTF-8” 추가, 후 재시작

-Intellij Editor File Encoding 설정 
File -> settings -> Editor -> file encoding -> 모든 설정 “UTF-8”로 변경 
![image](https://user-images.githubusercontent.com/58197075/108022440-e5898400-7063-11eb-8601-3b35ca6b87c1.png)

-톰캣 인코딩 설정
Run -> edit configurations -> Tomcat Server VM option에 "-Dfile.encoding=UTF-8" 추가 

### 개발 환경 설정 
- application.properties 파일 설정
~~~
spring.datasource.url=jdbc:mysql://${MYSQL_HOST:localhost}:3306/testdb?serverTimezone=Asia/Seoul&characterEncoding=UTF-8
spring.datasource.username=root
spring.datasource.password=mylee1
 
spring.mvc.view.prefix=/WEB-INF/views/ // jsp파일은 webapp/WEB-INF/views/ 안에 jsp파일을 넣어야 함
spring.mvc.view.suffix=.jsp
~~~

- build.gradle 파일 dependencies 설정
~~~
implementation 'org.springframework.boot:spring-boot-starter-web'
implementation 'org.mybatis.spring.boot:mybatis-spring-boot-starter:2.1.4'
implementation 'org.projectlombok:lombok:1.18.16'
runtimeOnly 'mysql:mysql-connector-java'
providedRuntime 'org.springframework.boot:spring-boot-starter-tomcat'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
compile('org.apache.tomcat.embed:tomcat-embed-jasper')
compile('javax.servlet:jstl')
runtimeOnly 'org.webjars:bootstrap:4.5.0'
~~~

## 발생 오류 
1. com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: Communications link failure
->Application.properties 파일에 추가 
spring.datasource.tomcat.testOnBorrow=true
spring.datasource.tomcat.validationQuery=SELECT 1 
: DB Pool이 생성이 되더라도 특정 시간 호출되지 않으면 DBMS 설정에 따라 연결이 끊어질 수 있음, 이 설정을 추가하면 연결을 유지시켜줌  
2. Web server failed to start. Port 8080 was already in use.
-> 8080포트가 사용 중임 
Cmd 에서 8080 포트 사용 중인거 죽이기 
Netstat -ano (사용 중인 포트 확인)
Taskkill /pid 11024 /f (pid가 11024인 포트 죽이기)

3. build.gradle re-import
라이브러리를 추가했는데 인식하지 못할 때, 오른쪽의 Gradle 밑 재시작 버전을 누르면됌 
![image](https://user-images.githubusercontent.com/58197075/108022493-fc2fdb00-7063-11eb-99bb-bebad6992476.png)
