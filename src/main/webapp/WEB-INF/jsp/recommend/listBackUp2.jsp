<%@ page language="java"
    contentType="text/html; charset=UTF-8"
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

<style type="text/css">
.col-md-4{
  display: inline-block;
  margin-left:-10px;
}
.col-md-4 img{
  width:100%;
  height:auto;
}
  
body .carousel-control-prev-icon,
body .carousel-indicators li,
body .carousel-control-next-icon{
  background-color:#000;
}

span.carousel-control-prev-icon {
 position: relative;
 bottom: 40px;
 right: 40px;
}

span.carousel-control-next-icon {
 position: relative;
 bottom: 40px;
}
</style>
<!-- card 돌아가는거 자동으로 돌지 않게. 가능하다면 세로선에 4개 정도 들어 가게 -->
</head>
<body class="borderGray bgGray">
    <jsp:include page="../include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
    
    <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
        <h1>${sessionScope.loginUser.nickname}님을 위한 맞춤 영화</h1>
        </c:when>
    </c:choose>
    <hr>
    <br>
<div class="container">
  
  <div id="demo" class="carousel slide" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators mb-0 pb-0">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>

  <!-- The slideshow -->

  <h2>${listName}</h2>
  <div class="carousel-inner no-padding my-5">
    <div class="carousel-item active">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://via.placeholder.com/300x300?text=1">
          <div class="card-img-overlay t_img">
            <span class="float-left text-uppercase">article</span>
            <span class="float-right text-uppercase">2345 views</span>
          </div>
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://via.placeholder.com/300x300">
          <div class="card-img-overlay t_img">
            <span class="float-left text-uppercase">article</span>
            <span class="float-right text-uppercase">2345 views</span>
          </div>
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
    </div>
    <div class="carousel-item">
      <div class="col-xs-4 col-sm-4 col-md-4">
        <a href="#" onclick=abc(this) class="slider_info">
          <img class="img-fluid card-img-top" src="http://via.placeholder.com/300x300">
          <div class="card-img-overlay t_img">
            <span class="float-left text-uppercase">article</span>
            <span class="float-right text-uppercase">2345 views</span>
          </div>
        </a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Sequi nesciunt quam obcaecati maiores atque labore fugiat tenetur tempore veritatis temporibus!</p>

      </div>
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
     <span class="carousel-control-prev-icon sp"></span>
                </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
                    <span class="carousel-control-next-icon sp"></span>
                </a>
</div>
</div>
    
    <div>
        ${list}
        
    </div>
    
    
    
    </main>
    <jsp:include page="../include/footer.jsp"></jsp:include>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</body>
</html>