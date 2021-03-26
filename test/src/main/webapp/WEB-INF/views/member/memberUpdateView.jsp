<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        :root{
            --body-background-color: #f5f6f7;
            --font-color: #4e4e4e;
            --border-gray-color : #dadada;
            --naver-green-color: #04c75a;
            --naver-green-border-color: #06b350;
        }
        *{
            margin:0;
            padding:0;
        }
        body{
            background:var(--body-background-color);
        }
        .main-container{
            width:100%;
            display:flex;
            flex-direction:column;
            align-items:center;
            margin-top: 21px;
        }
        .main-container .main-wrap{
            width:768px;
        }
        .main-container .main-wrap .sel-lang-wrap .lang-select
        {
            width: 96px;
            height: 30px;
            color: var(--font-color);
            border: solid 1px var(--border-gray-color);
        }
        .main-container .main-wrap .logo-wrap{
            padding-top:55px;
        }
        .main-container .main-wrap .logo-wrap img
        {
            width: 231px;
            height: 44px;
        }

        .main-container .main-wrap header .sel-lang-wrap{
            display:flex;
            justify-content:flex-end;
        }

        .main-container .main-wrap header .logo-wrap{
            display:flex;
            flex-direction: column;
            align-items: center;
        }
        .login-input-section-wrap{
            padding-top: 60px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        .login-input-wrap{
            width: 465px;
            height :48px;
            border: solid 1px var(	--border-gray-color );
            background: white;
        }
        .password-wrap{
            margin-top: 13px;
        }
        .login-input-wrap input{
            border: none;
            width:430px;
            margin-top: 10px;
            font-size: 14px;
            margin-left: 10px;
            height:30px;
        }
        .login-button-wrap {
            padding-top: 13px;
        }
        .login-button-wrap button{
            width: 465px;
            height :48px;
            font-size: 18px;
            background: var(--naver-green-color);
            color: white;
            border: solid 1px var(--naver-green-border-color);
        }
    </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        // 취소
        $(".cencle").on("click", function(){
            location.href = "/board/list";
        })
        $("#submit").on("click", function(){
            if($("#userPass").val()==""){
                alert("비밀번호를 입력해주세요.");
                $("#userPass").focus();
                return false;
            }
            if($("#userName").val()==""){
                alert("성명을 입력해주세요.");
                $("#userName").focus();
                return false;
            }
            if($("#company").val()==""){
                alert("부서를 입력해주세요.");
                $("#company").focus();
                return false;
            }
        });
    })
</script>
<body>
<div>
    <%@include file="../nav.jsp" %>
</div>
<form action="/member/memberUpdate" method="post">
    <div class="main-container">
        <div class="main-wrap">
            <section class="login-input-section-wrap">
                <div class="login-input-wrap form-group has-feedback">
                    <input placeholder="Username" type="text" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
                </div>
                <div class="login-input-wrap password-wrap form-group has-feedback">
                    <input placeholder="Password" type="password" id="userPass" name="userPass" value="${member.userPass}"/>
                </div>
                <div class="login-input-wrap password-wrap form-group has-feedback">
                    <input placeholder="userName" type="text" id="userName" name="userName" value="${member.userName}"/>
                </div>
                <div class="login-input-wrap password-wrap form-group has-feedback">
                    <input placeholder="company" type="text" id="company" name="company" value="${member.company}"/>
                </div>
                <div class="login-button-wrap form-group has-feedback">
                    <button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
                </div>
            </section>
        </div>
    </div>
</form>
</body>
</html>
