<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <link rel='stylesheet' href='/css/rcmdAnly.css'>

</head>
<body class="borderGray">
  <jsp:include page="../include/header.jsp"></jsp:include>
<%-- ========================================================================================== --%>
  <main role="main" class="container borderGray"> 
  <c:choose>
    <c:when test="${not empty sessionScope.loginUser}">
      <h1>${sessionScope.loginUser.nickname}님만을 위한 취향 저격추천 영화</h1>
    </c:when>
  </c:choose>
  <hr>
<%-- ========================================================================================== --%>
  <section id="anly-base-section" style="display: none;">
    <h4 id="anlyBaseTitle"></h4>
    <div id="anlyBaseCarousel" class="list-container">
      <div class="control-container">
        <div id="anly-left-scroll-btn" class="left-scroll button scroll left-scroll-btn">
          <i class="fa fa-chevron-left" aria-hidden="true"></i>
        </div>
        <div id="anly-right-scroll-btn" class="right-scroll button scroll right-scroll-btn">
          <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </div>
      </div>
      <div class="items" id="anly-base-items">

      </div>
    </div>
    <br>
    <button type="button" id="popover" class="btn btn-secondary" data-container="body"
        data-toggle="popover" data-placement="bottom"
        data-content="${sessionScope.loginUser.nickname}님이">추천 기준</button>
  </section>
  <br>
<%-- ========================================================================================== --%>
  <section id="random-base-section" style="display: none;">
  <hr>
    <h4 id="randomBaseTitle"></h4>
    <div id="randomBaseCarousel" class="list-container">
      <div class="control-container">
        <div id="random-left-scroll-btn" class="left-scroll button scroll left-scroll-btn">
          <i class="fa fa-chevron-left" aria-hidden="true"></i>
        </div>
        <div id="random-right-scroll-btn" class="right-scroll button scroll right-scroll-btn">
          <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </div>
      </div>
      <div class="items" id="random-base-items">

      </div>
    </div>
  <br>
  <hr>
  </section>
<%-- ========================================================================================== --%>
  <section id="loading" >
    <div class="spinner"></div>
  </section>
  
  <section id="md-section" style="display: none;">
    <h2>MD 추천 영화</h2>
    <hr>
    <h4 id="mdTitle"></h4>
    <div id="mdCarousel" class="list-container">
      <div class="control-container">
        <div id="left-scroll-button" class="left-scroll button scroll left-scroll-btn">
          <i class="fa fa-chevron-left" aria-hidden="true"></i>
        </div>
        <div id="right-scroll-button" class="right-scroll button scroll right-scroll-btn">
          <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </div>
      </div>
      <div class="items" id="md-items">
         
      </div>
    </div>
    <hr>
  </section>
<%-- ========================================================================================== --%>
  <br>
<%-- ========================================================================================== --%>
  <section id="now-section" style="display: none;">
  <hr>
    <h4>현재 상영작</h4>
    <div id="nowCarousel" class="list-container">
      <div class="control-container">
        <div id="left-scroll-now" class="left-scroll button scroll left-scroll-btn">
          <i class="fa fa-chevron-left" aria-hidden="true"></i>
        </div>
        <div id="right-scroll-now" class="right-scroll button scroll right-scroll-btn">
          <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </div>
      </div>
      <div class="items" id="now-items">

      </div>
    </div>
  </section>
  <hr>
<%-- ========================================================================================== --%>
  <section id="upcomming-section" style="display: none;">
    <h4>개봉 예정작</h4>
    <div id="upcommingCarousel" class="list-container">
      <div class="control-container">
        <div id="random-left-scroll-upcomming" class="left-scroll button scroll left-scroll-btn">
          <i class="fa fa-chevron-left" aria-hidden="true"></i>
        </div>
        <div id="random-right-scroll-upcomming" class="right-scroll button scroll right-scroll-btn">
          <i class="fa fa-chevron-right" aria-hidden="true"></i>
        </div>
      </div>
      <div class="items" id="upcoming-items">

      </div>
    </div>
  </section>
  <hr>
<%-- ========================================================================================== --%>
  </main>
  <jsp:include page="../include/footer.jsp"></jsp:include>
  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="/js/rcmd.js"></script>
  <script src="/js/carousel.js"></script>
</body>
</html>