<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/adminlist.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel="stylesheet" href='/css/bootstrap2-toggle.min.css'>

<style>

.boxSize{
 
  box-sizing: 0 !important;
}

</style>

</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main" class="container">
        <jsp:include page="adminlist.jsp"/>
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>

    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/common.js"></script>
    <script type="text/javascript"></script>
    <script src="/js/bootstrap2-toggle.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/adminlist.js"></script>
    

    
</body>
</html>