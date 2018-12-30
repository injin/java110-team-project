<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scenecok</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<!-- <link rel='stylesheet' href='/css/fontawesome.css'> -->
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/accountDetail.css'>
<link rel="stylesheet" href='/css/bootstrap2-toggle.min.css'>
<link rel="stylesheet" href="/css/tabstyles.css">
<link rel='stylesheet' href='/css/adminMvList.css'>

</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>
  <main role="main" class="container"> <!-- 작업부분 -->
  <form class="addForm" action="save" method="post">
    <h1 class="m-4" style="font-family: fantasy;">씬콕의 추천영화</h1>
    <table class="table table-hover">
      <thead>
        <tr>
          <th colspan="2" scope="col"><h3>${theme.thm}<!-- <i
                            class="far fa-edit" style="font-size: 1rem;"></i> -->
            </h3></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>영화추가</td>
          <td>영화목록</td>
        </tr>
      </tbody>
    </table>
    <section class="my-mv-list" style="margin: 2rem;">
      <!-- 영화검색부분 -->
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
      <!-- 등록한 영화 목록 -->
      <div class="listBox"
        style="width: 30rem; float: right; border: 1px solid sivler">
        <ol class="chooseList mt-0" id="list-choose-movie"
          style="margin-bottom: 1rem;">
          <c:forEach items="${movieList}" var="movie" varStatus="status">
            <li id="mv-li-${movie.mvno}">
              <div class="media list-group-item" style="border: 0px;">
                <div class="media-body">
                  <span class="mt-0"><b>${movie.title}</b></span>
                  <button type="button" onclick="removeList(${movie.mvno})"
                    style="float: right; cursor: pointer;"
                    class="btn2 btn-primary">제거</button>
                  <input type="hidden" name="favMvIdList" value="${movie.mvno}">
                  <input type="hidden" name="favMvTitleList"
                    value="${movie.title}">
                </div>
              </div>
            </li>
          </c:forEach>
        </ol>
      </div>
    </section>
    <hr>

    <input type="hidden" name="thmno" value="${theme.thmno}">


    <div class="confirm">
      <input type="button" class="btn report-btn2" onclick="saveRcmdList()"
        value="확인"> <input type="button" class="btn report-btn2"
        onclick="goBack()" value="취소">
    </div>

  </form>
  </main>
  <jsp:include page="../include/commonJs.jsp"></jsp:include>
  <jsp:include page="../include/footer.jsp"></jsp:include>
  <script src="/js/movieList.js"></script>
  <script src="/js/vendor/noty.js"></script>
  <script src="/js/bootstrap2-toggle.min.js"></script>

  <script>
    $(document).ready(function(){
      $(".li").hover(function(){
        $(this).addClass("tab-current");
      }, function(){
        $(this).removeClass("tab-current");
      });
    });
  </script>


</body>
</html>