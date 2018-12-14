<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scenecok</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<!-- <link rel='stylesheet' href='/css/fontawesome.css'> -->
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/accountDetail.css'>
<link rel="stylesheet" href='/css/bootstrap2-toggle.min.css'>
<link rel="stylesheet" href="/css/tabstyles.css">

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
/* tabs*/
.tabs {
	position: relative;
	overflow: hidden;
	margin: 0 auto;
	width: 100%;
	font-weight: 300;
	font-size: 1.25em;
}

/* Nav */
.tabs nav {
	text-align: center;
}

.tabs nav ul {
	position: relative;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: -moz-flex;
	display: -ms-flex;
	display: flex;
	margin: 0 auto;
	padding: 0;
	max-width: 1200px;
	list-style: none;
	-ms-box-orient: horizontal;
	-ms-box-pack: center;
	-webkit-flex-flow: row wrap;
	-moz-flex-flow: row wrap;
	-ms-flex-flow: row wrap;
	flex-flow: row wrap;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
	justify-content: center;
}

.tabs nav ul li {
	position: relative;
	z-index: 1;
	display: block;
	margin: 0;
	text-align: center;
	-webkit-flex: 1;
	-moz-flex: 1;
	-ms-flex: 1;
	flex: 1;
}

.tabs nav a {
	position: relative;
	display: block;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	line-height: 2.5;
}

.tabs nav a span {
	vertical-align: middle;
	font-size: 0.75em;
}

.tabs nav a:focus {
	outline: none;
}

a {
	color: #000000;
	text-decoration: none;
	background-color: transparent;
	-webkit-text-decoration-skip: objects;
}

a:hover {
	color: #000000;
	text-decoration: none;
	

}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main role="main" class="container"> <!-- 작업부분 -->
	<form class="addForm" action="save" method="post">
		<h1 class="m-4" style="font-family: fantasy;">추천 테마 목록</h1>
		<table class="table table-hover">
			<thead>
				<tr>
					<th colspan="2" scope="col"><h3>${theme.thm}<!-- <i
                            class="far fa-edit" style="font-size: 1rem;"></i> -->
						</h3></th>
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
					<c:forEach items="${movieList}" var="movie" varStatus="status">
						<li id="mv-li-${movie.mvno}">
							<div class="media list-group-item">
								<div class="media-body">
									<span class="mt-0"><b>${movie.title}</b></span>
									<button type="button" onclick="removeList(${movie.mvno})"
										style="float: right; cursor: pointer;"
										class="badge badge-primary badge-pill">제거</button>
									<input type="hidden" name="favMvIdList" value="${movie.mvno}">
									<input type="hidden" name="favMvTitleList"
										value="${movie.title}">
								</div>
							</div>
						</li>
					</c:forEach>
				</ol>
			</div>
		</section>
		<hr>

		<!-- <input type="hidden" name="selecList" id="test"> -->
		<input type="hidden" name="thmno" value="${theme.thmno}">


		<div class="confirm">
			<input type="button" class="btn report-btn2" onclick="saveRcmdList()"
				value="확인"> <input type="button" class="btn report-btn2"
				onclick="goBack()" value="취소">
		</div>

	</form>
	</main>
	<jsp:include page="../include/commonJs.jsp"></jsp:include>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="/js/movieList.js"></script>
	<script src="/js/bootstrap2-toggle.min.js"></script>

	<script>
	   $(document).ready(function(){
           $(".li").hover(function(){
               $(this).addClass("tab-current");
               }, function(){
               $(this).removeClass("tab-current");
           });
       });
	
    </script>


</body>
</html>