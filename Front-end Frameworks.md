# Angular 
SPA(Single Page Application) 방식의 프론트엔드 개발을 위한 자바 스크립트 프레임워크, TypeScript 사용
- SPA : 서버로부터 새로운 페이지를 불러오지 않고 현재 페이지를 동적으로 작동
  
### 장점
- 컴포넌트 기반 : 기능에 따라 코드를 분리, 재사용 간편, 각각의 컴포넌트 클래스는 자신만의 HTMl컴포넌트에 집중할 수 있어 웹 화면을 구성하는 컴포넌트간의 독립이 명확
- 웹페이지 속도 : SPA 는 다른 페이지로의 전환 속도가 빠름, 클라이언트 측에서 화면을 생성하고 필요한 데이터만 Ajax 요청을 통해 서버에서 내려받음 
- 프레임워크 : 기본으로 제공되는 모듈이 다양해서 각 모듈의 정확성과 자연스러운 데이터 연결 보장
### 단점
- TypeScript 언어의 학습과 Angular의 개념들이 어떻게 표현되는지 알야아함
- 초기로딩속도가 느림

### 용어정리
#### Model (모델)
- 단순 자바스크립트 객체로된 데이터 및 데이터 구조
- 변형되지 않은 단순 자바스크립트 객체 그대로 사용

#### View (뷰)
- 템플릿과 모델이 합쳐져서 화면에 보여지는 DOM
- 템플릿이 HTML로 되어있어 바로 DOM으로 해석
- DOM안에 Directive가 템플릿 엔진인 $conpile 지시어를 통해 $watch를 설정하고 모델의 변경을 계속 감시

#### Controller (컨트롤러)
- 자바스크립트로된 제어 로직
- 모델을 생성하고 메소드를 가지고 View로 퍼블리싱 담당

#### Scope 
- 특정 DOM 영역을 위한 모델
- 모델과 뷰 감시, 반영, 컨트롤러에 이벤트 전송
- DOM과 가까운 계층 구조 

#### Template (템플릿)
- HTML 자체를 템플릿으로 사용
- 지시어, 표현식, 필터 등으로 템플릿 제어

#### Expressions (표현식)
- 해당 Scope로부터 함수나 변수에 접근하는 표현식 
- 지시어로 존재

#### Filter 
- 표현식이 화면에 표기
- {{ 표현식 | 필터 }} 형태
- 사용자 정의

#### Data Binding 데이터 바인딩
- 모델과 뷰의 데이터 실시간 연동
- Two-Way Data Binding : 양방향 바인딩, 모델과 뷰 중 어느 쪽이 변하든 두 상태 정보를 자동으로 일치시켜 주는 기능
- One-Way Data Binding : 단방향 바인딩, 모델에서 뷰로, 혹은 뷰에서 모델로 한 방향의 상태 정보를 일치시켜 주는 기능

#### Module 모듈
- 컨트롤러, 서비스, 필터, 지시어 등을 포함해 응용프로그램의 서로 다른 기능 구현하는 컨테이너
- ng-app='첫 모듈명' -> Root Module를 시작으로 모듈 단위로 관리

#### Service 서비스  
- 특정 기능을 담당하는 객체들 
- 공통된 특정 작업 수행 

#### DI (Dependency Injection) 의존성 주입
- 구성요소간의 종속성을 유지하는 방법을 다룸
![image](https://user-images.githubusercontent.com/58197075/109766572-b107f180-7c39-11eb-8329-fb4c3dbfd040.png)


#### Injector 
- Dependency Injection을 담는 컨테이너 역할

#### Compiler
- 템플릿에 AngularJS만의 지시어나 표현식을 처리하는 역할 

### 동작방식
![image](https://user-images.githubusercontent.com/58197075/109623561-9e7db180-7b80-11eb-93b4-1dfe0f4af319.png)
1. 브라우저가 html을 로드 (DOM을 파싱)
2. Angular.js 로드
3. DOM Content Loaded Event 대기
4. DOM이 로드되면 ng-app 지시자 검색
5. ng-app에서는 DI를 위해 사용되는 $injector 생성
6. injector 지시어는 어플리케이션의 모델을 위한 컨텍스트가 되는 루트 스코프 생성 
7. 최종적으로 ng-app을 기준으로 하위 DOM을 컴파일하고 RootScope과 링크 
- $RootScope : $scope의 가장 최상위 scope
- $compile : DOM 트리를 탐색하고 DOM 요소를 지시문에 일치시키는 프로세스

# Angular 
- AngularJS는 SPA 방식의 웹 개발을 위한 프레임 워크 
- 주요 기능 
MVC 지원,
양방향 데이터 바인딩,
RESTful API,
의존성 주입,
템플릿,
HTML 확장,
양식 유효성 검사

~~~
<%--
  AngularJS : 자바스크립트 MVN(Model View Whatever) 프레임워크

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="ngApp">
<head>
    <title>Title</title>
    <script data-require="angular.js@1.4.8" data-semver="1.4.8" src="https://code.angularjs.org/1.4.8/angular.js"></script>
</head>
<script>
    // 모듈 선언
    var ngApp = angular.module("ngApp", []);
    // 컨트롤러 정의, $scope객체로 컨트롤러 호출 
    ngApp.controller("ngController", function($scope) {
        $scope.arrData = [{
            id: 1,
            name: "Apple"
        }, {
            id: 2,
            name: "Banana"
        }, {
            id: 3,
            name: "Orange"
        }, {
            id: 4,
            name: "Mango"
        }
        ];
    });
</script>

// 컨트롤러 추가 
<body ng-controller="ngController">
<h2>AngularJS Repeat</h2>
<table>
    <tbody>
    <tr ng-repeat="data in arrData">
        <td>{{ data.id }}</td>
        <td>{{ data.name }}</td>
    </tr>
    </tbody>
</table>
</body>
</html>
~~~

- 양방향 데이터 바인딩 
~~~
<%--
    양방향 데이터 바인딩
    ng-model 디렉티브를 사용
    inputText Element에 값을 입력할때 마다, p Element의 값을 변경

    InputText Element의 ng-model 디렉티브에 text라는 이름 할당
    ngCtrl(AngularJS 컨트롤러)에 text라는 이름으로 InputText의 값이 할당
    {{}} 라는 AngularJS의 표현식에서 text에 할당된 값 표현
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="ngApp">
<head>
    <title>AngularJS Plunker</title>
    <script data-require="angular.js@1.4.8" data-semver="1.4.8" src="https://code.angularjs.org/1.4.8/angular.js"></script>
</head>
<script>
    // 모듈 선언
    var app = angular.module('ngApp', []);
    // 컨트롤러 설정
    app.controller('ngCtrl', function($scope) {
    });
</script>

// 컨트롤러 추가 
<body ng-controller="ngCtrl">
// ng-model 속성으로 이름을 지정하면 input값 전송
<input ng-model="text" />
<p>{{ text }}</p>
</body>
</html>
~~~

# jQuery 
- 자바스크립트 언어를 간편하게 사용할 수 있도록 단순화시킨 오픈 소스 기반의 자바스크립트 라이브러리
- 주요 기능 
HTML / DOM 조작,
CSS 조작,
AJAX / JSONP,
이벤트 처리,
효과 및 애니메이션,
브라우저 간 호환성,
경량 (축소 및 gzip)

~~~
<%--
    JQuery : 자바스크립트 Library
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
    // Add your javascript here
    $(function() {
        var arrData = [{
            id: 1,
            name: "Apple"
        }, {
            id: 2,
            name: "Banana"
        }, {
            id: 3,
            name: "Orange"
        }, {
            id: 4,
            name: "Mango"
        }
        ];

        var html = "";

        $.each(arrData, function(idx) {
            html += '<tr>' + '<td>' + arrData[idx].id + '</td>' + '<td>' + arrData[idx].name + '</td>' + '</tr>';
        });

        $("#tbl").html(html);
    });
</script>

<body>
<h2>jQuery Repeat</h2>
<table id="tbl">
    <tbody></tbody>
</table>
</body>
</html>
~~~

- 양방향 데이터 바인딩
~~~
<%--
    inputText Element에 값을 입력할때 마다, p Element의 값을 변경

    txtText Id를 가진 inputText Element의 keyup 이벤트 시 p id를 가진
    pElement의 text를 inputText Element의 값으로 변경
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
</head>
<script>
    $(function(){
        $("#txtText").keyup(function() {
            $("#p").text($(this).val());
        });
    });
</script>

<body>
<input type="text" id="txtText" />
<h1 id="p"></h1>
</body>
</html>
~~~

# JQuery와 Angular의 차이점 
- Angular는 JQuery와 달리 다른 이벤트 처리없이 바로 실시간으로 동적 페이지 구현이 가능
- JQuery는 라이브러리, Angular는 프레임워크 

Angular 예제 및 사용법 설명 잘되어있음
https://araikuma.tistory.com/category/AngularJS
https://docs.angularjs.org/api/ng

----------------------------------------------------------------------------------------------

# 추가 정리

SPA (Spring Page Application) : DOM을 새로 로드하지 않고 한 DOM 내에서 동적인 작동
TypeScript : javascript의 단점(변수에 타입선언이 불가)을 보안하고자 변수에 타입을 지정해줄 수 있게 만든 언어 

![image](https://user-images.githubusercontent.com/58197075/109787819-f59f8700-7c51-11eb-969d-bfb2f5b9e719.png)

