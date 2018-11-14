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
	cursor: pointer !important;
}

.pst:hover {
	background-color: #f2f2f2;
	font-weight: bold;
}

.pst>i {
	font-size: 2rem;
	vertical-align: sub;
}

.btmIcon {
	padding: 0 0 1rem 1rem;
	cursor: pointer !important;
	font-size: 1.3rem;
}

.reviewCont {
	height: 13rem;
	-ms-text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
	white-space: pre-line;
	overflow: hidden;
}
</style>
</head>
<body class="borderGray bgGray">
	<jsp:include page="../include/header.jsp"></jsp:include>

	<div role="main" class="container">

		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<div class="wPost">
					<h6 style="font-size: 0.7rem; font-weight: bold">리뷰 작성하기</h6>
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



		<div class="wPost reviewPst">

			<div class="media row" style="padding: 0 1rem">
				<img src="/img/default-movie-img.png"
					style="width: 1.8rem; height: 1.8rem; border-radius: 50%; margin-right: 0.5rem" />
				<div class="media-body">
					<div style="float: left">
						<a href="#" style="color: black;display: inline-block;" class="row">닉네임</a> <a href="#"
							style="color: blue; font-size: 0.2rem;display: inline-block;" class="row">친구태그</a>
					</div>
					<p style="float: right; font-size: 1.5rem">
						<b><i>영화제목</i></b>
					</p>
				</div>
			</div>
			<div class="clearfix media row" style="margin: 0.2rem 0">
				<div class="media-body">
					<p class="reviewCont">리뷰내용이다여기는!!!!!!!!!!!!!!!!!ffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffff

						ffffffffffffffffffffffffffffffffffffffffffffffffff
						fffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
						ffffffffffffffffffffffffffffffffffffffffffffffffffffffff</p>
				</div>
				<!-- <span style="color:blue;font-size:0.2rem">더보기...</span>  -->
				<img src="/img/default-movie-img.png"
					style="width: 20rem; height: 13rem; margin-left: 1rem;" />
			</div>
			<div class="row">
				<div class="col-6" style="text-align: left">
					<i class="far fa-thumbs-up btmIcon" style="color: red"></i> <i
						class="far fa-comment btmIcon"></i>
				</div>
				<div class='wXstar starrr col-6' style="text-align: right;"></div>
			</div>

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
	<script>
	function isOverflown(element) {
	    return element.scrollHeight > element.clientHeight || element.scrollWidth > element.clientWidth;
	}
        $('.wXstar').starrr({
            rating : 2,
            max : 5,
            readOnly : true,
            emptyClass : 'far fa-star',
            fullClass : 'fas fa-star'
        });
    </script>
</body>
</html>