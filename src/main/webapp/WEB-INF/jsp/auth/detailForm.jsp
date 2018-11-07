<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>회원 가입 상세 정보</title>
        <link rel='stylesheet' href='../../css/bootstrap.css'>
	<style>
	    body {
	        background: whitesmoke;
	        font-family: 'Open Sans', sans-serif;
	    }
	    
	    .container {
	        max-width: 960px;
	        margin: 30px auto;
	        padding: 20px;
	    }
	    
	    .container2 {
	        height: 800px;
	    }
	    
	    h1 {
	        font-size: 20px;
	        text-align: center;
	        margin: 20px 0 20px;
	        small {
	            display: block;
	            font-size: 15px;
	            padding-top: 8px;
	            color: gray;
	        }
	    }
	    
	    .avatar-upload {
	        position: relative;
	        max-width: 205px;
	        margin: 50px auto;
	        .avatar-edit {
	            position: absolute;
	            right: 12px;
	            z-index: 1;
	            top: 10px;
	            input {
	                display: none;
	                + label {
	                    display: inline-block;
	                    width: 34px;
	                    height: 34px;
	                    margin-bottom: 0;
	                    border-radius: 100%;
	                    background: #FFFFFF;
	                    border: 1px solid transparent;
	                    box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.12);
	                    cursor: pointer;
	                    font-weight: normal;
	                    transition: all .2s ease-in-out;
	                    &:hover {
	                        background: #f1f1f1;
	                        border-color: #d6d6d6;
	                    }
	                    &:after {
	                        content: "\f040";
	                        font-family: 'FontAwesome';
	                        color: #757575;
	                        position: absolute;
	                        top: 10px;
	                        left: 0;
	                        right: 0;
	                        text-align: center;
	                        margin: auto;
	                    }
	                }
	            }
	        }
	        .avatar-preview {
	            width: 192px;
	            height: 192px;
	            position: relative;
	            border-radius: 100%;
	            border: 6px solid #F8F8F8;
	            box-shadow: 0px 2px 4px 0px rgba(0, 0, 0, 0.1);
	            > div {
	                width: 100%;
	                height: 100%;
	                border-radius: 100%;
	                background-size: cover;
	                background-repeat: no-repeat;
	                background-position: center;
	            }
	        }
	    }
	</style>


</head>





<!-- http://localhost:8888/app/signupDetail/detailForm -->

<body>
    <jsp:include page="../include/header.jsp"></jsp:include>

    <div id="detail">
        <form action="post" action="#">
            <h1 id="formHeader">상세 정보</h1>
            
            <main role="main" class="container">
            
            
            <label for="nickname">
                <h3>닉네임</h3>
                <input type="text" name="nickName">
            </label>
            <br> 
            <hr>
            
            
            
            <div class="container">
                <h3>프로필사진</h3>
                <div class="avatar-upload">
                    <div class="avatar-edit">
                        <input type='file' id="imageUpload" accept=".png, .jpg, .jpeg" />
                        <label for="imageUpload"></label>
                    </div>
                    <div class="avatar-preview">
                        <div id="imagePreview" style="background-image: url(http://i.pravatar.cc/500?img=7);">
                        </div>
                    </div>
                </div>
            </div>
            
            
            
            <hr>
            <br>
            
            
            
            <div class="container2">
                <h3>커버사진</h3>
                <input type="file" accept="image/*" onchange="loadFile(event)">
				<img id="output" style="max-width:900px; max-height:900px;"/>
				<script>
				  var loadFile = function(event) {
				    var output = document.getElementById('output');
				    output.src = URL.createObjectURL(event.target.files[0]);
				  };
				</script>
            </div>
            
            
            
            <br>
            <hr>



            <br>
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



            <input type="submit" value="가입"> 
            <input type="reset" value="취소">
        </form>
    </div>


    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="../../js/bootstrap.js"></script>
    <script src="../../js/common.js"></script>

    <script type="text/javascript"
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
	<script type="text/javascript">
	    function readURL(input) {
	        console.log('imgUpload');
	        if (input.files && input.files[0]) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                $('#imagePreview').css('background-image', 'url('+e.target.result +')');
	                $('#imagePreview').hide();
	                $('#imagePreview').fadeIn(650);
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