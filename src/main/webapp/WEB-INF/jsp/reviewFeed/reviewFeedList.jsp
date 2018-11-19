<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link href="/css/fontawesome.css" rel="stylesheet">
<link href="/css/all.css" rel="stylesheet">
<link rel='stylesheet' href='/css/writingPost.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
<link rel='stylesheet' href='/css/starrr.css'>

<style>
.wPost {
	background: white;
	padding: 1rem 1rem 0 1rem;
	border-radius: 0.5rem;
	box-shadow: 7px 7px 30px -5px rgba(0, 0, 0, 0.1);
	margin: 2rem 0;
}

.pst {
	padding: 1rem 0;
	cursor: pointer !important;
}

.pst:hover {
	background-color: #f2f2f2;
	font-weight: bold;
}

.pst>i {
	font-size: 2rem;
	vertical-align: sub;
}

.btmIcon {
	padding: 0 0.4rem 1rem 1rem;
	font-size: 1.3rem;
	vertical-align: sub;
}

.hash {
	color: blue;
	font-weight: bold;
}

.reviewCont {
	height: 13rem;
	-ms-text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
	white-space: pre-line;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: pre-line;
}

.mauto {
	margin: 0 auto;
}

.sStar {
	font-size: 1.5rem;
	color: #FFD119;
}
</style>
<script>
    function loginError() {
        alert('로그인 후 작성할 수 있습니다.');
    }

    function postShow(id) {
        if (id == 'btnIlsang') {
            $("#pstTypeNo").val(1);
            $('.onlyMovie').hide();
        } else {
            $("#pstTypeNo").val(0);
            $('.onlyMovie').show();
        }
    }

    function showCont(cont, index) {

        var text = cont.replace(/[\s]+/g, " ").trim();
        var word = text.split(' ');
        var newHTML = "";

        word
                .forEach(function(value, index) {
                    var str = "";
                    var endBr = value.endsWith('<br>');
                    var valueArr = [ value ];
                    if (value.includes('<br>')) {
                        valueArr = value.split('<br>');
                        str = "<br>";
                    }

                    valueArr
                            .forEach(function(value2, index) {
                                if (index == (valueArr.length - 1)
                                        && endBr == false) {
                                    str = "";
                                }
                                if (value2.startsWith("#")) {
                                    newHTML += ("<span class='hash'><a href='/app/searchResult?keyword="
                                            + value2.substring(1)
                                            + "'>"
                                            + value2 + "&nbsp;</a></span>" + str);
                                } else {
                                    newHTML += "<span class='other'>" + value2
                                            + "&nbsp;</span>" + str;
                                }
                            });
                });
        document.getElementById('reviewCont-' + index).innerHTML = newHTML;
    };
</script>

</head>
<body class="borderGray bgGray">
	<jsp:include page="../include/header.jsp"></jsp:include>

	<div role="main" class="container row mauto">

		<c:if test="${empty sessionScope.loginUser}">
			<c:set var="feedAlign" value="mauto"></c:set>
		</c:if>
		<div class="col-9 ${feedAlign}">

			<!-- 글 작성 부분 -->
			<div class="wPost">
				<h6 style="font-size: 0.7rem; font-weight: bold">리뷰 작성하기</h6>
				<div style="border-bottom: 1px solid #00cc99; color: #00cc99">
					<c:choose>
						<c:when test="${not empty sessionScope.loginUser}">
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


			<!-- 포스터 보이는 부분 -->
			<c:forEach items="${postList}" var="post" varStatus="status">
				<c:if test="${post.open}">
					<div class="wPost reviewPst">
						<div class="media row" style="padding: 0 1rem">
							<img src="${post.member.profileImagePath}"
								style="width: 2.5rem; height: 2.5rem; border-radius: 50%; margin-right: 0.5rem;" />
							<div class="media-body">
								<ul
									style="float: left; list-style: none; padding-left: 0; margin-bottom: 0">
									<li><a href="#" style="color: black;">${post.member.nickname}</a></li>
									
									
									
									
									<li>
									<%-- <a class="nav-link dropdown-toggle"
										href="http://example.com" id="dropdown01"
										data-toggle="dropdown" aria-haspopup="true"
										aria-expanded="false">친구태그
									</a>
										<div class="dropdown-menu" aria-labelledby="dropdown01">
											<!-- <a class="dropdown-item" href="#">메뉴1</a> -->
											<a class="dropdown-item" href="<c:url value='/app/mloglist'/>">Log</a> 
											<a class="dropdown-item" href="javascript:logoutKakao()">Logout</a>
										</div>  --%>
										<a href="#"
										style="color: blue; font-size: 0.2rem; vertical-align: top;">
											<%-- ${post.ftags} --%>친구태그 </a>
											
									</li>
											
											
								</ul>
								<c:if test="${post.pstTypeNo ==0}">
									<p style="float: right; font-size: 1.5rem; margin-bottom: 0;">
										<b><i>${post.title}</i></b>
									</p>
								</c:if>
							</div>
						</div>
						<div class="clearfix media row" style="margin: 0.2rem 0">
							<div class="media-body">
								<p class="reviewCont" id="reviewCont-${status.index}">
									<script>
                                        showCont("${post.content}",
                                                "${status.index}");
                                    </script>
								</p>
							</div>
							<!-- <span style="color:blue;font-size:0.2rem">더보기...</span>  -->
							<c:if test="${post.photos[0].phot !=null}">
								<img src="/upload/post/${post.photos[0].phot}"
									style="width: 20rem; height: 13rem; margin-left: 1rem;" />
							</c:if>
						</div>
						<div class="row">
							<div class="col-6" style="text-align: left;">
								<a href="#" style="color: black"> <i
									class="far fa-thumbs-up btmIcon" style="color: red;"></i>${post.likeCnt}
								</a> <a href="#" style="color: black"> <i
									class="far fa-comment btmIcon"></i>0
								</a>
							</div>
							<c:if test="${post.pstTypeNo ==0}">
								<div class='col-6' style="text-align: right;">
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
								</div>
							</c:if>
						</div>
					</div>
				</c:if>
			</c:forEach>

			<jsp:include page="writingPost.jsp"></jsp:include>
		</div>

		<!-- 맞춤영화 추천 부분 -->
		<c:choose>
			<c:when test="${not empty sessionScope.loginUser}">
				<div class="col-3">
					<div class="wPost" style="position: fixed">
						<div style="color: black">
							${sessionScope.loginUser.nickname}의 맞춤 영화</div>
					</div>
				</div>
			</c:when>
		</c:choose>

	</div>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="/js/jquery-ui.js"></script>
	<script src="/js/starrr.js"></script>
	<script src="/js/bootstrap-tagsinput.min.js"></script>
	<script src="/js/typeahead.bundle.min.js"></script>
	<script src="/js/writingPost.js"></script>
	<script>
        var flwList = [];
        <c:forEach items="${userFlwList}" var="lst">
        flwList.push({
            "value" : "${lst.mno}",
            "text" : "${lst.nickname}"
        });
        </c:forEach>
    </script>
</body>
</html>