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
                        placeholder="검색어를 입력해 주세요">
                  <span class="input-group-btn">
                    <button class="btn btn-primary" id="btn-srch-movie"
                            onclick="findMovieByKeywod()" type="button">검색</button>
                  </span>
                </div>
                <ul class="list-group" id="list-search-movie">
                  <li class="list-group-item">Cras justo odio</li>
                  <li class="list-group-item">Dapibus ac facilisis in</li>
                  <li class="list-group-item">Morbi leo risus</li>
                  <li class="list-group-item">Porta ac consectetur ac</li>
                  <li class="list-group-item">Vestibulum at eros</li>
                </ul>
                
                <hr>
                <input type="submit" class="btn btn-default" value="확인">
                <input type="reset" class="btn btn-default" value="취소">
                
                <input type="hidden" name="fileNameList" id="fileNameList"/>
            </form>
          </div>
      </main>
      <jsp:include page="../include/footer.jsp"></jsp:include>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
      <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script src="/js/bootstrap.js"></script>
      <script src="/js/common.js"></script>
      <script type="text/javascript">
      
      var fileNameList = [];
      $('#fileNameList').val(fileNameList);
      
      // 영화 검색 관련
      function findMovieByKeywod() {
          var keyword = document.getElementById('input-srch-keyword').value;
          if (keyword == '') {
              alert('키워드를 입력해주세요');
              return;
          }
          
          $.ajax("/app/movieInfo/listByKeyword", {
              method: "POST",
              headers : {
                  'Content-Type': 'application/json'
              },
              data: JSON.stringify({ "keyword": keyword }),
              success: function(data) {
                  
                  alert(data.keyword);
                  
                  
              },
              complete: function() {
                  
              },
              error: (xhr, status, msg) => {
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