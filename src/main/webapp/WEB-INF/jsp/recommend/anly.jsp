<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>취향 분석</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/all.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/rcmdAnly.css'>

</head>
<body class="borderGray bgGray" style="background-color: dimgray;">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray"> <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
            <h1>${sessionScope.loginUser.nickname}님 의 취향 분석 중</h1>
        </c:when>
    </c:choose>
    <hr>
    <section>
        <div class="spinner"></div>
    </section>
    
    </main>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script>
        window.onload = function(){
        	window.location.href = 'list';
        }
    </script>
</body>
</html>