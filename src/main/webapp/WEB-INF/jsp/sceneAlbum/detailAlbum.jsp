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
<link rel='stylesheet' href='/css/all.css'>

<style>
.profile-img {
	width: 5em;
	height: 5em;
	border-radius: 3rem;
	float: left;
}

.btn-size {
	padding: 0.1rem 0.3rem;
}

.th-fix {
	width: 15%;
	text-align: center;
}
</style>

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="bgGray">

	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container">
	<div class="container">
		<div class="row flex-xl-nowarp">
			<div class="col-12 col-md-3 col-xl-3">
				<form action="flwlist" method="post" enctype="multipart/form-data">
					<img class="card-img-top" src="${loginUser.profileImagePath}"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">${loginUser.nickname}</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
					</div>
				</form>
			</div>
			<!-- main 태그 말고 다른 태그로 !  -->
			<div class="col-12 col-md-9 col-xl-8">
				<img style="width: 52.1rem; height: 420px;"
					src="${loginUser.coverImagePath}">
				<table class="table"
					style="width: 52.1rem; border-right: 1px solid silver; border-left: 1px solid silver; margin-bottom: 0px;">
					<thead>
						<tr>
							<th scope="col" class="th-fix">나의 피드</th>
							<th scope="col" class="th-fix">정보수정</th>
							<th scope="col" class="th-fix">통 계</th>
							<th scope="col" class="th-fix">팔로우</th>
							<th scope="col" class="th-fix">활동로그</th>
							<th scope="col" class="th-fix">장면보관함</th>
						</tr>
					</thead>
				</table>
				<div class="row ml-1" style="width: 52.1rem;"></div>
			</div>
		</div>
	</div>



	<!-- 앨범 상세 -->
	<section>
		<div class="row mbr-justify-content-center">
			<div class="col-lg-12 mbr-col-md-12">

				<div class="row detailList col-lg-9">
					<div class="col-lg-12 mt-4 ml-1 mb-5">
						<span class="titl">${title}</span>
						<div class="a_btn btn btn-success btn-lg mr-2"
							onclick="document.getElementById('mgrAlbum').click();">
							수정하기<input type="hidden" data-toggle="modal" id="mgrAlbum"
								data-target="#mgrModal" />
						</div>
					</div>
					<!-- 앨범 목록 -->
					<div class="row" style="margin: 0 auto;">
						<!-- 장면 -->
						<c:forEach var="sceneReview" items="${sceneReview}" >
							<div class="row scene">
								<a
									href="/app/sceneReview/review?mvno=${sceneReview.mvno}&srno=${sceneReview.srno}">
									<img class="card-img-top hot-sr-img"
									src="/upload/sceneReview/${sceneReview.photo}"
									alt="Card image cap">
								</a>

							</div>
						</c:forEach>
						<!-- <div class="row test"></div>
						<div class="row test"></div> -->
					</div>
					<!-- 페이징버튼 -->

					<jsp:include page="paging.jsp" flush="true">
						<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
						<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
						<jsp:param name="startPageNo" value="${paging.startPageNo}" />
						<jsp:param name="pageNo" value="${paging.pageNo}" />
						<jsp:param name="endPageNo" value="${paging.endPageNo}" />
						<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
						<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
					</jsp:include>
					<form class="listForm" action="detail" method="post">
						<input type="hidden" name="pageNo">
					</form>

				</div>
			</div>
		</div>

		<jsp:include page="../sceneAlbum/mgrPopup.jsp"></jsp:include>

	</section>
	</main>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>


</body>
</html>