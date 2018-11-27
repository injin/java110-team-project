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
/* MyPage */
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
				<table class="table" style="width: 52.1rem; border-right:1px solid silver; 
				      border-left:1px solid silver;margin-bottom: 0px;">
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

	<jsp:include page="../sceneAlbum/sceneAlbumList.jsp"></jsp:include> <jsp:include
		page="../sceneAlbum/albumPopup.jsp"></jsp:include> </main>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>

	<script>
        function albumDetail(lbmTitle, open) {
            //alert(lbmTitle);
            console.log(lbmTitle);
            console.log(open);
            $('#detailForm input[name="lbmTitle"]').val(lbmTitle);
            $('#detailForm input[name="open"]').val(open);
            $('#detailForm').submit();

        }

    </script>


</body>
</html>