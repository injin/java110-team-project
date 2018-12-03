<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="t" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${targetUser.nickname}</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/writingPost.css'>
<link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
<link rel='stylesheet' href='/css/starrr.css'>
<link rel='stylesheet' href='/css/detailPost.css'>
<link rel='stylesheet' href='/css/feed.css'>
</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>

    <main role="main" class="container pt-0">
        <div class="row">
            <aside class="col-3">
                <div class="mt-2">
                  <img class="card-img-top" id="mypage-profile-img" src="${targetUser.profileImagePath}" alt="프로필 이미지">
                  <div class="card-body">
                    <h5 class="card-title">${targetUser.nickname}</h5>
                    <p class="card-text">${targetUser.pr}</p>
                  </div>
                </div>
            </aside>
            <div class="col-9 borderGray p-0" id="mypage-right">
                <img src="${targetUser.coverImagePath}" id="mypage-cover-img">
                <div class="row">
                    <div class="col-lg-12">
                    <table class="table">
                      <thead id="mypage-menu">
                        <tr class="d-flex">
                          <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/reviewFeed/myFeed?tgtMno=${targetUser.mno}"/>">피드</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">장면보관함</a></th>
                          <c:choose>
                            <c:when test="${targetUser.mno == loginUser.mno}">
	                          <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/stsc/list"/>">통계</a></th>
	                          <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/follow/flwlist"/>">팔로우</a></th>
	                          <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/log/mloglist"/>">활동로그</a></th>
	                          <th scope="col" class="col-2 text-center"><a href="#">정보수정</a></th>
                            </c:when>
                            <c:otherwise>
                              <th scope="col" class="col-2 text-center"></th>
                              <th scope="col" class="col-2 text-center"></th>
                              <th scope="col" class="col-2 text-center"></th>
                              <th scope="col" class="col-2 text-center"></th>
                            </c:otherwise>
                          </c:choose>
                        </tr>
                      </thead>
                    </table>
                    </div>
                </div>
                
                <div class="row pl-3 pr-3">
                    
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
                    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
                    <script src="/js/bootstrap.bundle.js"></script>
                    <script src="/js/common.js"></script>
                    
                    <t:insertAttribute name="body"/>
                    
                </div>
            </div>
        </div>

    </main>

    <jsp:include page="footer.jsp"></jsp:include>
</body>
</html>