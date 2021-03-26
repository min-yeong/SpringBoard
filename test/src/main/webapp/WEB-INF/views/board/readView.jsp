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
        var formObj = $("form[name='readForm']");
        // 수정
        $(".update_btn").on("click", function(){
            formObj.attr("action", "/board/updateView");
            formObj.attr("method", "get");
            formObj.submit();
        })
        // 삭제
        $(".delete_btn").on("click", function(){
            var deleteYN = confirm("삭제하시겠습니까?");
            if(deleteYN == true){
                formObj.attr("action", "/board/delete");
                formObj.attr("method", "post");
                formObj.submit();
            }
        })
        // 취소
        $(".list_btn").on("click", function(){
            location.href = "/board/list";
        })
    })
</script>
<body>
<div>
    <%@include file="../nav.jsp" %>
</div>
    <form name="readForm" role="form" method="post">
        <input type="hidden" id="bno" name="bno" value="${read.bno}" />
    <div class="form-group">
        <label for="title">제목</label>
        <input type="text" class="form-control chk" style="height:35px;font-size:15px;" id="title" value="${read.title}" readonly="readonly" />
    </div>
    <div class="form-group">
        <label for="writer">작성자</label>
        <input type="text" class="form-control chk" style="height:35px;font-size:15px;" id="writer" name="writer" value="${read.writer}" readonly="readonly"/>
    </div>
    <div class="form-group">
        <label for="content">내용</label>
        <textarea class="form-control chk" style="font-size:15px;" id="content" name="content" rows="10" readonly="readonly"><c:out value="${read.content}" /></textarea>
    </div>
    <div class="form-group">
        <label for="regdate" class="col-sm-2 control-label">작성날짜</label>
        <fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />    </div>
    <div>
        <c:if test="${member.userId == read.writer}">
            <button type="submit" class="btn btn-info update_btn">수정</button>
            <button type="submit" class="btn btn-secondary delete_btn">삭제</button>
        </c:if>
    </div>
    </form>
</body>
</html>