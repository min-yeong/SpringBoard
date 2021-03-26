<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        *{
            margin:0;
            padding:0;
            font-size : 15px;
        }
        form {
            padding: 50px;
            background-color: rgba(93, 93, 93, 0.4);
            padding:35px 35px 50px;
            width: 800px;
            left: 40%;
            position: absolute;
            margin-top: 30px;
            margin-left: -260px;
            -moz-border-radius: 7px;
            -webkit-border-radius: 7px;
        }
    </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        var formObj = $("form[name='writeForm']");
        $(".write_btn").on("click", function(){
            if(fn_valiChk()){
                return false;
            }
            formObj.attr("action", "/board/write");
            formObj.attr("method", "post");
            formObj.submit();
        });
    })
    function fn_valiChk(){
        var regForm = $("form[name='writeForm'] .chk").length;
        for(var i = 0; i<regForm; i++){
            if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
                alert($(".chk").eq(i).attr("title"));
                return true;
            }
        }
    }
</script>
<body>
    <div>
        <%@include file="../nav.jsp" %>
    </div>
    <form name="writeForm" method="post" action="/board/write">
        <div class="form-group">
            <label for="title">제목</label>
            <input type="text" class="form-control chk" style="height:35px;font-size:15px;" id="title" name="title" placeholder="제목을 작성해주세요.">
        </div>
        <div class="form-group">
            <label for="writer">작성자</label>
            <input type="text" class="form-control chk" style="height:35px;font-size:15px;" id="writer" name="writer" placeholder="이름을 적어주세요.">
        </div>
        <div class="form-group">
            <label for="content">내용</label>
            <textarea class="form-control chk" style="font-size:15px;" id="content" name="content" rows="10"></textarea>
        </div>
        <button type="submit" class="btn btn-info">등록하기</button>
        <button type="button" class="btn btn-secondary" onClick="location.href='/board/list'">목록으로</button>
    </form>
</body>
</html>




