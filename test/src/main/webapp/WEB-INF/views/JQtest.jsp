<%--
    JQuery : 자바스크립트 Library
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
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
