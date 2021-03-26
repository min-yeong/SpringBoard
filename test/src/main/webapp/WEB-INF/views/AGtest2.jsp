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
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<script>
    var app = angular.module('ngApp', []);
    app.controller('ngCtrl', function($scope) {
    });
</script>

<body ng-controller="ngCtrl">
<input ng-model="text" />
<p>{{ text }}</p>
</body>

</html>
