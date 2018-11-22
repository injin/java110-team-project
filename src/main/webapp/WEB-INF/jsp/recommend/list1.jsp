<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- /**
 * @author Jeaha
 * 영화 추천을 위한 QUARTET
 * 
 * 회원 영화 취향 분석 테이블 -> mv_mv_anly
 * 최초 등록한 영화는 10점씩 point를 줬음.
 * 활동 로그를 바탕으로 영화별 점수를 줘야 함.
 * 
 * 등록시 취향 장르 테이블 -> mv_memb_gr
 * 활동 로그를 바탕으로 회원 영화 취향 장르 분석 테이블 -> mv_gr_anly
 * 
 * 세 테이블을 분석해서 영화 추천을 해야 함.
 * 
 * 기존 기록에 있는 영화들 분석해서 취향 저격 영화 추천 해 주는 list 1개 출력.
 * 기존 기록에 있는 영화 기반 추천 list 2개 3개,
 * folow한 member 중 취향이 비슷한 member의 추천 리스트를 같이 추천해 주는 메소드 1개
 * 그리고 관리자 추천영화 리스트 다수가 있으면 좋을것 같음.
 * 
 * 연결된 source
 * RecommendMvController
 * recommend/recommend.jsp
 * RecormendService
 * RecormendServiceImple
 * RecommendDao
 * RecommendDao.xml
 */ --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>

<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/fontawesome.css'>
<link rel='stylesheet' href='/css/all.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
<link rel='stylesheet' href='/css/rcmd.css'>

</head>
<body class="borderGray bgGray" style="background-color: dimgray;">
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main role="main" class="container borderGray"> <c:choose>
		<c:when test="${not empty sessionScope.loginUser}">
			<h1>${sessionScope.loginUser.nickname}님만을 위한 영화 추천</h1>
		</c:when>
	</c:choose>
	<hr>
	<br>



    <section>
	<h3>${listName1}</h3>
	<div id="carousel" class="list-container">
		<div class="control-container">
			<div id="left-scroll-button" class="left-scroll button scroll left-scroll-btn">
				<i class="fa fa-chevron-left" aria-hidden="true"></i>
			</div>
			<div id="right-scroll-button" class="right-scroll button scroll right-scroll-btn">
				<i class="fa fa-chevron-right" aria-hidden="true"></i>
			</div>
		</div>
		<div class="items" id="carousel-items">
			<c:forEach items="${list1}" var="list1">
				<div class="item" onclick="toDetail('${list1.id}')">
					<img class="item-image" src="https://image.tmdb.org/t/p/w500${list1.posterPath}" />
						<span class="item-title">${list1.title}</span>
					<!-- <span class="item-load-icon button opacity-none"><i class="fa fa-play"></i></span> -->
					<div class="item-description opacity-none">개봉일 : ${list1.releaseDate}<br>런타임 : ${list1.runtime}분<br>네티즌 평점 : ${list1.voteAverage}</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</section>
	<hr>
	

	<section>
	<h3>${listName2}</h3>
	<div id="crsl2" class="list-container">
	    <div class="control-container">
	        <div id="2nd-left-scroll-button" class="left-scroll button scroll left-scroll-btn">
	            <i class="fa fa-chevron-left" aria-hidden="true"></i>
	        </div>
	        <div id="2nd-right-scroll-button" class="right-scroll button scroll right-scroll-btn">
	            <i class="fa fa-chevron-right" aria-hidden="true"></i>
	        </div>
	        </div>
	        <div class="items" id="crsl2-items">
	            <c:forEach items="${list2}" var="list2">
	                <div class="item" onclick="toDetail('${list2.id}')">
	                <img class="item-image" src="https://image.tmdb.org/t/p/w500${list2.posterPath}" />
	                <span class="item-title">${list2.title}</span>
	            <!--<span class="item-load-icon button opacity-none"><i class="fa fa-play"></i></span> -->
	                <div class="item-description opacity-none">개봉일 : ${list2.releaseDate}<br>런타임 : ${list2.runtime}분<br>네티즌 평점 : ${list2.voteAverage}</div>
	            </div>
	        </c:forEach>
	    </div>
	</div>
	</section>
    <hr>






	</main>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="/js/rcmd.js"></script>
</body>
</html>