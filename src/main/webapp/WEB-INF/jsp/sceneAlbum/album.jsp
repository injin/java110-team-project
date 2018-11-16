<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/fontawesome.css'>
<link rel='stylesheet' href='/css/album.css'>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="bgGray">

	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container">
        <jsp:include page="../sceneAlbum/sceneAlbumList.jsp"></jsp:include>    
    </main>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>
	
</body>
</html>