<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
%>
<%
  response.setContentType("text/html; charset=utf-8");
%>
<%@ include file="../include/top.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 상세 정보 수정</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/accountDetail.css'>
<link rel='stylesheet' href='/css/common.css'>
<style>
.list-group-item {
	padding: 0.3rem 0.3rem;
}

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

#signOutSection {
	padding: 1rem;
	height: 200px;
}

#signOutBtn {
	float: right;
	display: inline-block;
}

.confirm {
	text-align: center;
}

h3, .h3 {
	text-align: center;
}

#nickname-section {
	width: 100%;
	height: 40px;
}

input.form-control {
	text-align: center;
}

#pr-section {
	width: 100%;
	padding: 1% 20%;
}

#signOutSection {
	height: 150px;
}

.pr {
	height: 100px;
}

.nickname {
	width: 10%;
	width: 10rem;
	margine: 2rem;
}

.outter {
	width: 100%;
	text-align: center;
	vertical-align: middle;
}

.inner {
	position: relative;
	display: inline-block;
}
#cover-area{
    width: 100%;
    text-algin:center;
    vertical-align: middle;
}
</style>
</head>
<!-- http://localhost:8888/app/auth/update  -->
<body class="borderGray bgGray">
	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container">





	<hr>
		<h3 id="cover-img">커버 사진</h3>
	<section id="cover-area">
        
        <div id="outter">
		<div class="cover-upload">

			<div class="cover-edit">
				<input type='file' name="coverImage" id="imageUpload-cover" accept=".png, .jpg, .jpeg" /> <label for="imageUpload-cover"></label>
			</div>

			<div class="cover-preview row">
				<%-- <div id="coverPreview"
					style="background-image: url('${loginUser.coverImagePath}');">
				</div> --%>
				<div class="CoverImage" id="coverPreview"
                     style="background-image: url('${loginUser.coverImagePath}');">
                </div>
			</div>

		</div>
		</div>
		
	</section>




	<hr>


	</main>
	<hr>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<%-- jQuery가 꼬일경우 아래 셋을 확인 하라 --%>
	<script src="/js/bootstrap.bundle.js"></script>
	<!-- <script src="/js/jquery-ui.js"></script> -->
	<script src="/js/bootstrap.js"></script>

	<script type="text/javascript">
  //커버 & 프로필 이미지 업로드 관련
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