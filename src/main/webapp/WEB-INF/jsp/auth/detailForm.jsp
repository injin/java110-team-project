<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <title>회원 가입 상세 정보</title>
      <link rel='stylesheet' href='/css/bootstrap.css'>
      <link rel='stylesheet' href='/css/accountDetail.css'>
      <link rel='stylesheet' href='/css/common.css'>
      <style>
         .list-group-item { padding: 0.3rem 0.3rem; }
         #list-search-movie {
            max-height: 250px;
            overflow: auto;
         }
      </style>
   </head>
   <!-- http://localhost:8888/app/signupDetail/detailForm -->
   <body>
      <jsp:include page="../include/header.jsp"></jsp:include>
      <main role="main" class="container">
          <div id="detail">
            <form action="add" method="post" enctype="multipart/form-data">
                <input type="hidden" name="mno" value="${sessionScope.loginUser.mno}">
                <h3>닉네임</h3>
                
                <div class="form-group row">
                    <div class="col-xs-12 col-md-6 col-lg-4 ">
                        <input type="text" class="form-control" name="nickname" value="${member.nickname}">
                    </div>
                </div>
                <hr>
                
                <h3>프로필 사진</h3>
                <div class="avatar-upload">
                  <div class="avatar-edit">
                     <input type='file' name="profileImage" id="imageUpload-profile" accept=".png, .jpg, .jpeg" />
                     <label for="imageUpload-profile"></label>
                  </div>
                  <div class="avatar-preview">
                    <c:choose>
                        <c:when test="${fn:startsWith(member.profileImage, 'http')}">
                            <div id="profilePreview" style="background-image: url(${member.profileImage});"></div>
                        </c:when>
                        <c:otherwise>
                            <div id="profilePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);"></div>
                        </c:otherwise>
                    </c:choose>
                     
                  </div>
                </div>
                <hr>
                
                <h3 id="cover-img">커버 사진</h3>
                <div class="cover-upload">
                    <div class="cover-edit">
                    <input type='file' name="coverImage" id="imageUpload-cover" accept=".png, .jpg, .jpeg" />
                      <label for="imageUpload-cover"></label>
                    </div>
                    <div class="cover-preview">
                        <div id="coverPreview" style="background-image: url(http://i.pravatar.cc/500?img=7);"></div>
                    </div>
                </div>
                <hr>

                <h3 id="gr_anly">선호 장르 분석</h3>
                <div class="btn-group-toggle" data-toggle="buttons">
                    <c:forEach items="${genreList}" var="genre">
                    <label class="btn btn-checkbox btn-secondary">
                        <input type="checkbox" name="grnoList" value="${genre.grno}">${genre.grName}
                    </label>
                    </c:forEach>
                </div>
                <hr>
                
                <h3 id="gr_anly">인생영화선정</h3>
                <p>취향 분석을 위한 작품 10개를 선정해 주세요.</p>
                
                <div class="input-group">
                  <input type="text" class="form-control" id="input-srch-keyword"
                        placeholder="검색어를 입력해 주세요" autocomplete="off">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" id="btn-srch-movie"
                            onclick="findMoviesByKeywod()" type="button">검색</button>
                  </span>
                </div>
                <ul class="list-group" id="list-search-movie" >
                  <li class="list-group-item">
                    <div class="media">
                      <img class="mr-3 w50" src="https://image.tmdb.org/t/p/w500/Xfh4tbLzl9bEt8YL9KkflRjbZl.jpg" alt="영화제목">
                      <div class="media-body">
                        <h5 class="mt-0"><b>Media heading</b></h5>
                        Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
                      </div>
                    </div>
                  </li>
                </ul>
                
                <hr>
                <input type="submit" class="btn btn-default" value="확인">
                <input type="reset" class="btn btn-default" value="취소">
            </form>
          </div>
      </main>
      <jsp:include page="../include/footer.jsp"></jsp:include>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
      <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script src="/js/bootstrap.js"></script>
      <script src="/js/common.js"></script>
      <script type="text/javascript">
      
      // 영화 검색 관련
      function findMoviesByKeywod() {
          var keyword = document.getElementById('input-srch-keyword').value;
          if (keyword == '') {
              alert('키워드를 입력해주세요');
              return;
          }
          
          var $srchMovieList = $('#list-search-movie');
          $.ajax("/app/movieInfo/listByKeyword", {
              method: "POST",
              headers : {
                  'Content-Type': 'application/json'
              },
              data: JSON.stringify({ "keyword": keyword }),
              before: function() {
                  $srchMovieList.html('').hide();
              },
              success: function(data) {
                  
                  var liHtml = '';
                  data.movieList.forEach(function(obj, idx) {
                      
                      console.log('가져온 정보' + obj);
                      liHtml += '<li class="list-group-item"><div class="media">';
                      liHtml += '<img class="mr-3 w50" src="'
                      if (obj.poster_path != null) {
                          liHtml += data.imgPrefix + obj.poster_path;
                      } else {
                          liHtml += '/img/default-movie-img.png';
                      }
                      liHtml += '" alt="영화제목">';
                      liHtml += '<div class="media-body">';
                      liHtml += '<h5 class="mt-0"><b>' + obj.title + '</b></h5>';
                      liHtml += '(' + obj.release_date + ')';
                      liHtml += '</div>';
                      liHtml += '</li>';
                      console.log(idx + ':' + obj.title + ':' + obj.release_date);
                  });
                  
                  /* console.log(data.keyword);
                  console.log(data.totalPages);
                  console.log(data.movieList); */
                  console.log(data.movieList);
                  
                  $srchMovieList.html(liHtml);
              },
              complete: function() {
                  $srchMovieList.show();
              },
              error: (xhr, status, msg) => {
                  $srchMovieList.text('영화 정보를 가져오는데 실패하였습니다.');
                  console.log(status);
                  console.log(msg);
              }
          });
          
          
      }
      
      
      
      // 커버 & 프로필 이미지 업로드 관련
      $("#imageUpload-cover").change(function() {
          coverURL(this);
      });
      
      $("#imageUpload-profile").change(function() {
          profileURL(this);
      });
      
      function profileURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {
                  $('#profilePreview').css('background-image', 'url('+e.target.result +')');
                  $('#profilePreview').hide();
                  $('#profilePreview').fadeIn(650);
              }
              reader.readAsDataURL(input.files[0]);
          }
      }
      
      function coverURL(input) {
          if (input.files && input.files[0]) {
              var reader = new FileReader();
              reader.onload = function(e) {
                  $('#coverPreview').css('background-image', 'url('+e.target.result +')');
                  $('#coverPreview').hide();
                  $('#coverPreview').fadeIn(650);
              }
              reader.readAsDataURL(input.files[0]);
          }
      }
      
      </script>
   </body>
</html>