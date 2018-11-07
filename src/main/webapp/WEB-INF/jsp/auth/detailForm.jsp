<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
   <head>
      <meta charset="UTF-8">
      <title>회원 가입 상세 정보</title>
      <link rel='stylesheet' href='/css/bootstrap.css'>
      <link rel='stylesheet' href='/css/accountDetail.css'>
      <style>
         .btn-secondary{
         background-color: #00cc99;
         border: none;
         }
         .btn-secondary:hover {
         background-color: #00b386;
         }
         .btn-secondary:not(:disabled):not(.disabled):active, .btn-secondary:not(:disabled):not(.disabled).active,
         .show > .btn-secondary.dropdown-toggle {
         color: #00cc99 !important;
         background-color: white !important;
         border: 1px solid #00cc99 !important;
         }
         .btn-primary:not(:disabled):not(.disabled):active:focus, .btn-primary:not(:disabled):not(.disabled).active:focus,
         .show > .btn-primary.dropdown-toggle:focus {
         color: #00cc99 !important;
         background-color: white !important;
         border: 1px solid #00cc99 !important;
         }
      </style>
   </head>
   <!-- http://localhost:8888/app/signupDetail/detailForm -->
   <body>
      <jsp:include page="../include/header.jsp"></jsp:include>
      <main role="main" class="container">
         <br><br><br><br><br>
         <div id="detail">
            <form action="add" method="post" enctype="multipart/form-data">
               <h3 class="nickname">닉네임</h3>
               <input class="nickname" type="text" name="nickName">
               <hr>
               <h3 id="profile-img">프로필 사진</h3>
               <div class="avatar-upload">
                  <div class="avatar-edit">
                     <input type='file' name="file" id="imageUpload" accept=".png, .jpg, .jpeg" />
                     <label for="imageUpload"></label>
                  </div>
                  <div class="avatar-preview">
                     <div id="profilePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                     </div>
                  </div>
               </div>
               <hr>
               <h3 id="cover-img">커버 사진</h3>
               <div class="cover-upload">
                  <div class="cover-edit">
                     <input type='file' name="file" id="imageUpload" accept=".png, .jpg, .jpeg" />
                     <label for="imageUpload"></label>
                  </div>
                  <div class="cover-preview">
                     <div id="coverPreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                     </div>
                  </div>
               </div>
               <hr>
               <%-- jstl for 문으로 19개 장르 출력 --%>
               <div id="gnrDiv1">
                  <h3 id="gr_anly">선호 장르 분석</h3>
                  <div class="btn-group-toggle" data-toggle="buttons">
                     <c:forEach items="${genreList}" var="genre">
                        <label class="btn btn-secondary active">
                        <input type="checkbox" name="genreList" autocomplete="off" style="visibility:hidden" value="${genre.grno}">${genre.grName}
                        </label>
                     </c:forEach>
                  </div>
                  <!-- btn-group-toggle -->
               </div>
               <!-- gnrDiv1 -->
               <hr>
               <hr>
               
               <!-- 
                  <label for="lifemov"><h3>인생 영화 선정</h3>
                  <h5>취향 분석을 위한 작품 10개를 선정해주세요</h5>
                  <div>
                     <input type="text" placeholder="검색입력(최대10개)">
                     <input value="검색" type="button">
                  </div> -->
                  
                  
               <input type="submit" value="확인"> <input type="reset" value="취소">
            </form>
         </div>
      </main>
      <jsp:include page="../include/footer.jsp"></jsp:include>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
      <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
      <script src="../../js/bootstrap.js"></script>
      <script src="../../js/common.js"></script>
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
      <script type="text/javascript">
         function readURL(input) {
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
         
         $("#imageUpload").change(function() {
             readURL(this);
         });
         
         function readURL(input) {
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
         
         $("#imageUpload").change(function() {
             readURL(this);
         });
      </script>
   </body>
</html>