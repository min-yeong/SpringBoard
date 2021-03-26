<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
    <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
    <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div id="root">
    <%@include file="../nav.jsp" %>
    <section id="container">
        <form role="form" method="post" action="/board/write">
            <table class="table table-hover">
                <tr class="table-active"><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th><th>조회수</th></tr>
                <%int idx = 1;%>
                <c:forEach items="${list}" var = "list">
                    <tr>
                        <td><%=idx%></td>
                        <td>
                            <a href="/board/readView?bno=${list.bno}"><c:out value="${list.title}" /></a>
                        </td>
                        <td><c:out value="${list.writer}" /></td>
                        <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
                        <td><c:out value="${list.hit}"/></td>
                    </tr>
                    <%idx++;%>
                </c:forEach>
            </table>
<%--            <div class="col-md-offset-3">--%>
<%--                <ul class="pagination">--%>
<%--                    <c:if test="${pageMaker.prev}">--%>
<%--                        <li><a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>--%>
<%--                    </c:if>--%>

<%--                    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">--%>
<%--                        <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>--%>
<%--                    </c:forEach>--%>

<%--                    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">--%>
<%--                        <li><a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>--%>
<%--                    </c:if>--%>
<%--                </ul>--%>
<%--            </div>--%>
        </form>
    </section>
</div>
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>

