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
<title>회원 가입 상세 정보</title>
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
</style>
</head>
<!-- http://localhost:8888/app/signupDetail/detailForm
        회원 가입시 정보 최초 수정시에만 쓸 페이지, 회원 정보 수정에서 다시 쓸수 있을지 미지수 
    -->
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main role="main" class="container">
	<div id="detail">
		<form action="add" method="post" id="detailForm"
			enctype="multipart/form-data">
			<input type="hidden" name="mno" value="${sessionScope.loginUser.mno}">
			<h3 class="mt-3">닉네임</h3>

			<div class="form-group row">
				<div class="col-xs-12 col-md-6 col-lg-4 ">
					<input type="text" class="form-control" name="nickname"
						value="${member.nickname}">
				</div>
			</div>
			<hr>

			<h3>프로필 사진</h3>
			<div class="avatar-upload">
				<div class="avatar-edit">
					<input type='file' name="profileImage" id="imageUpload-profile"
						accept=".png, .jpg, .jpeg" /> <label for="imageUpload-profile"></label>
				</div>
				<div class="avatar-preview">

					<div id="profilePreview"
						style="background-image: url('${loginUser.profileImagePath}');"></div>

				</div>
			</div>
			<hr>

			<h3 id="cover-img">커버 사진</h3>
			<div class="cover-upload">
				<div class="cover-edit">
					<input type='file' name="coverImage" id="imageUpload-cover"
						accept=".png, .jpg, .jpeg" /> <label for="imageUpload-cover"></label>
				</div>
				<div class="cover-preview">
					<div id="coverPreview"
						style="background-image: url('${loginUser.coverImagePath}');"></div>
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
			
			<section class="my-mv-list" style="height:300px; margin:2rem;">
			<div class="srchNlist">
				<div class="input-group" style="width: 30rem; float:left; position:absolute;">
					<div class="input-group-prepend">
						<div class="input-group-text">영화</div>
					</div>
					<input type="text" class="form-control" id="input-srch-keyword"
						placeholder="검색어를 입력해 주세요" autocomplete="off"> <span
						class="input-group-btn">
						<button class="btn btn-primary" id="btn-srch-movie"
							onclick="findMoviesByKeywod()" type="button">검색</button>
					</span>
				</div>
				
				
				
	            <div class="searchList" style="width: 30rem; float:left; margin-top:40px;">
					<ul class="list-group" id="list-search-movie"></ul>
	            </div>
            </div>

			<div class="listBox" style="width: 30rem; float:right; border:1px solid sivler">
			     <ul class="chooseList" id="list-choose-movie"
			         style="margin-top: 0; margin-bottom: 1rem; max-height: 300px; overflow: auto;">
			     
			     </ul>
			</div>
			</section>
			<!-- 쇼 가져올 영화 출력 예시 -->
            <hr>


			<hr>
			<input type="hidden" name="selecList" id="test">
			<div class="confirm" style="">
			    <input type="submit" class="btn btn-default" value="확인">
			    <input type="reset" class="btn btn-default" value="취소">
			</div>
		</form>
	</div>
	</main>
	<hr>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="/js/jquery-ui.js"></script>
    <script src="/js/bootstrap.js"></script>

<script type="text/javascript">
//  완성된 js

//    배열의 proto 길이 제한.
Array.prototype.add = function(x) {
    this.unshift(x);
    this.maxLength = 20;
    if (this.maxLength !== undefined && this.length > this.maxLength){
        this.pop();
        console.log('Can not over 20');
        alert('20개 이상 선택 할 수 없습니다.');
    } 
}
/* 
테스트 코드

var a = [];
for ( var i = 0; i <= 40; i++) {
    a.add(i);
    console.log(a);
}
*/

//Enter Key 먹지 않게
$("#input-srch-keyword").keypress(
     function(event){
     if (event.which == '13') {
         event.preventDefault();
         $(this).trigger(findMoviesByKeywod());
     }

});

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

//영화 검색 & 출력
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

// html 출력
var $inputKeyword = $('#input-srch-keyword');
var $srchMovieList = $('#list-search-movie');
var $chooseMvList = $('#list-choose-movie');
var selecList = [];
$('#test').val(selecList);
    
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
        html += '<br>';
        html += `<button type="button" onclick="addList(` + obj.id + `, '` + obj.title + `')" `;
        html += ' name="mvList" class="badge badge-primary badge-pill" style="cursor: pointer;">등록</button>';
        html += '</div>';
        html += '</li>';
        console.log(idx + ':' + obj.title + ':' + obj.release_date);
        });
    return html;
}

/*  */
/*
추가할 때는 리스트 두개 사용해서 각각 아이디랑 타이틀을 넣고 삭제할 때는 해당값을 지우고 마지막에 확인할 때 해당 배열을 전달.
회원 영화 등록시 mv_mv 테이블에 영화 먼저 등록 해야함.
*/
//영화 선정 리스트를 위한 배열과 메소드

function addList(id, title) {
	console.log('hi ' + id);
	for (var i in selecList) {
		if (selecList[i].mvno === id){
            console.log('이미 있는 영화 입니다.');
            return;
        }
	}
	    selecList.add({mvno:id, title:title});
    makeFavListHtml(id, title);
    
}
    
function removeList(id) {
	console.log('bye ' + id);
    var idx;
    for (var i in selecList) {
        if (selecList[i].mvno == id){
            console.log(i);
            idx = i;
            console.log(idx);
            break;
        }
    }
        console.log(idx, id);
    if (idx > -1) {
        selecList.splice(idx, 1);
        console.log(selecList);
    }
    $('#mv-li-'+id).remove();
}

function makeFavListHtml(id, title) {
    var print = '';

    print += '<li class="list-group-item" id="mv-li-' + id + '"><div class="media">';
    print += '<div class="media-body">';
    print += '<span class="mt-0"><b>' + title + "\t" + '</b></span>';
    print += `<button type="button" onclick="removeList('` + id +`')" style="float:right; cursor: pointer;" `;
    print += ' class="badge badge-primary badge-pill">제거</button>';
    print += '<input type="hidden" name="favMvIdList" value=' + id + '>';
    print += '<input type="hidden" name="favMvTitleList" value="' + title + '">';
    print += '</div>';
    print += '</li>';

    $chooseMvList.append(print);
}
</script>
</body>
<form action="signOut" method="post">
	<input type="hidden" name="mno" value="${member.mno}">
	<button type="submit" class="btn" onclick="bye()">!!Caution!!
		Nuclear Launch!!</button>
</form>


</html>