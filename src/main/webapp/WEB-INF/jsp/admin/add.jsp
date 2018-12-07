<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/accountDetail.css'>
<link rel="stylesheet" href='/css/bootstrap2-toggle.min.css'>
<style>
table {
	text-align: center;
}

thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #00cc99;
}

thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
}

.table th, .table td {
	padding: 0.75rem;
	vertical-align: middle;
}

tbody td {
	background-color: #80808026;
}

.report-btn2 {
	color: #fff;
	background-color: #00cc99;
	border-color: #00cc99;
}

.report-btn2:hover {
	color: #fff;
	background-color: #00e6ac;
	border-color: #00e6ac;
}

.my-mv-list {
	height: 50rem;
}
</style>
</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<main role="main" class="container"> <!-- 작업부분 -->
	<form action="save" method="post">
		<h1 class="m-4" style="font-family: fantasy;">추천 테마 목록</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th colspan="2" scope="col"><h3>${theme.thm}</h3></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>영화추가</td>
					<td>영화목록</td>
				</tr>
			</tbody>
		</table>
		<section class="my-mv-list" style="margin: 2rem;">
			<!-- 영화검색부분 -->
			<div class="srchNlist">
				<div class="input-group"
					style="width: 30rem; float: left; position: absolute;">
					<div class="input-group-prepend">
						<div class="input-group-text">영화</div>
					</div>
					<input type="text" class="form-control" id="input-srch-keyword"
						placeholder="검색어를 입력해 주세요" autocomplete="off"> <span
						class="input-group-btn">
						<button class="btn btn-primary" id="btn-srch-movie"
							onclick="findMoviesByKeyword()" type="button">검색</button>
					</span>
				</div>
				<div class="searchList"
					style="width: 30rem; float: left; margin-top: 40px;">
					<ul class="list-group" id="list-search-movie"></ul>
				</div>
			</div>
			<!-- 등록한 영화 목록 -->
			<div class="listBox"
				style="width: 30rem; float: right; border: 1px solid sivler">
				<ol class="chooseList mt-0" id="list-choose-movie"
					style="margin-bottom: 1rem;">
					<c:forEach items="movieList" var="movie">
						<li class="list-group-item" id="mv-li-${movie.mvno}">
							<div class="media">
								<div class="media-body">
									<span class="mt-0"><b>${movie.title}</b></span>
									<button type="button" onclick="removeList(${movie.mvno})"
										style="float: right; cursor: pointer;"
										class="badge badge-primary badge-pill">제거</button>
									<input type="hidden" name="mvno" value="${movie.mvno}"> <input
										type="hidden" name="title" value="'${movie.title}'">
								</div>
							</div>
						</li>

					</c:forEach>
				</ol>
			</div>
		</section>
		<ol>
			<li><div>a</div></li>
			<li><div>a</div></li>
			<li><div>a</div></li>
			<li>a</li>
		</ol>
		<hr>


		<!-- <input type="hidden" name="selecList" id="test"> -->
		<input type="hidden" name="thmno" value="${theme.thmno}">


		<div class="confirm">
			<input type="submit" class="btn report-btn2" value="확인"> <input
				type="button" onclick="signUpCheck()" class="btn report-btn2"
				value="취소">
			<!-- <label class="btn report-btn2">확인<input type="button" onclick="signUpCheck()" style="display: none;" value="확인"></label> -->
			<!-- <label class="btn report-btn2">취소<input type="button" onclick="goToHome()" style="display: none;" value="취소"></label> -->
		</div>

	</form>
	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="/js/admin.js"></script>
	<script src="/js/bootstrap2-toggle.min.js"></script>

	<script>
    </script>


</body>
</html>