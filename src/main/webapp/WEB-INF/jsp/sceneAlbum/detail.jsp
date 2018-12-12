<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 앨범 상세 -->
<section class="col-lg-12">
    <div class="row detailList col-lg-12 p-0">
        <div class="col-lg-12 mt-4 ml-3 pr-5 mb-5">
            <span class="titl">${sceneAlbum.lbmTitle}
            </span>
            <c:if test="${isMyAlbum == true}">
                <div class="a_btn btn btn-primary btn-lg mr-2"
                    onclick="editButton(${sceneAlbum.lbmno}, '${sceneAlbum.lbmTitle}', ${sceneAlbum.open})" <%-- data-lbmno="${sceneAlbum.lbmno}"
                    data-lbm-title="${sceneAlbum.lbmTitle}"
                    data-open="${sceneAlbum.open}" --%>>수정하기</div>
                <input type="hidden" data-toggle="modal" id="mgrAlbum"
                    data-target="#mgrModal" />
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
                <div class="col-4 scene c-pointer" onclick="goToSR(${sceneReview.mvno},${sceneReview.srno})">
                    <img class="card-img-top hot-sr-img"
                        src="/upload/sceneReview/${sceneReview.photo}"
                        alt="Card image cap">
                    <div class="card-body">
                        <div class="card-title overflow">
                            <b><span>${sceneReview.title}</span></b>
                           
                        </div>
                        <span class="sceneTime">(${sceneReview.time})</span>
                    </div>
                </div>

            </c:forEach>
        </div>

    </div>
    <jsp:include page="../sceneAlbum/mgrPopup.jsp"></jsp:include>
    <%-- <jsp:include page="../sceneAlbum/albumPopup.jsp"></jsp:include> --%>
</section>

<script>

var lbmno = ${sceneAlbum.lbmno};
var tgtMno = ${targetUser.mno};
var removedLbmno = [];
        
        // 모달 종료시 reload
        $(document.body).on('hidden.bs.modal', '#mgrModal', function (e) {           
            
            var isRemoved = false;
            
            for(var i=0; i<removedLbmno.length; i++){
                if(removedLbmno[i]==lbmno){
                    isRemoved = true;
                }
            }
            
            if(isRemoved == false){
	            location.reload();
	            $('#mgrModal').show();
            }else{
                commonAlert('error','해당 앨범은 삭제되었습니다.');
                location.href= "/app/sceneAlbum/list?tgtMno="+tgtMno;
            }
            
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
            console.log('editTitle'+lbmno);
            var html = '';
            html += '<div class="form-group">';
            html += '<input onkeydown="EditByEnterKey('+lbmno+')" type="text" name="tContent" class="form-control" autocomplete="off" placeholder="보관함명">';
            html += '<a href=#><i class="far fa-check-circle" onclick="editBtn('+lbmno+')" style="font-size:1.5rem;"></i></a></div>';
            
            $('.title_box').html(html);
        }
        
       /*
       
       $('.form-group input[name="tContent"]').keypress(function(e){
           if(e.keyCode == 13){
               alert($(this));
           } 
        }); 
       
       */
         
    /* 
    id="editName"
    $("#editName").keypress(
                function(event){
                  if (event.which == '13') {
                    alert('hi');
                    event.preventDefault();
                  }
              });
         */
        
         // 앨범 명 수정 엔터키로
        function EditByEnterKey(lbmno){
            if(event.keyCode == 13) {
                alert('enter'+ lbmno);
                editBtn(lbmno);
           }
        }
          
        //앨범 명 수정?
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
                    commonAlert('success', '앨범명을 수정하였습니다.');
                    alert('앨범명수정완료');
                    showLbmList(data);
                    $('.title_box').html(html);
                }
            }); 
        }
        
     // 수정하기 버튼 클릭
        function editButton(lbmno, lbmTitle, open){
            document.getElementById('mgrAlbum').click();
            editAlbum(lbmno, lbmTitle, open);
            
        }
        
        // 수정모달에서 앨범명 클릭시 변화
        function editAlbum(lbmno, lbmTitle, open){
            
            var html='<button type="button" class="close" data-dismiss="modal"';
            html+='aria-label="Close">';
            html+='<span aria-hidden="true">&times;</span>';
            html+='</button>';
            
            if(open==true){
                $('.openIcon').parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-globe-americas globe"></i></span>');
            }else{
                $('.openIcon').parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-lock lock"></i></span>');
            }
            
            $('.openIcon').parent().append(html);
            $('.title_box').html(lbmTitle+'<span class="title_edit" onclick="editTitle('+lbmno+')">'+'<i class="far fa-edit" style="font-size: 1rem;"></i></span>');
            
            $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/srList',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno
                }),
                success:function(data){
                    //console.log('장면리스트가져옴');
                    showSrList(data);
                }
            });
        }
        
        // 공개여부 수정
        function editOpen(lbmno, open){
            
            var html='<button type="button" class="close" data-dismiss="modal"';
               html+='aria-label="Close">';
               html+='<span aria-hidden="true">&times;</span>';
               html+='</button>';
            
            $( ".openIcon" ).toggleClass(function(){
               if($(this).find('i').hasClass('globe')){
                   open = false;
                   $(this).parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-lock lock"></i></span>');
               }else{
                   open = true;
                   $(this).parent().html('<span class="openIcon" onclick="editOpen('+lbmno +','+ open+')"><i class="fas fa-globe-americas globe"></i></span>');
               }
                
            });
            $('.openIcon').parent().append(html);
             
          
             $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/editOpen',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno,
                   "open" : open
                }),
                success:function(data){
                    commonAlert('success', '공개여부를 수정하였습니다.');
                    showLbmList(data);
                    editAlbum(data.sceneAlbum.lbmno, data.sceneAlbum.lbmTitle, data.sceneAlbum.open);
                }
            });    
        }
        
        
        // 앨범 삭제여부 확인
        function removeLbm(lbmno){
           
            commonConfirm(lbmno, '정말로 삭제하시겠습니까?');
            $('.modal-header').click(function(){
                $('.noty_layout').css('display', 'none');
            });
            
        }
        
        // 앨범 삭제
        function deleteLbm(lbmno){
            
            var html;
            html += '<div class="title_box">앨범을 선택해주세요.</div>';
            html += '<div class="row"></div>';
            
             $.ajax({
                type:'POST',
                url: '/app/sceneAlbum/removeLbm',
                headers: {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({
                   "lbmno" :  lbmno
                }),
                success:function(data){
                    $('.title_box').text('앨범을 선택해주세요.').css('cursor','default').next().find('span.openIcon').remove();
                    removedLbmno.push(lbmno);
                    commonAlert('success', '앨범을 삭제하였습니다.');
                    showLbmList(data);
                    
                }
            });
        }
        
        // 앨범 목록 보여주기
         function showLbmList(data){
            var html = '';
            for(var i=0; i<data.sceneAlbumList.length; i++){
                
            html += '<div class="album_title al_wrap text-center"';
            html += 'onclick="editAlbum(' + data.sceneAlbumList[i].lbmno + ',\'' + data.sceneAlbumList[i].lbmTitle + '\','+ data.sceneAlbumList[i].open+')">'; 
            html += '<div class="al_overflow">'+data.sceneAlbumList[i].lbmTitle+ '</div>';
            html += '<i class="fas fa-trash-alt al_trash"';
            html += '   onclick="removeLbm('+data.sceneAlbumList[i].lbmno+')"></i></div>';
                
            }
            $('.boxList').html(html);
        } 
        
        // 앨범별 보유 장면 - 수정모달에서 보여주기
        function showSrList(data){
            console.log('showSrList 진입');
            var html = '';
            for(var i=0; i<data.sceneReview.length; i++){
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
            
            if($('.srlist').children().length == 0){
                $('.srlist').html('<div style="margin-top: 13rem;"><p style="text-align: center;">해당 앨범에 보관된 장면이 없습니다.</p></div>');
            }
            
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
                    commonAlert('success', '장면을 삭제하였습니다.');
                    showSrList(data);
                }
            }); 
        }
        
        // 대표이미지 설정
        function setImg(photo, lbmno){
            
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
                    commonAlert('success', '대표이미지로 설정하였습니다.');
                }
            }); 
        }
        
        function goToSR(mvno,srno){
            location.href = "/app/sceneReview/review?mvno="+mvno+"&srno="+srno;
        }
    </script>
