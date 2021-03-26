<%--
  AngularJS : 자바스크립트 MVN(Model View Whatever) 프레임워크

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html ng-app="ngApp">
<head>
    <title>Title</title>
    <script data-require="angular.js@1.4.8" data-semver="1.4.8" src="https://code.angularjs.org/1.4.8/angular.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<script>
    // Code goes here
    var ngApp = angular.module("ngApp", []);

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
