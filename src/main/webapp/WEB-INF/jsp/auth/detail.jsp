<%@ page language="java"
  contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <title>회원 가입 상세 정보</title>
    <link rel='stylesheet' href='/css/bootstrap.css'>
    <link rel='stylesheet' href='/css/accountDetail.css'>
    <link rel="stylesheet" href="/css/vendor/noty.css">
    <link rel="stylesheet" href="/css/vendor/sunset.css">
    <link rel='stylesheet' href='/css/common.css'>
  </head>
  <!-- http://localhost:8888/app/auth/detail -->
  <body class="borderGray bgGray">
    <jsp:include page="../include/header.jsp"></jsp:include>
<%-- ========================================================================================== --%>
    <main role="main" class="container">
      <div id="detail">
        <form action="init" method="post" id="detailForm" enctype="multipart/form-data">
          
          <input type="hidden" name="mno" value="${sessionScope.loginUser.mno}">
          
          <h3 class="mt-3">닉네임</h3>
          <section id="nickname-section">
            <div class="form-group row">
              <div class="nickname">
                <input type="text" class="nickname form-control" name="nickname" id="nickname"
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
          <section id="cover-area">
            <h3 id="cover-img">커버 사진</h3>
            <div id="cover" class="row">
              <div class="cover-upload">
                <div class="cover-edit">
                  <input type='file' name="coverImage" id="imageUpload-cover" accept=".png, .jpg, .jpeg"/>
                  <label for="imageUpload-cover"></label>
                </div>
                <div class="cover-preview">
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
              <c:forEach items="${genreList}" var="genre">
                <label class="btn btn-checkbox btn-secondary" id="${genre.grno}">${genre.grName}<input type="checkbox" name="favGrList" value="${genre.grno}"></label>
              </c:forEach>
            </div>
          </div>
          <hr>
<%-- ========================================================================================== --%>
          <h3 id="mv_anly">인생영화선정</h3>
          <p>취향 분석을 위한 작품 10~15개를 선정해 주세요.</p>
          <section class="my-mv-list" style="height: 300px; margin: 2rem;">
            <div class="srchNlist">
              <div class="input-group"
                style="width: 30rem; float: left; position: absolute;">
                <div class="input-group-prepend">
                  <div class="input-group-text">영화</div>
                </div>
                <input type="text" class="form-control" id="input-srch-keyword"
                  placeholder="검색어를 입력해 주세요" autocomplete="off"> <span
                  class="input-group-btn">
                <button class="btn btn-primary" id="btn-srch-movie"
                  onclick="findMoviesByKeyword()" type="button">검색</button>
                </span>
              </div>
              <div class="searchList"
                style="width: 30rem; float: left; margin-top: 40px;">
                <ul class="list-group" id="list-search-movie"></ul>
              </div>
            </div>
            <div class="listBox"
              style="width: 30rem; float: right; border: 1px solid sivler">
              <ul class="chooseList" id="list-choose-movie"
                style="margin-top: 0; margin-bottom: 1rem; max-height: 300px; overflow: auto;">
              </ul>
            </div>
          </section>
<%-- ========================================================================================== --%>
          <hr>
          <input type="hidden" name="selecList" id="test">
          <div class="confirm">
            <label class="btn btn-checkbox btn-secondary active">확인<input type="button" onclick="signUpCheck()" class="btn btn-default" style="display: none;" value="확인"></label>
            <label class="btn btn-checkbox btn-secondary active">취소<input type="button" onclick="goToHome()" class="btn btn-default" style="display: none;" value="취소"></label>
          </div>
        </form>
      </div>
    </main>
<%-- ========================================================================================== --%>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    
    <!-- <script src="/js/bootstrap.bundle.js"></script> -->
    <script src="/js/auth.js"></script>
    <script src="/js/movieList.js"></script>
    <script src="/js/vendor/noty.js"></script>
  </body>
</html>