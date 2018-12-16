<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="include/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scenecok</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<link rel='stylesheet' href='/css/bootstrap.css'>
<link href="/css/fontawesome.css" rel="stylesheet">
<link href="/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
<link rel='stylesheet' href='/css/detailPost.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
<link rel='stylesheet' href='/css/starrr.css'>
<link rel='stylesheet' href='/css/main.css'>

</head>
<body>
    <jsp:include page="include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
    <div class="masthead block-wide text-white text-center"
        style="height: 450px;">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <h1 class="mb-5">Connect to Scene Cok</h1>
                    <h5 class="mb-5">Discover, and share a
                        constantly expanding Movie around the world</h5>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">

                </div>
            </div>
        </div>
    </div>

    <div class="text-center" style="margin-top: 3em">
        <h3 class="mb-5">
            <strong>지금 인기 있는 장면</strong>
        </h3>
    </div>

    <div class="row mb-4">
        <c:forEach var="top" items="${topSrList}">
            <div class="col-3 mb-4" onclick="goToSR(${top.mvno},${top.srno})">
                <div class="card c-pointer">
                    <img class="card-img-top hot-sr-img"
                        src="/upload/sceneReview/${top.photo}"
                        alt="Card image cap">
                    <div class="card-body hot-sr ">
                        <h6 class="card-title">
                            <c:set var="Text" value="${top.title}" />
                            <c:if test="${fn:length(Text)<=20}">
                                <b>${fn:substring(Text,0,20)}</b>
                            </c:if>
                            <c:if test="${fn:length(Text)>20}">
                                <b>${fn:substring(Text,0,20)}...</b>
                            </c:if>
                            <br>
                            <span>(${top.time})</span>
                        </h6>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="block-wide block-gray pb-3">
        <div class="text-center c-hot">
            <h3 class="mb-5">
                <strong>HOT 영화리뷰</strong>
            </h3>
        </div>

        <!-- 슬라이더 START -->
        <div id="hotSr" class="carousel slide" data-ride="carousel">

            <!-- <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#hotSr" data-slide-to="0"
                    class="active"></li>
                <li data-target="#hotSr" data-slide-to="1"></li>
                <li data-target="#hotSr" data-slide-to="2"></li>
            </ul> -->

            <div class="carousel-inner no-padding my-5">
                <c:forEach items="${topMpList}" var="post" varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <div
                            class="carousel-item  <c:if test="${status.first}">active</c:if>">
                            <div class="row pl-3 pr-3">
                    </c:if>

                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="card card-hot-sr">

                            <c:choose>
                                <c:when test="${not empty post.photos[0]}">
                                    <div class="card-body hot c-pointer" onclick="openDetailModal(${post.pstno})" data-title="${post.title}">
                                        <input type="hidden" data-toggle="modal" id="detailPst" data-target="#detailModal" />
                                            <figure class="snip1361">
                                             <img src="/upload/post/${post.photos[0]}" />
                                            <figcaption>
                                            <h5 class="card-title">
                                              <c:set var="Text" value="${post.title}"/>
                                              <c:if test="${fn:length(Text)<=15}">
                                              <b>'${fn:substring(Text,0,15)}'</b>
                                              </c:if>
                                              <c:if test="${fn:length(Text)>15}">
                                              <b>${fn:substring(Text,0,15)}...</b>
                                              </c:if>
                                            </h5>
                                                <c:if  test="${post.member.profileImage == null}">
                                                    <h6 class="card-subtitle mb-2 text-muted tnick">
                                                    <img src="/img/default-profile-img.png" class="main-cmt-img">&nbsp;
                                                     ${post.member.nickname}</h6>
                                                </c:if>
                                                <c:if  test="${post.member.profileImage != null}">
                                                    <h6 class="card-subtitle mb-2 text-muted tnick" >
                                                    <img src="${post.member.profileImagePath}" class="main-cmt-img">&nbsp;
                                                    ${post.member.nickname}</h6>
                                                </c:if>
                                                <p class="card-text cmt-cont"
                                                    id="reviewCont-${post.pstno}">
                                                    ${post.content}
                                                </p>
                                            </figcaption>
                                        </figure>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-body hot c-pointer" onclick="openDetailModal(${post.pstno})">
                                        <input type="hidden" data-toggle="modal" id="detailPst" data-target="#detailModal" />
                                        <figure class="snip1361">
                                            <!-- <img class src="/img/default.jpg" alt="리뷰 이미지"/> -->
                                            <img src="${posterPrefix}${post.movieDb.posterPath}" alt="${post.movieDb.title}영화 포스터 이미지"/>
                                            <figcaption>
                                                <h5 class="card-title">
                                                    <c:set var="Text" value="${post.title}"/>
                                                    <c:if test="${fn:length(Text)<=15}">
                                                    <b>'${fn:substring(Text,0,15)}'</b>
                                                    </c:if>
                                                    <c:if test="${fn:length(Text)>15}">
                                                    <b>'${fn:substring(Text,0,15)}...'</b>
                                                    </c:if>
                                                </h5>
                                                <c:if  test="${post.member.profileImage == null}">
                                                    <h6 class="card-subtitle mb-2 text-muted tnick">
                                                    <img src="/img/default-profile-img.png" class="main-cmt-img">&nbsp;
                                                     ${post.member.nickname}</h6>
                                                </c:if>
                                                <c:if  test="${post.member.profileImage != null}">
                                                    <h6 class="card-subtitle mb-2 text-muted tnick">
                                                    <img src="${post.member.profileImagePath}" class="main-cmt-img">&nbsp;
                                                    ${post.member.nickname}</h6>
                                                </c:if>
                                                <p class="card-text cmt-cont"
                                                    id="reviewCont-${post.pstno}">${post.content}
                                                         <!-- <script>showCont("${post.content}","${post.pstno}");</script> -->
                                                </p>
                                            </figcaption>
                                        </figure>
                                    </div>
                                </c:otherwise>
                            </c:choose>

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
    </a> <a class="carousel-control-next" href="#hotSr" data-slide="next">
        <span class="carousel-control-next-icon sp"></span>
    </a>

    </div>
    <!-- 슬라이더 END -->
    </div>

    <div class="block-wide pb-3">
        <div class="text-center" style="margin-top: 3em">
            <h3 class="mb-5">
                <strong>장면 앨범</strong>
            </h3>
        </div>

        <!-- 슬라이더 START -->
        <div id="scn" class="carousel slide" data-ride="carousel">

            <!-- <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#scn" data-slide-to="0" class="active"></li>
                <li data-target="#scn" data-slide-to="1"></li>
                <li data-target="#scn" data-slide-to="2"></li>
            </ul> -->





            <div class="carousel-inner no-padding my-5">
                <c:forEach items="${albumList}" var="album"
                    varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <div
                            class="carousel-item  <c:if test="${status.first}">active</c:if>">
                            <div class="row pl-3 pr-3">
                    </c:if>

                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="card card-hot-sr" style="max-height:25em">
                            <div class="album c-pointer" onclick="goToSA(${album.lbmno},${album.mno})">
                                <div class="ml-3">
                                </div>
                                <c:choose>
                                 <c:when test="${empty album.phot}">
                                     <img class="card-img-top hot-sr-img-scene" src="/img/default.jpg">
                                 </c:when>
                                 <c:otherwise>
                                 <%-- <a href="/app/sceneAlbum/detail?open=true&lbmno=${album.lbmno}&tgtMno=${album.mno}"> --%>
                                     <img class="card-img-top hot-sr-img-scene"
                                            src="/upload/sceneReview/${album.phot}"
                                            alt="Card image cap"></a>
                                            
                                 </c:otherwise>
                            </c:choose>
                                    <div class="row">
                                        <span class="overflow" style="margin-left: 2rem; margin-top:1em;"> 
                                        <h6>
                                        <c:set var="Text" value="${album.lbmTitle}" />
                                            <c:if test="${fn:length(Text)<=12}">
                                                <b>${fn:substring(Text,0,12)}</b>
                                            </c:if>
                                            <c:if test="${fn:length(Text)>12}">
                                                <b>${fn:substring(Text,0,12)}...</b>
                                            </c:if>
                                        </h6>
                                        </span>
                                        <span style="margin-left:2em; margin-top:1em; float: right;">
                                        <img src="${album.profileImagePath}" class="main-cmt-img">&nbsp;${album.nick}</span>
                                        
                                    </div>
                                <span class="ml-3" style="font-size: 0.8rem; float: left;">${album.srCnt}개</span> 
                                <span class="ml-3" style="float: left; clear: both;">${album.cdt}</span>
                            </div>
                        </div>
                    </div>

                    <c:if test="${status.index%3 == 2 || status.last}">
            </div>
        </div>
        </c:if>
        </c:forEach>
    </div>
                <form action="detail" method="get" id="detailForm">
                    <input type="hidden" name="lbmTitle">
                    <input type="hidden" name="open">
                    <input type="hidden" name="lbmno">
                </form>

    <a class="carousel-control-prev" href="#scn" data-slide="prev">
        <span class="carousel-control-prev-icon sp"></span>
    </a> <a class="carousel-control-next" href="#scn" data-slide="next">
        <span class="carousel-control-next-icon sp"></span>
    </a>

    </div>
    <!-- 슬라이더 END -->
    
    </div>
    </main>
    <jsp:include page="reviewFeed/detailPost.jsp"></jsp:include>
    <jsp:include page="include/commonJs.jsp"></jsp:include>
    <jsp:include page="include/footer.jsp"></jsp:include>
    <script src="/js/jquery-ui.js"></script>
    <script src="/js/starrr.js"></script>
    <script src="/js/bootstrap-tagsinput.min.js"></script>
    <script src="/js/typeahead.bundle.min.js"></script>
    <script src="/js/vendor/jquery.tweetParser.js"></script>
    <script src="/js/detailPost.js"></script>
    <script>
    
    function goToSA(lbmno,mno){ 
        location.href = "/app/sceneAlbum/detail?open=true&lbmno="+lbmno+"&tgtMno="+mno;
    }
    
    function goToSR(mvno,srno){ 
        location.href = "/app/sceneReview/review?mvno="+mvno+"&srno="+srno;
    }
    
    $(".hover").mouseleave(
            function () {
              $(this).removeClass("hover");
            }
          );
    var sessionMember = {
            "nickname" : '${sessionScope.loginUser.nickname}',
            "profileImage" : '${sessionScope.loginUser.profileImage}',
            "mno" : '${sessionScope.loginUser.mno}'
    };
    
   var postList = [];
   <c:forEach items="${topMpList}" var="post">
   var pary =[];
       <c:forEach items="${post.photos}" var="pht">
       pary.push('${pht}');
       </c:forEach>
       var fary =[];    
       <c:forEach items="${post.ftags}" var="ft">
       fary.push({
           "nickname":'${ft.nickname}',
           "mno":'${ft.mno}'
       });
       </c:forEach>
       
       postList.push({
           "pstno": '${post.pstno}',
           "title": '${post.title}',
           member:{
               "profileImagePath": '${post.member.profileImagePath}',
               "nickname":'${post.member.nickname}',
               "mno":'${post.member.mno}'
           },
           "star":'${post.star}',
           "photos":pary,
           "ftags":fary,
           "createdDate":'${post.createdDate}'
       })
   </c:forEach>
    </script>
</body>
</html>