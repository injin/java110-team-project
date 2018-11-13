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
<style>
.wPost {
	background: white;
	padding: 1rem 1rem 0 1rem;
	border-radius: 0.5rem;
	box-shadow: 7px 7px 30px -5px rgba(0, 0, 0, 0.1);
	margin: 2rem 0;
}

.pst {
	padding: 1rem 0;
	font-size: 1.1rem;
}

.pst:hover {
	background-color: #f2f2f2;
	font-weight: bold;
}

.pst>i {
	font-size: 2rem;
	vertical-align: sub;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>

	<div role="main" class="container">


		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<div class="wPost">
					<h6>리뷰 작성하기</h6>
					<div style="border-bottom: 1px solid #00cc99; color: #00cc99">
						${sessionScope.loginUser.nickname}님, 무슨 영화를 보셨나요?</div>
					<div class="row">
						<div class="col text-center pst"
							onclick="document.getElementById('btnIlsang').click();">
							<i class="far fa-image"></i> 일상 리뷰 올리기<input type="hidden"
								data-toggle="modal" id="btnIlsang" data-target="#reviewModal" />
						</div>
						<div class="col text-center pst"
							onclick="document.getElementById('btnMovie').click();">
							<i class="fas fa-film"></i> 영화 리뷰 올리기<input type="hidden"
								data-toggle="modal" id="btnMovie" data-target="#reviewModal" />
						</div>
					</div>
				</div>
			</c:when>
		</c:choose>

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