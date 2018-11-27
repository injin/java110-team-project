<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>

<style>
.card-hot-sr {
    max-height: 20em;
}
.card-hot-sr .img-sr {
    height: 10em;
}
.hot-sr-img{
    height:10em;
}
.hot-sr{
    height:5em;
}
.hot{
    height:20em;
    max-height:20em;
}
.p-hot{
    max-height:2em;
}
.p-hot2{
    max-height:2em;
    padding-top:3em;
}

</style>

</head>
<body>
    <jsp:include page="include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
        <div class="masthead block-wide text-white text-center" style="height:450px;">
          <div class="overlay"></div>
          <div class="container">
            <div class="row">
              <div class="col-xl-9 mx-auto">
                <h1 class="mb-5">Connect to Moviestagram</h1>
                <h5 class="mb-5">Discover, and share a constantly expanding Movie around the world</h5>
              </div>
              <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                    
              </div>
            </div>
          </div>
        </div>
    
        <div class="text-center" style="margin-top: 50px">
            <h3 class="mb-5">
                <strong>지금 인기 있는 장면</strong>
            </h3>
        </div>
        
        <div class="row">
            <c:forEach var="top" items="${topSrList}">
                <div class="col-3 mb-3">
                    <div class="card" >
                        <a href="/app/sceneReview/review?mvno=${top.mvno}&srno=${top.srno}">
                            <img class="card-img-top hot-sr-img" src="/upload/sceneReview/${top.photo}" alt="Card image cap"></a>
                        <div class="card-body hot-sr">
                            <h6 class="card-title">
                                <c:set var="Text" value="${top.title}"/>
                                    <c:if test="${fn:length(Text)<20}">
                                           <b>${fn:substring(Text,0,20)}</b>
                                    </c:if>
                                    <c:if test="${fn:length(Text)>20}">
                                           <b>${fn:substring(Text,0,20)}...</b>
                                    </c:if>
                                <br><span>(${top.time})</span>
                            </h6>
                            
                        </div>
                    </div>
                </div>
             </c:forEach>
         </div>
    
    <div class="block-wide pb-3" style="background-color:#e6e6e6;">
        <div class="text-center" style="margin-top: 50px" >
            <h3 class="mb-5">
                <strong>HOT 영화리뷰</strong>
            </h3>
        </div>
        
        <!-- 슬라이더 START -->
        <div id="hotSr" class="carousel slide" data-ride="carousel">
        
            <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#hotSr" data-slide-to="0" class="active"></li>
                <li data-target="#hotSr" data-slide-to="1"></li>
                <li data-target="#hotSr" data-slide-to="2"></li>
            </ul>

            
            
            
            
            <div class="carousel-inner no-padding my-5">
                <c:forEach items="${topMpList}" var="post" varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <div class="carousel-item  <c:if test="${status.first}">active</c:if>">
                            <div class="row pl-3 pr-3">
                    </c:if>
                    
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body hot" onclick="openDetailModal(${post.pstno})" style="cursor: pointer;">
                                <h5 class="card-title">${post.title} 리뷰</h5>
                                <h6 class="card-subtitle mb-2 text-muted">작성자:${post.member.nickname}</h6>
                                <c:choose>
                                <c:when test="${not empty post.photos[0].phot}">
                                <p class="card-text p-hot">${post.content}</p>
                                <img class="img-sr" src="/upload/post/${post.photos[0].phot}">
                                </c:when>
                                <c:otherwise>
                                <div>
                                 <p class="card-text p-hot2">${post.content}</p>
                               <!--  <img class="img-sr" src="/img/default-movie-img.png"> -->
                                </div>
                                </c:otherwise>
                                </c:choose>
                              </div>
                            </div>
                        </div>
                    
                    <c:if test="${status.index%3 == 2 || status.last}">
               </div>
          </div>
                    </c:if>
                </c:forEach>
    </div>
        
            <a class="carousel-control-prev" href="#hotSr" data-slide="prev">
                <span class="carousel-control-prev-icon sp"></span>
            </a>
            <a class="carousel-control-next" href="#hotSr" data-slide="next">
                <span class="carousel-control-next-icon sp"></span>
            </a>

        </div>
        <!-- 슬라이더 END -->
    </div>
    
    <div class="block-wide pb-3">
        <div class="text-center" style="margin-top: 50px" >
            <h3 class="mb-5">
                <strong>장면 앨범</strong>
            </h3>
        </div>
        
        <!-- 슬라이더 START -->
        <div id="scn" class="carousel slide" data-ride="carousel">
        
            <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#scn" data-slide-to="0" class="active"></li>
                <li data-target="#scn" data-slide-to="1"></li>
                <li data-target="#scn" data-slide-to="2"></li>
            </ul>

            
            
            
            
            <div class="carousel-inner no-padding my-5">
                <c:forEach items="${topMpList}" var="post" varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <div class="carousel-item  <c:if test="${status.first}">active</c:if>">
                            <div class="row pl-3 pr-3">
                    </c:if>
                    
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="album" onclick="albumDetail('${album.lbmTitle}')"
                            style="cursor: pointer;">
                            <img src="/img/default.jpg">
                            <c:choose>
                                <c:when test="${album.open == 'true'}">
                                    <div class="row">
                                        <span class="overflow" style="margin-left: 1rem;"> <b>${album.lbmTitle}</b></span>
                                        <span style="margin-left: 1.3rem;"><i
                                            class="fas fa-globe-americas globe"
                                            style="float: right; margin: 0.2rem;"></i></span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="row">
                                        <span class="overflow" style="margin-left: 1rem;"> <b>${album.lbmTitle}</b></span>
                                        <span style="margin-left: 1.3rem;"><i
                                            class="fas fa-lock lock"> </i></span>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <span style="font-size: 0.8rem; float: left;">14개</span> <span
                                style="float: left; clear: both;">${album.cdt}</span>
                        </div>
                            </div>
                        </div>
                    
                    <c:if test="${status.index%3 == 2 || status.last}">
               </div>
          </div>
                    </c:if>
                </c:forEach>
    </div>
    
    <a class="carousel-control-prev" href="#scn" data-slide="prev">
                <span class="carousel-control-prev-icon sp"></span>
            </a>
            <a class="carousel-control-next" href="#scn" data-slide="next">
                <span class="carousel-control-next-icon sp"></span>
            </a>

        </div>
        <!-- 슬라이더 END -->
    </div>

    </main>
    
    <jsp:include page="reviewFeed/detailPost.jsp"></jsp:include>
    <jsp:include page="include/footer.jsp"></jsp:include>
   <script>
   function openDetailModal(pstno) {
       $('#detailModal').modal('show');
   }
    
    </script>
</body>
</html>