<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- ========================================================================================== --%>
     <main role="main" class="container">
         <div id="detail">
            <form action="update" method="post" id="detailForm" enctype="multipart/form-data">
               <input type="hidden" name="mno" value="${loginUser.mno}">
               <input type="hidden" name="profileImage" value="${loginUser.profileImage}">
               <input type="hidden" name="coverImage" value="${loginUser.coverImage}">
               <h3 class="mt-3">닉네임</h3>
               <section id="nickname-section">
                  <div class="form-group row">
                     <div class="nickname">
                        <input type="text" class="nickname form-control" name="nickname"
                           value="${loginUser.nickname}">
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
                        <c:when test="${empty loginUser.pr}">
                           <input type="text" class="pr form-control" name="pr" value="자기소개를 입력해 주세요.">
                        </c:when>
                        <c:otherwise>
                           <input type="text" class="pr form-control" name="pr" value="${loginUser.pr}">
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
                        <label class="btn btn-checkbox btn-secondary" id="${genre.grno}">
                            ${genre.grName}
                            <input type="checkbox" name="favGrList" value="${genre.grno}">
                        </label>
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
                  <input type="hidden" name="mno" value="${loginUser.mno}"> <label
                     class="btn btn-checkbox btn-secondary active" id="signOutBtn"
                     onclick="bye()">회원 탈퇴
                  <button type="submit" class="btn" style="display: none;"></button>
                  </label>
               </form>
            </section>
         </div>
     </main>
<%-- ========================================================================================== --%>
    <%-- jQuery가 꼬일경우 아래 셋을 확인 하라 --%>
    <%-- <script src="/js/bootstrap.bundle.js"></script> --%>
    <%-- <script src="/js/jquery-ui.js"></script> --%>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/auth.js"></script>
