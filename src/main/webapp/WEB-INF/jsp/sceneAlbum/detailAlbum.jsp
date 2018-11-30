<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel='stylesheet' href='/css/album.css'>
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container pt-0">
	<div class="row">
		<aside class="col-3">
			<div class="mt-2">
				<img class="card-img-top" id="mypage-profile-img"
					src="${loginUser.profileImagePath}" alt="프로필 이미지">
				<div class="card-body">
					<h5 class="card-title">${loginUser.nickname}</h5>
					<p class="card-text">${loginUser.pr}</p>
				</div>
			</div>
		</aside>
		<div class="col-9 borderGray p-0" id="mypage-right">
			<img src="${loginUser.coverImagePath}" id="mypage-cover-img">
			<div class="row">
				<div class="col-lg-12">
					<table class="table">
						<thead id="mypage-menu">
							<tr class="d-flex">
								<th scope="col" class="col-2 text-center"><a href="#">나의피드</a></th>
								<th scope="col" class="col-2 text-center"><a href="#">정보수정</a></th>
								<th scope="col" class="col-2 text-center"><a href="#">통계</a></th>
								<th scope="col" class="col-2 text-center"><a href="#">팔로우</a></th>
								<th scope="col" class="col-2 text-center"><a href="#">활동로그</a></th>
								<th scope="col" class="col-2 text-center"><a href="#">장면보관함</a></th>
							</tr>
						</thead>
					</table>
				</div>
			</div>

			<div class="row pl-3 pr-3">


				<!-- 앨범 상세 -->
				<section class="col-lg-12">
					<!--         <div class="row mbr-justify-content-center">
            <div class="col-lg-12 mbr-col-md-12">
 -->
					<div class="row detailList col-lg-12 p-0">
						<div class="col-lg-12 mt-4 ml-1 mb-5">
							<span class="titl">${sceneAlbum.lbmTitle}</span>
							<div class="a_btn btn btn-success btn-lg mr-2"
								onclick="editButton('${sceneReview}')">
								수정하기<input type="hidden" data-toggle="modal" id="mgrAlbum"
									data-target="#mgrModal" />
							</div>
						</div>
						<!-- 앨범 목록 -->
						<div class="row col-lg-12" style="margin: 0 auto;">
							<!-- 장면 -->
							<c:if test="${empty sceneReview}">
								<span class="sr_empty">보관된 장면이 없습니다.</span>
							</c:if>
							<c:forEach var="sceneReview" items="${sceneReview}"
								varStatus="status">
								<div class="col-4 scene">
									<a
										href="/app/sceneReview/review?mvno=${sceneReview.mvno}&srno=${sceneReview.srno}">
										<img class="card-img-top hot-sr-img"
										src="/upload/sceneReview/${sceneReview.photo}"
										alt="Card image cap">
									</a>
								</div>

							</c:forEach>
						</div>

					</div>
					<jsp:include page="../sceneAlbum/mgrPopup.jsp"></jsp:include>
				</section>

			</div>

		</div>
	</div>

	</main>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script>
        $('.title_box').on('mouseover', function() {
            $('.title_edit').css('visibility', 'visible');
        }).on('mouseleave', function() {
            $('.title_edit').css('visibility', 'hidden');
        });
        
        function editButton(obj){
            document.getElementById('mgrAlbum').click();
            console.log(${obj});
        }
        
        function editAlbum(obj){
            console.log($(obj).data('lbmno'));
            console.log($(obj).data('lbm-title'));
            $('.title_box').text($(obj).data('lbm-title'));
            
            $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/srList',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  $(obj).data('lbmno')
                }),
                success:function(data){
                    console.log('장면리스트가져옴');
                    console.log(data);
                    showSrList(data);
                }
            });
        }
        
        function showSrList(data){
            var html = '';
            for(var i=0; i<data.sceneReview.length; i++){
                console.log(data.sceneReview[i].photo);
            html += '<div class="col-4">';
            html += '<div class="btn-group">';
            html += '<a class="c-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>';
            html += '<div class="dropdown-menu">';
            html += '<a class="dropdown-item album-img" href="#" onclick="setImg(\'' + data.sceneReview[i].photo + '\', \'' + data.srList[i].lbmno + '\')">대표이미지 설정</a>';
            html += '<a class="dropdown-item" href="#">삭제</a>';
            html += '</div>';
            html += '</div>';
            html += '<img class="card-img-top hot-sr-img scene"';
            html += '           src="/upload/sceneReview/'
            html +=                     data.sceneReview[i].photo;
            html += '"           alt="Card image cap"></div>';
            }
            $('.srlist').html(html);
        }
        
        function mydrop(obj){
            //$('.mydrop').hide();
            $(obj).next().toggle();
         }
          
        function removeDrop(){
                
        }
        
        function setImg(photo, lbmno){
            console.log('photo'+photo);
            console.log('lbmno'+lbmno);
            
             $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/addLbmImg',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno,
                   "phot" : photo
                }),
                success:function(data){
                    console.log('대표이미지 설정함');
                    alert('대표이미지 설정 완료');
                    $('.mydrop').hide();
                    console.log(data);
                }
            }); 
        }
    </script>

</body>
</html>