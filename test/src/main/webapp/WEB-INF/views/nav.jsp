<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게시판</title>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <!-- 합쳐지고 최소화된 최신 CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 부가적인 테마 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
    <!-- 합쳐지고 최소화된 최신 자바스크립트 -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel='stylesheet' href='/webjars/bootstrap/4.5.0/css/bootstrap.min.css'>
    <style>
        body {
            padding-top: 0px;
            padding-bottom: 30px;
        }
        .title_size {
            font-size : 20px;
        }
        .size {
            font-size : 15px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor01">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link title_size" href="/board/list">게시판
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link size" href="/board/list">목록</a>
            </li>
            <c:if test="${member == null}">
            <li class="nav-item">
                <a class="nav-link size" href="/">로그인</a>
            </li>
            <li class="nav-item">
                <a class="nav-link size" href="/member/register">회원가입</a>
            </li>
            </c:if>
            <c:if test="${member != null}">
            <li class="nav-item">
                <a class="nav-link size" href="/member/memberUpdateView">회원정보</a>
            </li>
            <li class="nav-item">
                <a class="nav-link size" href="/board/writeView">게시글 등록</a>
            </li>
            <li class="nav-item">
                <a class="nav-link size" href="/member/logout">로그아웃</a>
            </li>
            </c:if>
        </ul>
    </div>
</nav>
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>



