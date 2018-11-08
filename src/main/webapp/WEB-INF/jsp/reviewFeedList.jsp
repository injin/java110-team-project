<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<link rel='stylesheet' href='/css/writingIlsang.css'>
<!-- <link rel='stylesheet' href='/css/writingMovie.css'> -->
<link rel='stylesheet' href='/css/common.css'>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/writingIlsang.js"></script>
<script src="/js/writingMovie.js"></script>
</head>
<body>

	<jsp:include page="include/header.jsp"></jsp:include>


	<main role="main" class="container">
	<div class="jumbotron">
		<h1>Navbar example</h1>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal">일상리뷰</button>
        <button type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#exampleModal2">영화리뷰</button>

	</div>

	<jsp:include page="writingIlsang.jsp"></jsp:include>
	<jsp:include page="writingMovie.jsp"></jsp:include>
	</main>

	<jsp:include page="include/footer.jsp"></jsp:include>

	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>
	<script type="text/javascript">
        
    </script>
</body>
</html>