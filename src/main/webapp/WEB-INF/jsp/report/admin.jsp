<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scenecok</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel="stylesheet" href='/css/bootstrap2-toggle.min.css'>
</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>
    <main role="main" class="container">
        <jsp:include page="adminlist.jsp"/>
    </main>
    <jsp:include page="../include/commonJs.jsp"></jsp:include>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    
    
    
    <script src="/js/bootstrap2-toggle.min.js"></script>

</body>
</html>