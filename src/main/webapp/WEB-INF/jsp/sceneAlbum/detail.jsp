<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

	<!-- 앨범 상세 -->
	<section class="col-lg-12">
		<div class="row detailList col-lg-12 p-0">
			<div class="col-lg-12 mt-4 ml-3 pr-5 mb-5">
				<span class="titl">${sceneAlbum.lbmTitle}</span>
				<c:if test="${isMyAlbum == true}">
				<div class="a_btn btn btn-success btn-lg mr-2"
					onclick="editButton(this)"
					data-lbmno="${sceneAlbum.lbmno}"
                                     data-lbm-title="${sceneAlbum.lbmTitle}" data-open="${sceneAlbum.open}">
					수정하기<input type="hidden" data-toggle="modal" id="mgrAlbum"
						data-target="#mgrModal" />
				</div>
				</c:if>
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
		<jsp:include page="../sceneAlbum/albumPopup.jsp"></jsp:include>
	</section>

	<script>
		// 모달 종료시 reload
	    $(document.body).on('hidden.bs.modal', '#mgrModal', function (e) {           
	        location.reload();
	        $('#mgrModal').show();
	    });
		
        // 모달 상단에 앨범명 수정 위한 마우스 오버 이벤트 
        $(document.body).on('mouseover', '.title_box', function() {
            $('.title_edit').css('visibility', 'visible');
        }).on('mouseleave', '.title_box', function() {
            $('.title_edit').css('visibility', 'hidden');
        });
        
        $(document.body).on('mouseover', '.album_title', function() {
            $(this).find('.al_trash').css('visibility', 'visible');
        }).on('mouseleave', '.album_title', function() {
            $(this).find('.al_trash').css('visibility', 'hidden');
        });
        
        // 상단의 앨범 편집 버튼 누를 경우 
        function editTitle(lbmno){
            console.log('editTitle.lbmno : '+lbmno);
            var html = '';
            html += '<div class="form-group">';
            html += '<input type="text" name="tContent" class="form-control" placeholder="보관함명">';
            html += '<a href=#><i class="far fa-check-circle" onclick="editBtn('+lbmno+')" style="font-size:1.5rem;"></i></a></div>';
            
            $('.title_box').html(html);
        }
        
        function editBtn(lbmno){
            
            var html='';
            html += $('.title_box input[name="tContent"]').val();
            html += '<span class="title_edit" onclick="editTitle('+lbmno+')">';
            html += '<i class="far fa-edit" style="font-size: 1rem;"></i></span>';
            
            
             $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/editLbm',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" : lbmno,
                   "lbmTitle": $('.title_box input[name="tContent"]').val()
                }),
                success:function(data){
                    console.log('앨범명 수정');
                    alert('앨범명 수정 완료');
                    console.log(data);
                    showLbmList(data);
                    $('.title_box').html(html);
                }
            }); 
        }
        
        
        
        function editOpen(lbmno, open){
            console.log('lbmno ' +lbmno);
            console.log('open ' +open);
           /*  $( ".openIcon" ).toggle(
                    function() {
                        console.log('this'+$(this));
                      $( this ).parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-lock lock"></i>');
                    }, function() {
                      $( this ).parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-globe-americas globe"></i>');
                    }
                  ); */
           /*  if(open == true){
                $('.openIcon').parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-lock lock"></i>');
            }else{
                $('.openIcon').parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-globe-americas globe"></i>');
            }
             */
           /*  $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/removeLbm',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno,
                }),
                success:function(data){
                    console.log('앨범 삭제함');
                    alert('앨범 삭제 완료');
                    showLbmList(data);
                    
                }
            });  */
        }
        
        // 앨범 삭제
        function removeLbm(lbmno){
            console.log('removeLbm ' + lbmno);
            
            $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/removeLbm',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno,
                }),
                success:function(data){
                    console.log('앨범 삭제함');
                    alert('앨범 삭제 완료');
                    showLbmList(data);
                    
                }
            }); 
        }
        
        // 앨범 목록 보여주기
         function showLbmList(data){
            var html = '';
            for(var i=0; i<data.sceneAlbumList.length; i++){
                
            html += '<div class="album_title al_wrap text-center"';
            html += 'onclick="editAlbum(this)" data-lbmno="'+data.sceneAlbumList[i].lbmno
             +'" data-lbm-title="'+ data.sceneAlbumList[i].lbmTitle +'" data-open="' + data.sceneAlbumList[i].open +'">';
            html += '<div class="al_overflow">'+data.sceneAlbumList[i].lbmTitle+ '</div>';
            html += '<i class="fas fa-trash-alt al_trash"';
            html += '   onclick="removeLbm('+data.sceneAlbumList[i].lbmno+')"></i></div>';
                
            }
            $('.boxList').html(html);
        } 
        
        // 수정하기 버튼 클릭
        function editButton(obj){
            document.getElementById('mgrAlbum').click();
            editAlbum(obj);
            
        }
        
        // 수정모달에서 앨범명 클릭시 변화
        function editAlbum(obj){
            console.log($(obj).data('lbm-title'));
            var open = $(obj).data('open');
            var lbmno = $(obj).data('lbmno');
            if($(obj).data('open')==true){
                $('.openIcon').parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-globe-americas globe"></i>');
            }else{
                $('.openIcon').parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-lock lock"></i>');
            }
            
            $('.title_box').html($(obj).data('lbm-title')+'<span class="title_edit" onclick="editTitle('+lbmno+')">'+'<i class="far fa-edit" style="font-size: 1rem;"></i></span>');
            
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
                    showSrList(data);
                }
            });
        }
        
        // 앨범별 보유 장면 - 수정모달에서 보여주기
        function showSrList(data){
            var html = '';
            for(var i=0; i<data.sceneReview.length; i++){
                console.log(data.sceneReview[i].photo);
            html += '<div class="col-4">';
            html += '<div class="btn-group">';
            html += '<a class="c-pointer" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>';
            html += '<div class="dropdown-menu">';
            html += '<a class="dropdown-item album-img" href="#" onclick="setImg(\'' + data.sceneReview[i].photo + '\', \'' + data.srList[i].lbmno + '\')">대표이미지 설정</a>';
            html += '<a class="dropdown-item" href="#" onclick="removeImg(\'' + data.sceneReview[i].srno + '\', \'' + data.srList[i].lbmno + '\')">삭제</a>';
            html += '</div>';
            html += '</div>';
            html += '<img class="card-img-top hot-sr-img scene"';
            html += '           src="/upload/sceneReview/'
            html +=                     data.sceneReview[i].photo;
            html += '"           alt="Card image cap"></div>';
            }
            $('.srlist').html(html);
        }
        
        // 앨범속 장면 삭제
        function removeImg(srno, lbmno){

             $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/removeImg',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno,
                   "srno" : srno
                }),
                success:function(data){
                    console.log('이미지 삭제함');
                    alert('이미지 삭제 완료');
                    showSrList(data);
                }
            }); 
        }
        
        // 대표이미지 설정
        function setImg(photo, lbmno){
            console.log('photo '+photo);
            console.log('lbmno '+lbmno);
            
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
                }
            }); 
        }
    </script>
