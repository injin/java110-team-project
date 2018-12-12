<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰피드</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<link href="/css/fontawesome.css" rel="stylesheet">
<link href="/css/all.css" rel="stylesheet">
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
<link rel='stylesheet' href="/css/aos.css" />
<link rel='stylesheet' href='/css/starrr.css'>
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
<link rel='stylesheet' href='/css/detailPost.css'>
<link rel='stylesheet' href='/css/writingPost.css'>

<link rel='stylesheet' href='/css/common.css'>
<script src="/js/makeContPost.js"></script>

</head>
<body class="borderGray bgGray">
	<jsp:include page="../include/header.jsp"></jsp:include>

	<div role="main" class="container row mauto">


		<c:if test="${empty sessionScope.loginUser}">
			<c:set var="feedAlign" value="mauto"></c:set>
		</c:if>
		<div class="col-8 ${feedAlign}" id="pstShw">
			<%-- 글 작성 부분 --%>
			<div class="wPost">
				<h6 id="wreviewH6">리뷰 작성하기</h6>
				<div id="wreviewDiv">
					<c:choose>
						<c:when test="${not empty sessionScope.loginUser}">
							<input type="hidden" id="sessionMno"
								value="${sessionScope.loginUser.mno}" />
                            ${sessionScope.loginUser.nickname}님, 무슨 영화를 보셨나요?
                        </c:when>
						<c:otherwise>
                                                            로그인후 리뷰를 작성해주세요.
                        </c:otherwise>
					</c:choose>
				</div>
				<div class="row">
					<div class="col text-center pst"
						onclick="document.getElementById('btnIlsang').click();">
						<i class="far fa-image"></i> 일상 리뷰 올리기
						<c:choose>
							<c:when test="${not empty sessionScope.loginUser}">
								<input type="hidden" data-toggle="modal" id="btnIlsang"
									onclick="postShow('btnIlsang')" data-target="#reviewModal" />
							</c:when>
							<c:otherwise>
								<input type="hidden" id="btnIlsang" onclick="loginError()" />
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col text-center pst"
						onclick="document.getElementById('btnMovie').click();">
						<i class="fas fa-film"></i> 영화 리뷰 올리기
						<c:choose>
							<c:when test="${not empty sessionScope.loginUser}">
								<input type="hidden" data-toggle="modal" id="btnMovie"
									data-target="#reviewModal" onclick="postShow('btnMovie')" />
							</c:when>
							<c:otherwise>
								<input type="hidden" id="btnMovie" onclick="loginError()" />
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>

			<%-- 포스터 보이는 부분 --%>
			<c:forEach items="${postList}" var="post" varStatus="status">
				<c:if test="${status.last}">
					<c:set var="lastpstno" value="${post.pstno}" />
				</c:if>
				<c:if test="${post.open}">
					<div class="wPost reviewPst list-group-item aos-init"
						data-aos="fade-up" data-aos-duration="1500">
						<div class="media row pr-3 pl-3">
							<img src="${post.member.profileImagePath}" class="rprofileImg" />
							<div class="media-body">
								<ul class="memberul">
									<li><span onclick="goToFeed(${post.member.mno})"
										class="text-dark c-pointer">${post.member.nickname}</span> <span
										class="cmt-date">&nbsp;<fmt:formatDate
												pattern="yyyy-MM-dd hh:mm:ss" value="${post.createdDate}" /></span>
									</li>
									<li><c:if test="${not empty post.ftags}">
											<c:forEach items="${post.ftags}" var="ftag">
												<span onclick="goToFeed(${ftag.mno})"
													class="tagName c-pointer"> ${ftag.nickname} </span>
											</c:forEach>
										</c:if></li>
								</ul>

								<c:if test="${post.pstTypeNo ==0}">
									<p class="dptitle">
										<b><i>${post.title}</i></b>
									</p>
								</c:if>
							</div>
						</div>
						<%-- 내용보여주는부분 --%>
						<div class="clearfix media row m-1">
							<div class="media-body">
								<p class="reviewCont scrollbar-light-blue"
									id="reviewCont-${post.pstno}">
									<script>
                                        showCont("${post.content}",
                                                "${post.pstno}");
                                    </script>
								</p>
							</div>
							<c:if test="${post.photos[0] !=null}">
								<%-- 이미지 클릭시 상세모달로 --%>
								<div class="image">
									<img onclick="openDetailModal(${post.pstno})"
										src="/upload/post/${post.photos[0]}"
										data-title="${post.title}"
										class="pstImgtoDetail img-responsive" /> <input type="hidden"
										data-toggle="modal" id="detailPst" data-target="#detailModal" />
									<c:if test="${fn:length(post.photos)>1}">
										<div class="text">
											<p>${fn:length(post.photos)-1}장+</p>
										</div>
									</c:if>
								</div>
							</c:if>
						</div>

						<div class="row">

							<%-- 좋아요 --%>
							<div class="col-6 text-left">
								<i
									class="fas fa-thumbs-up btmIcon c-pointer likeColor 
                   <c:if test="${!post.likeCheck}"> dis-none</c:if>"
									id="btn-like-full-${post.pstno}"
									onclick="
                                    <c:if test="${empty sessionScope.loginUser}"> loginError()</c:if>
                                    <c:if test="${not empty sessionScope.loginUser}"> cancelLike(${post.pstno},${post.pstTypeNo});</c:if>
                                    "></i>
								<i
									class="far fa-thumbs-up btmIcon c-pointer likeColor 
                   <c:if test="${post.likeCheck}"> dis-none</c:if>"
									id="btn-like-empty-${post.pstno}"
									onclick="
                                    <c:if test="${empty sessionScope.loginUser}"> loginError()</c:if>
                                    <c:if test="${not empty sessionScope.loginUser}"> addLike(${post.pstno},${post.pstTypeNo});</c:if>
                                    "></i>
								<span id="lCnt-${post.pstno}">${post.likeCnt}</span> <i
									class="far fa-comment btmIcon c-pointer"
									onclick="showMore(this,${post.pstno})"></i> <span
									id="cCnt-${post.pstno}">${post.cmtCnt}</span>
							</div>

							<%-- 별점 --%>
							<c:if test="${post.pstTypeNo ==0}">
								<div class='col-6 text-right'>
									<c:if test="${0 ne post.star}">
										<c:forEach begin="1" end="5" var="x">
											<c:choose>
												<c:when test="${x le post.star}">
													<i class="fas fa-star sStar"></i>
												</c:when>
												<c:otherwise>
													<i class="far fa-star sStar"></i>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:if>
								</div>
							</c:if>

						</div>

					</div>
				</c:if>
			</c:forEach>
		</div>


		<%-- 맞춤영화 추천 부분 --%>
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<div class="col-4" id="rcmdSide">
					<div id="stv_list">
						<div class="wPost text-center p-0">
							<div class="dmvDiv">${sessionScope.loginUser.nickname}님을위한
								영화 추천</div>
							<table class="w-100">
								<c:forEach items="${smlrList}" var="smlrMv" begin="1" end="5">
									<tr onclick="toDetail(${smlrMv.id})" class="trData ">
										<td class="media"><c:choose>
												<c:when test="${not empty smlrMv.posterPath}">
													<img class="smlrImg"
														src="https://image.tmdb.org/t/p/w500${smlrMv.posterPath}"
														alt="${smlrMv.title}" />
												</c:when>
												<c:otherwise>
													<img class="smlrImg" src="/img/default-movie-img.png"
														alt="${smlrMv.title}" />
												</c:otherwise>
											</c:choose>
											
										<div class="media-body">
										<b>${smlrMv.title}</b>
										<span class="row d-block fs09">${smlrMv.releaseDate}</span>
											<span class="row d-block fs09">평점 ${smlrMv.voteAverage} / 10</span>
											</div>
									</tr>
								</c:forEach>



								<%--   <colgroup>
                                    <col width="25%" />
                                    <col width="35%" />
                                    <col width="35%" />
                                </colgroup>
                                <c:forEach items="${smlrList}" var="smlrMv" begin="1" end="5">

                                    <tr onclick="toDetail(${smlrMv.id})" class="trData">
                                        <td><c:choose>
                                                <c:when test="${not empty smlrMv.posterPath}">
                                                    <img class="smlrImg"
                                                        src="https://image.tmdb.org/t/p/w500${smlrMv.posterPath}"
                                                        alt="${smlrMv.title}" />
                                                </c:when>
                                                <c:otherwise>
                                                    <img class="smlrImg" src="/img/default-movie-img.png"
                                                        alt="${smlrMv.title}" />
                                                </c:otherwise>
                                            </c:choose></td>
                                        <td>${smlrMv.title}</td>
                                        <td class="col"><span class="row d-block">${smlrMv.releaseDate}</span>
                                            <span class="row d-block"> ${smlrMv.genres}장르
                                        </span></td>
                                    </tr>
                                </c:forEach> --%>
							</table>
						</div>

						<a href="/app/rcmd/list"
							class="d-block wPost text-center divMore c-pointer">더 많은 추천
							영화 보기</a>

					</div>
				</div>
			</c:when>
		</c:choose>
		<p>
			<a class="return-top" href="#" class="d-block" style="right: auto">
				<img src="/img/top-btn.png" width="20%" height="20%">
			</a>
		<p>
	</div>

	<jsp:include page="writingPost.jsp"></jsp:include>
	<jsp:include page="detailPost.jsp"></jsp:include>
	<jsp:include page="../include/commonJs.jsp"></jsp:include>
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script src="/js/jquery-ui.js"></script>
	<script src="/js/starrr.js"></script>
	<script src="/js/bootstrap-tagsinput.min.js"></script>
	<script src="/js/typeahead.bundle.min.js"></script>
	<script src="/js/aos.js"></script>
	<script src="/js/writingPost.js"></script>
	<script src="/js/detailPost.js"></script>
	<script src="/js/showPosts.js"></script>
	<script>
     AOS.init();
        var sessionMember = {
                "nickname" : '${sessionScope.loginUser.nickname}',
                "profileImage" : '${sessionScope.loginUser.profileImage}',
                "mno" : '${sessionScope.loginUser.mno}'
        };
        
        var flwList = [];
        <c:forEach items="${userFlwList}" var="lst">
        flwList.push({
            "value" : "${lst.mno}",
            "text" : "${lst.nickname}"
        });
        </c:forEach>
        var postList = []; 
         
        <c:forEach items="${postList}" var="post">
        
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
                "likeCheck":'${post.likeCheck}',
                "pstTypeNo":'${post.pstTypeNo}',
                "createdDate":'${post.createdDate}',
                "likeCnt":'${post.likeCnt}'
            }) 
            
        </c:forEach> 
         var lstpstno = '${lastpstno}';
    </script>
</body>
</html>