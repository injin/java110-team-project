<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link href="/css/fontawesome.css" rel="stylesheet">
<link href="/css/all.css" rel="stylesheet">
<link rel='stylesheet' href='/css/writingPost.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/starrr.css'>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>

	<div role="main" class="container">

	<div class="jumbotron">
		<h1>Navbar example</h1>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			id="btnIlsang" data-target="#reviewModal">일상리뷰</button>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			id="btnMovie" data-target="#reviewModal">영화리뷰</button>

	</div>

	<jsp:include page="writingPost.jsp"></jsp:include> 
	
	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/starrr.js"></script>
	<script src="/js/common.js"></script>
	<script src="/js/writingPost.js"></script>
</body>
</html>