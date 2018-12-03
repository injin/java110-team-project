<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 상세 정보 수정</title>
    <link rel='stylesheet' href='/css/bootstrap.css'>
    <link rel="stylesheet" href="/css/fontawesome.css">
    <link rel="stylesheet" href="/css/all.css">
    <link rel='stylesheet' href='/css/common.css'>
    <link rel='stylesheet' href='/css/accountDetail.css'>
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main" class="container pt-0">
        <div class="row">
            <aside class="col-3">
                <div class="mt-2">
                  <img class="card-img-top" id="mypage-profile-img" src="${loginUser.profileImagePath}" alt="프로필 이미지">
                  <div class="card-body">
                    <h5 class="card-title">${loginUser.nickname}</h5>
                    <p class="card-text">${loginUser.pr}</p>
                  </div>
                </div>
            </aside>
            <div class="col-9 borderGray p-0" id="mypage-right">
                <img src="${loginUser.coverImagePath}" id="mypage-cover-img">
                <div class="row">
                    <div class="col-lg-12">
                    <table class="table">
                      <thead id="mypage-menu">
                        <tr class="d-flex">
                          <th scope="col" class="col-2 text-center"><a href="#">나의피드</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">장면보관함</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">통계</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">팔로우</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">활동로그</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">정보수정</a></th>
                        </tr>
                      </thead>
                    </table>
                    </div>
                </div>
                
                <div class="row pl-3 pr-3">
                    <!-- 작업공간 START -->
<%-- ========================================================================================== --%>
      <main role="main" class="container">
         <div id="detail">
            <form action="update" method="post" id="detailForm"
               enctype="multipart/form-data">
               <input type="hidden" name="mno" value="${sessionScope.loginUser.mno}">
               <h3 class="mt-3">닉네임</h3>
               <section id="nickname-section">
                  <div class="form-group row">
                     <div class="nickname">
                        <input type="text" class="nickname form-control" name="nickname"
                           value="${member.nickname}">
                     </div>
                  </div>
               </section>
               <hr>
<%-- ========================================================================================== --%>
               <h3>프로필 사진</h3>
               <div class="avatar-upload">
                  <div class="avatar-edit">
                     <input type='file' name="profileImageFile" id="imageUpload-profile"
                        accept=".png, .jpg, .jpeg" /> <label for="imageUpload-profile"></label>
                  </div>
                  <div class="avatar-preview">
                     <div id="profilePreview"
                        style="background-image: url('${loginUser.profileImagePath}');"></div>
                  </div>
               </div>
               <hr>
<%-- ========================================================================================== --%>
               <h3>자기소개</h3>
               <section id="pr-section">
                  <div class="form-group">
                     <c:choose>
                        <c:when test="${empty sessionScope.loginUser.pr}">
                           <input type="text" class="pr form-control" name="pr"
                              value="자기소개를 입력해 주세요.">
                        </c:when>
                        <c:otherwise>
                           <input type="text" class="pr form-control" name="pr"
                              value="${sessionScope.loginUser.pr}">
                        </c:otherwise>
                     </c:choose>
                  </div>
               </section>
               <hr>
<%-- ========================================================================================== --%>
               <section id="cover-area">
                  <h3 id="cover-img">커버 사진</h3>
                  <div id="asdf">
                     <div class="cover-upload">
                        <div class="cover-edit">
                           <input type='file' name="coverImage" id="imageUpload-cover"
                              accept=".png, .jpg, .jpeg" /> <label for="imageUpload-cover"></label>
                        </div>
                        <div class="cover-preview row">
                           <div id="coverPreview" style="background-image: url('${loginUser.coverImagePath}');"></div>
                        </div>
                     </div>
                  </div>
               </section>
               <hr>
<%-- ========================================================================================== --%>
               <h3 id="gr_anly">선호 장르 분석</h3>
               <div class="gr_anly">
                  <div class="btn-group-toggle" data-toggle="buttons">
                     <c:forEach items="${favList}" var="genre">
                        <label class="btn btn-checkbox btn-secondary active"
                           id="${genre.grno}">${genre.grName}<input type="checkbox"
                           name="favGrList" value="${genre.grno}" checked></label>
                     </c:forEach>
                     <c:forEach items="${genreList}" var="genre">
                        <label class="btn btn-checkbox btn-secondary" id="${genre.grno}">${genre.grName}<input
                           type="checkbox" name="favGrList" value="${genre.grno}"></label>
                     </c:forEach>
                  </div>
               </div>
<%-- ========================================================================================== --%>
               <hr>
               <div class="confirm">
                  <label class="btn btn-checkbox btn-secondary active">회원 정보
                  수정<input type="submit" class="btn btn-default"
                     style="display: none;" value="수정">
                  </label>
               </div>
            </form>
            <hr>
            <hr>
<%-- ========================================================================================== --%>
            <section id="signOutSection" style="padding:">
               <h3>회원 탈퇴</h3>
               <div id="signOutMessage">
                  <pre>MovieStaGram에서 탈퇴를 하시면
    일부 기록은 삭제되지 않을 수 있습니다.</pre>
               </div>
               <form action="signOut" method="post">
                  <input type="hidden" name="mno" value="${member.mno}"> <label
                     class="btn btn-checkbox btn-secondary active" id="signOutBtn"
                     onclick="bye()">회원 탈퇴
                  <button type="submit" class="btn" style="display: none;"></button>
                  </label>
               </form>
            </section>
         </div>
      </main>
      <hr>
<%-- ========================================================================================== --%>
                    <!-- 작업공간 END -->
                </div>
                
            </div>
        </div>

    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
        <%-- jQuery가 꼬일경우 아래 셋을 확인 하라 --%>
    <script src="/js/bootstrap.bundle.js"></script>
    <!-- <script src="/js/jquery-ui.js"></script> -->
    <script src="/js/bootstrap.js"></script>
    <script src="/js/auth.js"></script>
</body>
</html>