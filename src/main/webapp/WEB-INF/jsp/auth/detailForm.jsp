<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ include file="../include/top.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
         
         .gr_anly {
            padding: 1rem;
            margin: 2em;
         }

          .gr_anly label {
             width: 6em;
             margin: 1rem;
             border-radius: 30em;
          }
         .btn-secondary {
            color: #6c757d;
            background-color: #e9ecef;
            border-color: #6c757d;
            }
        .btn-secondary:hover {
            color: #fff;
            background-color: #00cc9991;
            border-color: #545b62;
        }
      </style>
   </head>
   <!-- http://localhost:8888/app/signupDetail/detailForm
        회원 가입시 정보 최초 수정시에만 쓸 페이지, 회원 정보 수정에서 다시 쓸수 있을지 미지수 
    -->
   <body>
      <jsp:include page="../include/header.jsp"></jsp:include>
      <main role="main" class="container">
          <div id="detail">
            <form action="add" method="post" id="detailForm" enctype="multipart/form-data">
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
                  
                  <div id="profilePreview" style="background-image: url('${loginUser.profileImagePath}');"></div>
                  
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
                        <div id="coverPreview" style="background-image: url('${loginUser.coverImagePath}');"></div>
                    </div>
                </div>
                <hr>



                <h3 id="gr_anly">선호 장르 분석</h3>
                
                <div class="gr_anly">
                    <div class="btn-group-toggle" data-toggle="buttons">
                        <c:forEach items="${genreList}" var="genre">
                            <label class="btn btn-checkbox btn-secondary">
                                <input type="checkbox" name="favGrList" value="${genre.grno}">${genre.grName}
                            </label>
                        </c:forEach>
                    </div>
                </div>
                
                <hr>
                
                
                
                <h3 id="mv_anly">인생영화선정</h3>
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
                        <h5 class="mt-0"><b>가져올 영화 제목</b></h5>
                        가져올 영화 내용,I can't. When you say it like that oh-oh, oh-oh. Got me falling right back oh-oh, oh-oh (hmm). When you say it like that oh-oh, oh-oh. Let me fuck you right back oh-oh, oh-oh (hmm).
                        
                        <span class="badge badge-primary badge-pill" name="mvList">등록</span>
                      </div>
                    </div>
                  </li>
                </ul>
                <hr>
                <div>
                    <input type="textarea" id="fav">
                </div>
                
                    
                <hr>
                <input type="submit" class="btn btn-default" value="확인">
                <input type="reset" class="btn btn-default" value="취소">
            </form>
          </div>
      </main>
      <jsp:include page="../include/footer.jsp"></jsp:include>
      <script type="text/javascript">
      
      //    Enter Key 먹지 않게 
        $(document).keypress(
            function(event){
            if (event.which == '13') {
                event.preventDefault();
            }
      });
      
      var $inputKeyword = $('#input-srch-keyword');
      var $srchMovieList = $('#list-search-movie');
      
      function makeMovieListHtml(data) {
          var html = '';
          data.movieList.forEach(function(obj, idx) {
              
              console.log('가져온 정보' + obj);
              html += '<li class="list-group-item"><div class="media">';
              html += '<img class="mr-3 w50" src="'
              if (obj.poster_path != null) {
                  html += data.imgPrefix + obj.poster_path;
              } else {
                  html += '/img/default-movie-img.png';
              }
              html += '" alt="영화제목">';
              html += '<div class="media-body">';
              html += '<h5 class="mt-0"><b>' + obj.title + '</b></h5>';
              html += '(' + obj.release_date + ')';
              
              html += '<span style="visibility: hidden;">(' + obj.id + ')</span>';
              
              html += '<br><span class="badge badge-primary badge-pill" name="mvList">등록</span>';
              html += '</div>';
              html += '</li>';
              console.log(idx + ':' + obj.title + ':' + obj.release_date);
          });
          return html;
      }
      
      // 영화 검색 관련
      function findMoviesByKeywod() {
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
              before: function() {
                  $srchMovieList.html('').hide();
              },
              success: function(data) {
                  
                  var liHtml = '';
                  if (data.movieList.length == 0) {
                      liHtml = '<li class="list-group-item">조회된 결과가 없습니다.</li>';
                  } else {
                      liHtml = makeMovieListHtml(data);
                  }
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
      
      //   FavMvList관련
      window.onload = function () {
    	  var selec = document.getElementsByName('mvList');
    	  
    	  selec.onclick = function () {
    		  console.log('click');
    	  }
      };
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
    <form action="signOut" method="post">
        <input type="hidden" name="mno" value="${member.mno}">
        <button type="submit" class="btn"  onclick="bye()">!!Caution!! Nuclear Launch!!</button>
    </form>
</html>