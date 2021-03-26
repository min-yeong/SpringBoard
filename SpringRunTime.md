# Spring Run Time

Servlet : Servlet Container에 의해 인스턴스가 생성, 초기화, 서비스가 되는 구조 
즉, Java Object의 인스턴스개 생성되서 서비스되고 소멸까지 하는 것을 Servlet Container가 담당 

## 스프링 빈 (Spring Bean) 
- 특정 컨테이너가 Java Object의 라이프 사이클을 관리하고, 그 라이프 사이클을 관리하는 오브젝트

### Bean 
- Spring 프레임 워크가 관리하는 인스턴스
- Bean은 Spring이 인스턴스 생성, 초기화, 소멸작업을 담당
- 즉, 인스턴스의 라이프사이클을 관리

### Bean Container
- Bean 라이프사이클을 관리하는 기능
- Spring 프레임워크에 Bean Container 기능을 가지고 있음
- Spring Container 또는 DI Container 라고 부름 

### Bean Container 기능을 추상화한 클래스 
- BeanFactory
- ApplicationContext
- ApplicationContext는 BeanFactory 기능을 모두 포함하면서 추가적인 기능을 제공
- Bean Container와 관련한 핵심 기능을 BeanFactory가 가짐

Spring 에서는 ApplicationContext를 이용해 Bean Container를 초기화
ApplicationContext를 하나 생성할 때마다 Bean Contrainer가 생성

## Bean 생성 방법 
### Annotation으로 컨테이너 Bean 등록
https://velog.io/@gillog/Spring-Bean-%EC%A0%95%EB%A6%AC

### xml 파일에서 등록

## 스프링에서 인스턴스 ( 빈 ) 생성 되는 시점

xml name space

질문 : 사용자 /요청이 왔을때 인스턴스가 몇개 생성되나요? 안되나요?
mapper 호출 했을때 인스턴스가 생성되나요? 몇개 생성되나요? 어떻게 동작하나요?
