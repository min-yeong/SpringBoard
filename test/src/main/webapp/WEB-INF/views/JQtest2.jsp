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
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
