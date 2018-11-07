<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>회원 가입 상세 정보</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/common.js"></script>
    
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>

</head>

<!-- http://localhost:8888/HSJE/SignUpDetail.jsp -->

<body>


	<div id="detail">
		<form action="post" action="#">
			<h2 id="formHeader">상세 정보</h2>

			<label for="nickname"><h3>닉네임</h3> <input type="text"
				name="nickName"> </label><br> <label for="file"><h3>프로필사진</h3>
				<input type="file" name="file1"> </label><br> <label
				for="file2"><h3>커버사진</h3> <input type="file" name="file2">
			</label><br>


			<hr>




			<h3 id="gr_anly">선호 장르 분석</h3>


			<!-- jstl for 문으로 19개 장르 출력 -->
			<div id="gnrDiv1">
				<div id="gnrDiv2">

					<button type="button" class="btn btn-primary" data-toggle="button"
						aria-pressed="false" autocomplete="off">로맨틱 코메디</button>


					<div class="btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-secondary"> <input type="checkbox"
							checked autocomplete="off"> 바껴라1
						</label> <label class="btn btn-secondary active"> <input
							type="checkbox" checked autocomplete="on"> 바껴라2
						</label> <label class="btn btn-secondary active"> <input
							type="checkbox" checked autocomplete="off"> 바껴라3
						</label>
					</div>
					<label class="switch"> <input type="checkbox"> <span
						class="slider round"></span>
					</label>
					<p>OFF</p>
					<p style="display: none;">ON</p>




				</div>
			</div>



			<hr>




			<!-- 
          <label for="lifemov"><h3>인생 영화 선정</h3>
          <h5>취향 분석을 위한 작품 10개를 선정해주세요</h5>
          <div>
             <input type="text" placeholder="검색입력(최대10개)">
             <input value="검색" type="button">
          </div>
-->



			<input type="submit" value="가입"> <input type="reset"
				value="취소">
		</form>
	</div>




</body>
</html>