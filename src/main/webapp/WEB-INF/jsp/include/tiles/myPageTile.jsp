<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${targetUser.nickname}</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
<link rel='stylesheet' href='/css/common.css'>


<t:importAttribute name="cssFiles"/>
<c:forEach var="css" items="${cssFiles}">
    <link rel="stylesheet" type="text/css" href="${css}">
</c:forEach>
<t:importAttribute name="jsFiles"/>
<c:forEach var="jsFile" items="${jsFiles}">
    <script src="${jsFile}"></script>
</c:forEach>
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
                <c:if test="${not empty loginUser}">
	                <c:if test="${targetUser.flw == false && loginUser.mno != targetUser.mno}">
	                    <button class="btn btn-primary float-right" id="flwBtn" onclick="addFollow(${targetUser.mno},'${targetUser.nickname}')" >팔로우</button>
	                </c:if>
                </c:if>
            </aside>
            <div class="col-9 borderGray p-0" id="mypage-right">
                <img src="${targetUser.coverImagePath}" id="mypage-cover-img">
                <div class="row">
                    <div class="col-lg-12">
                    <%-- <table class="table">
                      <thead id="mypage-menu">
                        <tr class="d-flex">
                          <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/reviewFeed/Feed?id=${targetUser.mno}"/>">피드</a></th>
                          <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/sceneAlbum/list?tgtMno=${targetUser.mno}"/>">장면보관함</a></th>
                          <c:choose>
                            <c:when test="${targetUser.mno == loginUser.mno}">
                              <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/stsc/list"/>">통계</a></th>
                              <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/follow/flwlist"/>">팔로우</a></th>
                              <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/log/mloglist"/>">활동로그</a></th>
                              <th scope="col" class="col-2 text-center"><a href="<c:url value="/app/auth/update"/>">정보수정</a></th>
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
                    </table> --%>
                    
                    
                        <div class="tab_container">
                            <ul>
                                <li class="active"><a href="<c:url value="/app/reviewFeed/Feed?id=${targetUser.mno}"/>">피드</a></li>
                                <li><a href="<c:url value="/app/sceneAlbum/list?tgtMno=${targetUser.mno}"/>">장면보관함</a></li>
                                <li><a href="<c:url value="/app/stsc/list"/>">통계</a></li>
                                <li><a href="<c:url value="/app/follow/flwlist"/>">팔로우</a></li>
                                <li><a href="<c:url value="/app/log/mloglist"/>">활동로그</a></li>
                                <li><a href="<c:url value="/app/auth/update"/>">정보수정</a></li>
                            </ul>
                        </div>
                    
                    
                    </div>
                </div>
                
                <div class="row pl-3 pr-3">
                    
                    <jsp:include page="../commonJs.jsp"></jsp:include>
                    <t:insertAttribute name="body"/>
                    
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="../footer.jsp"></jsp:include>
    
   <script>
   function addFollow(mno,nickname) {
       
       $.ajax({
           url : "/app/follow/flwadd",
           type: "post",
           data : {
               "mno" : mno,
               "nickname" : nickname
           },
           success : function(data) {
                if (data == true) {
                 commonAlert('success','팔로우 되었습니다.');
                 $('#flwBtn').remove();
               } else {
                   commonAlert('error','문제가 발생하였습니다.');
               } 
               
           },
           error: (xhr, status, msg) => {
               console.log(xhr);
               console.log(status);
               console.log(msg);
           }
       });
   }
    
    
     
   </script>
    
    
</body>
</html>