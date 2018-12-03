<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%-- ========================================================================================== --%>
          <!-- 작업공간 START -->
          <%-- 글 작성 부분 --%>
            <div class="wPost">
                <%-- 
                <h6 style="font-size: 0.7rem; font-weight: bold">리뷰 작성하기</h6>
                <div style="border-bottom: 1px solid #00cc99; color: #00cc99">
                    <c:choose>
                        <c:when test="${not empty sessionScope.loginUser}">
                            <input type="hidden" id="sessionMno"
                                value="${sessionScope.loginUser.mno}" />
                            ${sessionScope.loginUser.nickname}님, 무슨 영화를 보셨나요?
                        </c:when>
                        <c:otherwise>
                                                            로그인후 리뷰를 작성해주세요.
                        </c:otherwise>
                    </c:choose>
                </div>
                 --%>
                 
                <div class="row">
                    <div class="col text-center pst"
                        onclick="document.getElementById('btnIlsang').click();">
                        <i class="far fa-image"></i> 일상 리뷰 올리기
                        <c:choose>
                            <c:when test="${not empty sessionScope.loginUser}">
                                <input type="hidden" data-toggle="modal" id="btnIlsang"
                                    onclick="postShow('btnIlsang')" data-target="#reviewModal" />
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" id="btnIlsang" onclick="loginError()" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col text-center pst"
                        onclick="document.getElementById('btnMovie').click();">
                        <i class="fas fa-film"></i> 영화 리뷰 올리기
                        <c:choose>
                            <c:when test="${not empty sessionScope.loginUser}">
                                <input type="hidden" data-toggle="modal" id="btnMovie"
                                    data-target="#reviewModal" onclick="postShow('btnMovie')" />
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" id="btnMovie" onclick="loginError()" />
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
<%-- ========================================================================================== --%>
          <%-- 포스터 보이는 부분 --%>
            <c:forEach items="${postList}" var="post" varStatus="status">
                <c:if test="${status.last}">
                    <c:set var="lastpstno" value="${post.pstno}" />
                </c:if>
                    <div class="wPost reviewPst list-group-item">
                        <div class="media row" style="padding: 0 1rem">
                            <img src="${post.member.profileImagePath}"
                                style="width: 2.5rem; height: 2.5rem; border-radius: 50%; margin-right: 0.5rem;" />
                            <div class="media-body">
                                <ul style="float: left; list-style: none; padding-left: 0; margin-bottom: 0">
                                    <li><a href="#" style="color: black;">${post.member.nickname}</a>
<%-- =================================== POST HEADER ========================================== --%>
                                        <c:choose>
                                            <c:when test="${post.open == false}" > <i class="fas fa-lock lock"></i> </c:when>
                                        </c:choose>
                                    </li>
                                    <li>
                                        <c:if test="${not empty post.ftags}">
                                            <c:forEach items="${post.ftags}" var="ftag">
                                                <a href="#"
                                                    style="color: blue; font-size: 0.2rem; vertical-align: top;">
                                                    ${ftag.nickname} </a>
                                            </c:forEach>
                                        </c:if>
                                    </li>
                                </ul>
                                
                                <span class="cmt-date" style="padding-left: 10px;">&nbsp;
                                    <fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${post.createdDate}"/>
                                </span>
                                <c:if test="${post.pstTypeNo ==0}">
                                    <p style="float: right; font-size: 1.5rem; margin-bottom: 0;">
                                        <b><i>${post.title}</i></b>
                                    </p>
                                </c:if>
                            </div>
                        <%-- dropDownBtn 들어갈 부분 --%>
                        <div id="drop">
                            <div class="btn-group-vertical" role="group" aria-label="Button group with nested dropdown">
                                <div class="btn-group" role="group">
                                    <button id="btnGroupDrop" type="button" class="btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button><!-- style="display: none;" -->
                                    <label for="btnGroupDrop"><i class="fas ellipsis"></i></label>
                                    <div class="dropdown-menu" aria-labelledby="btnGroupDrop">
                                        <button type="button" class="btn btn-xs" onclick='updatePost(${post.pstno})'>수정</button>
                                        <br>
                                        <button type="button" class="btn btn-xs"onclick='deletePost(${post.pstno})'>삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- dropDownBtn 여기까지 --%>
                        </div>
<%-- =================================== POST HEADER ========================================== --%>
                        <%-- 내용보여주는부분 --%>
                        <div class="clearfix media row" style="margin: 0.2rem 0">
                            <div class="media-body">
                                <p class="reviewCont" id="reviewCont-${post.pstno}">
                                    <script>
                                        showCont("${post.content}",
                                                "${post.pstno}");
                                    </script>
                                </p>
                            </div>
                            <c:if test="${post.photos[0] !=null}">


                                <%-- 이미지 클릭시 상세모달로 --%>
                                <img onclick="openDetailModal(${post.pstno})"
                                    src="/upload/post/${post.photos[0]}" data-title="${post.title}"
                                    style="width: 20rem; height: 13rem; margin-left: 1rem;" />
                                <input type="hidden" data-toggle="modal" id="detailPst"
                                    data-target="#detailModal" />

                            </c:if>
                        </div>

                        <div class="row">

                            <%-- 좋아요 --%>
                            <div class="col-6" style="text-align: left;">
                                <i
                                    class="fas fa-thumbs-up btmIcon c-pointer <c:if test="${!post.likeCheck}">dis-none</c:if>"
                                    id="btn-like-full-${post.pstno}"
                                    onclick="cancelLike(${post.pstno},${post.pstTypeNo})"
                                    style="color: red;"></i> <i
                                    class="far fa-thumbs-up btmIcon c-pointer <c:if test="${post.likeCheck}">dis-none</c:if>"
                                    id="btn-like-empty-${post.pstno}"
                                    onclick="addLike(${post.pstno},${post.pstTypeNo});"
                                    style="color: red;"></i> <span id="lCnt-${post.pstno}">${post.likeCnt}</span>
                                <i class="far fa-comment btmIcon c-pointer"></i> <span
                                    id="cCnt-${post.pstno}">${post.cmtCnt}</span>

                            </div>

                            <%-- 별점 --%>
                            <c:if test="${post.pstTypeNo ==0}">
                                <div class='col-6' style="text-align: right;">
                                    <c:if test="${0 ne post.star}">
                                        <c:forEach begin="1" end="5" var="x">
                                            <c:choose>
                                                <c:when test="${x le post.star}">
                                                    <i class="fas fa-star sStar"></i>
                                                </c:when>
                                                <c:otherwise>
                                                    <i class="far fa-star sStar"></i>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                    </c:if>
                                </div>
                            </c:if>

                        </div>

                    </div>
            </c:forEach>
          <!-- 작업공간 END -->
<%-- ========================================================================================== --%>
  <jsp:include page="/WEB-INF/jsp/reviewFeed/writingPost.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/jsp/reviewFeed/detailPost.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/jsp/reviewFeed/editingPost.jsp"></jsp:include>
  
  <script src="/js/jquery-ui.js"></script>
  <script src="/js/starrr.js"></script>
  <script src="/js/bootstrap-tagsinput.min.js"></script>
  <script src="/js/typeahead.bundle.min.js"></script>
  <script src="/js/writingPost.js"></script>
  <script>
    function loginError() {
        alert('로그인 후 작성할 수 있습니다.');
    }
    function postShow(id) {
        if (id == 'btnIlsang') {
            $("#pstTypeNo").val(1);
            $('.onlyMovie').hide();
        } else if(id == 'detailPst'){
            
        } else {
            $("#pstTypeNo").val(0);
            $('.onlyMovie').show();
        }
    }
    function makeContHtml(cont, index) {
        var text = cont.replace(/[\s]+/g, " ").trim();
        var word = text.split(' ');
        var newHTML = "";
        word.forEach(function(value, index) {
                    var str = "";
                    var endBr = value.endsWith('<br>');
                    var valueArr = [ value ];
                    if (value.includes('<br>')) {
                        valueArr = value.split('<br>');
                        str = "<br>";
                    }
                    valueArr.forEach(function(value2, index) {
                                if (index == (valueArr.length - 1)
                                        && endBr == false) {
                                    str = "";
                                }
                                if (value2.startsWith("#")) {
                                    newHTML += ("<span class='hash'><a href='/app/searchResult?keyword="
                                            + value2.substring(1)
                                            + "'>"
                                            + value2 + "&nbsp;</a></span>" + str);
                                } else {
                                    newHTML += "<span class='other'>" + value2
                                            + "&nbsp;</span>" + str;
                                }
                            });
                });
          
        return newHTML;
    }
    function showCont(cont, index) {
        var newHTML = makeContHtml(cont, index);
        document.getElementById('reviewCont-' + index).innerHTML = newHTML;
    }
  </script>
  <script type="text/javascript">
<%-- ========================================================================================== --%>
  /* 삭제하기 */
  
  function deletePost(id){
    var postId=id;
    console.log(postId);
    $.ajax({
      url: "/app/reviewFeed/delete",
      type: "POST",
      data: { "postId" : postId },
      success: function(){
        console.log(id);
        location.reload();
      },
      error: (xhr, status, msg) => {
          console.log(xhr);
          console.log(status);
          console.log(msg);
        }
    });
  }
<%-- ========================================================================================== --%>
  /* UPDATE 대체 어떻게 하는거야!! */
  
  function updatePost(id){
    //openEditingModal();
     $.ajax({
      url: "/app/reviewFeed/editor",
      type: "POST",
      data: { "postId" : id },
      success: function(data){
          if(jQuery.isEmptyObject(data)) {
            console.log('null object');
          } else {
              console.log(data);
          }
      },
      error: (xhr, status, msg) => {
        console.log(xhr);
        console.log(status);
        console.log(msg);
      }
    });
  }
<%-- ========================================================================================== --%>
  <%-- detailPost.jsp에 Post 객체 보내는 방식(JavaScript이용.)으로 보내면 될것 같은데  --%>
  /* 원래 있던 부분 */
  var flwList = [];
        <c:forEach items="${userFlwList}" var="lst">
        flwList.push({
            "value" : "${lst.mno}",
            "text" : "${lst.nickname}"
        });
        </c:forEach>
        
        
        
        var postList = []; 
         
        <c:forEach items="${postList}" var="post">
        
        var pary =[];
            <c:forEach items="${post.photos}" var="pht">
            pary.push('${pht}');
            </c:forEach>
            var fary =[];    
            <c:forEach items="${post.ftags}" var="ft">
            fary.push('${ft.nickname}');
            </c:forEach>
            
             postList.push({
                "pstno": '${post.pstno}',
                "title": '${post.title}',
                member:{
                    "profileImagePath": '${post.member.profileImagePath}',
                    "nickname":'${post.member.nickname}',    
                },
                "star":'${post.star}',
                "photos":pary,
                "ftags":fary,
                "createdDate":'${post.createdDate}'
            }) 
            
        </c:forEach> 
            
         var lstpstno = '${lastpstno}';
         
         /* ========== 모달상세 관련  ========== */         
         function openDetailModal(pstno) {
             
             for (var i=0; i<postList.length; i++) {
                 if(postList[i].pstno == pstno){
                     var index = i;
                     break;
                 }
             }
             $('#detailModal #movie-title').text(postList[index].title);
             $('#detailModal #ownerImg').attr('src',postList[index].member.profileImagePath);
             $('#detailModal #ownerNick').text(postList[index].member.nickname);
             $('#detailModal #dCont').html($('#reviewCont-'+postList[index].pstno).html());
             $('#detailModal #dpstno').val(postList[index].pstno);
             $('#detailModal #cdate').text(new Date(postList[index].createdDate).toLocaleString()); 
             
             /* 별 부분*/
             var star = postList[index].star;
             var shtml='';
             if(star != 0){
             for (var i=0; i<5; i++) {
                 if (i< star) {
                     shtml += '<i class="fas fa-star sStar"></i>';
                 } else {
                     shtml += '<i class="far fa-star sStar"></i>';
                 }
             }
             }
             $('#detail-star').html(shtml);
              /* 이미지 추가부분*/
             var h ='';
             h += '<ol class="carousel-indicators">';
             for (var i=0; i<postList[index].photos.length; i++) {
                 if(i ==0){
             h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'" class="active"></li>';
                 }else{
                     h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'"></li>';        
                 }
             }
             h += '</ol>';
             h += '<div class="carousel-inner">';
             for (var i=0; i<postList[index].photos.length; i++) {
                 if(i ==0){
             h += '    <div class="carousel-item active">';}
                 else{
                     h += '    <div class="carousel-item">';        
                 }
             h += '        <img class="d-block w-100" src="/upload/post/'+ postList[index].photos[i] +'" alt="'+ i +'_slide" style="height: 44rem;">';
             h += '    </div>';
             }
             h += '</div>';
             
             h += '<a class="carousel-control-prev" href="#carouselExampleIndicators"';
             h += '    role="button" data-slide="prev">';
             h += '    <span class="carousel-control-prev-icon" aria-hidden="true"></span>'; 
             h += '    <span class="sr-only">Previous</span>';
             h += '</a> <a class="carousel-control-next"';
             h += '    href="#carouselExampleIndicators" role="button" data-slide="next">';
             h += '    <span class="carousel-control-next-icon" aria-hidden="true"></span>';
             h += '    <span class="sr-only">Next</span>';
             h += '</a>';
              
             $('#carouselExampleIndicators').html(h); 
             
             /* 친구태그 부분*/
             html ='';
             for (var i=0; i<postList[index].ftags.length; i++) {
                 html+='<a href="#" style="color: blue; font-size: 0.2rem; vertical-align: top;">';
                 html += postList[index].ftags[i].nickname;
                  html +='</a>';
             }
             $('#dftags').html(html);  
             
             /* 댓글리스트 */
             listCmt(postList[index].pstno);
             
            $('#detailModal').modal('show');
        }
         
         $('#detailModal').on('hidden.bs.modal', function (e) {
             $(':input').val('');
           })
          
         function toDetail(id) {
            window.location.href = '/app/sceneReview/review?mvno='+ id;
          }
          
         
         /* ========== 댓글 관련  ========== */
         function addCmt() {
             var contVal = $('#addCmtForm textarea[name="content"]').val();
             
             if (contVal == '') {
                 alert('내용을 입력해주세요.');
                 return;
             }
             
              $.ajax({
                     type:'POST',
                     url:'/app/reviewFeed/addCmt',
                     data: { 
                         "pstno" : $('#dpstno').val(),
                         "content" : $('#pCmt').val()
                         },
                     success:function(data){
                         listCmt($('#dpstno').val());
                         $('#pCmt').val('');
                     }
                 });
         }
        function listCmt(pstno) {
            $.ajax({
                type:'POST',
                url:'/app/reviewFeed/listCmt',
                headers : {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({ 
                    "pstno" : pstno.toString()
                }),
                success:function(data){
                    makeCmtHtml(data);
                }
            });
        }
        
        function makeCmtHtml(data) {
            var html = '';
              for (var i=0;i<data.cmtsResult.length;i++) {
                  
                html += '<li>';
                html += '<div class="row comment-box p-1 pt-3 pr-4">';
                html += '    <div class="col-3 user-img text-center">';
                html += '        <img src="';
                 html += data.cmtsResult[i].member.profileImagePath; 
                html += '" class="main-cmt-img">';
                html += '        <label>';
                html += data.cmtsResult[i].member.nickname; 
                html += '        </label>';
                html += '    </div>';
                html += '    <div class="col-9 user-comment bg-light rounded">';
                html += '        <p class="w-100 p-2 m-0" style="word-break: break-word;">';
                html += data.cmtsResult[i].content; 
                html += '        </p>';
                html += '        <p class="w-100 p-2 m-0">';
                if(data.cmtsResult[i].member.mno == '${sessionScope.loginUser.mno}'){
                    html += '&nbsp;<i class="far fa-edit c-pointer" onclick="showEditForm(this,';
                    html += data.cmtsResult[i].pcno;
                    html += ')"></i>';
                    html += '&nbsp;<i class="fas fa-times c-pointer" onclick="deleteComment(';
                    html += data.cmtsResult[i].pcno;
                    html += ')"></i>';   
                } 
                html += '            <span class="cmt-date float-right">';
                html +=  new Date(data.cmtsResult[i].createdDate).toLocaleString();
                html += '          </span>';
                html += '        </p>';
                html += '    </div>';
            
                html += '</div>';
                html += '</li> ';   
            }  
            //.toLocaleDateString() 이건 시간만
            $('#cmt-area').html(html);  
        }
         
        function deleteComment(pcno) {
            $.ajax({
                type:'POST',
                url:'/app/reviewFeed/deleteCmt',
                headers : {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({ 
                    "pcno" : pcno.toString()
                    }),
                success:function(data){
                    listCmt($('#dpstno').val());
                    $('#pCmt').val('');
                }
            });
        }
        
        function showEditForm(obj,pcno) {
            
            $(obj).hide();
            var $editCont = $(obj).parent().prev().text();
            var $editArea = $(obj).parent().parent().parent().parent();

            var editHtml = '<div class="card mb-2">';
            editHtml += '<div class="media" style="padding: .5rem;">';
            editHtml += '    <div>';
            editHtml += '        <img class="mr-2 profile-medium" src="${loginUser.profileImagePath}" alt="login-profileImage">';
            editHtml += '        <div style="text-align: -webkit-center;">${sessionScope.loginUser.nickname}</div>';
            editHtml += '    </div>';
            editHtml += '    <div class="media-body text-right">';
            editHtml += '        <textarea class="form-control" name="content" id="editCmt" placeholder="Write a comment">';
            editHtml += $editCont;
            editHtml += '        </textarea>';
            editHtml += '    </div>';
            editHtml += '    <button type="button" class="btn btn-dark mt-2" onclick="editComment(' + pcno + ')" style="height: 3rem; padding: 0 .5rem;">';
            editHtml += '        <i class="fas fa-paper-plane"></i> 수정';
            editHtml += '    </button>';
            editHtml += '</div>';
            editHtml += '</div>';
        
            $editArea.html(editHtml); 
        }
        
        function editComment(pcno) {
            var contVal = $('#editCmt').val();
            if (contVal == '') {
                alert('댓글을 입력해 주세요');
                return;
            }
            
            $.ajax({
                type:'POST',
                url:'/app/reviewFeed/editCmt',
                headers : {
                    'Content-Type': 'application/json'
                },
                data: JSON.stringify({ 
                    "pcno" : pcno.toString(),
                    "content" : contVal.toString()
                    }),
                success:function(data){
                    listCmt($('#dpstno').val());
                    $('#pCmt').val('');
                }
            });
        } 
        
        
        /* ========== 피드 무한스크롤 ========== */
        function morePostHtml(data){
            var html = '';
             
            postList = postList.concat(data.postsResult); 
            
            for (var i=0;i<data.postsResult.length;i++) {
                if(i == data.postsResult.length-1){
                    lstpstno = String(data.postsResult[i].pstno);
                }
                
                html += '        <div class="wPost reviewPst">';
                html += '            <div class="media row" style="padding: 0 1rem">';
                html += '                <img src="';
                html += data.postsResult[i].member.profileImagePath;
                html += '" style="width: 2.5rem; height: 2.5rem; border-radius: 50%; margin-right: 0.5rem;" />';
                html += '                <div class="media-body">';
                html += '                    <ul style="float: left; list-style: none; padding-left: 0; margin-bottom: 0">';
                html += '                        <li><a href="#" style="color: black;">';
                html += data.postsResult[i].member.nickname;
                html += '                            </a></li><li>';
                
                if('null' !=data.postsResult[i].ftags){
                    for(var j=0;j<data.postsResult[i].ftags.length;j++){
                        html += '<a href="#" style="color: blue; font-size: 0.2rem; vertical-align: top;">';
                        html += data.postsResult[i].ftags[j].nickname; 
                        html += '</a>';
                    }
                }
                                        
                html += '                    </li></ul>';
                
                html += '<span class="cmt-date">&nbsp;';
                html +=  new Date(data.postsResult[i].createdDate).toLocaleString();
                html += '</span>'; 
               if(data.postsResult[i].pstTypeNo == 0){
                   html += '<p style="float: right; font-size: 1.5rem; margin-bottom: 0;">';
                   html += '<b><i>';
                   html += data.postsResult[i].title;
                   html += '</i></b></p>';
               }
                                        
                html += '               </div>';
                html += '           </div>';
                html += '           <div class="clearfix media row" style="margin: 0.2rem 0">';
                html += '               <div class="media-body">';
                html += '                   <p class="reviewCont" id="reviewCont-';
                html += data.postsResult[i].pstno;
                html += '">';
                html += makeContHtml(data.postsResult[i].content,data.postsResult[i].pstno);
                html += '</p>';
                html += '               </div>';
                
                
                if('null' !=data.postsResult[i].photos){
                    html += '   <img onclick="openDetailModal(';
                    html += data.postsResult[i].pstno;
                    html += ')" src="/upload/post/';
                    html += data.postsResult[i].photos[0];
                    html += '" data-title="';
                    html += data.postsResult[i].title;
                    html += '"';
                    html += '   style="width: 20rem; height: 13rem; margin-left: 1rem;"/>';
                    html += ' <input type="hidden" data-toggle="modal" id="detailPst"data-target="#detailModal" />';
                }
                    html += '        </div>';
                    
                    html += '       <div class="row">';
                    html += '           <div class="col-6" style="text-align: left;">';
                    
                    html += '<i class="fas fa-thumbs-up btmIcon c-pointer';
                    if(!data.postsResult[i].likeCheck){
                        html += ' dis-none ';
                    }
                    html += '"id="btn-like-full-';
                    html += data.postsResult[i].pstno;
                    html += '" onclick="cancelLike(';
                    html += data.postsResult[i].pstno;
                    html += ',';
                    html += data.postsResult[i].pstTypeNo;
                    html += ')" style="color: red;"></i>';
                    html += '<i class="far fa-thumbs-up btmIcon c-pointer';
                    if(data.postsResult[i].likeCheck){
                        html += ' dis-none ';
                    }
                    html += '"id="btn-like-empty-';
                    html += data.postsResult[i].pstno;
                    html += '" onclick="addLike(';
                    html += data.postsResult[i].pstno;
                    html += ',';
                    html += data.postsResult[i].pstTypeNo;
                    html += ')"style="color: red;"></i><span id="lCnt-';
                    html += data.postsResult[i].pstno;
                    html += '">';
                    html += data.postsResult[i].likeCnt;
                    html += '               </span><i class="far fa-comment btmIcon c-pointer"></i>';
                    html += '              <span id="cCnt-';
                    html += data.postsResult[i].pstno;
                    html += '">';
                    html +=  data.postsResult[i].cmtCnt;
                    html += '           </span></div>';
                    
                    html += '   <div class="col-6" style="text-align: right;">';
                    if(data.postsResult[i].pstTypeNo == 0 && data.postsResult[i].star != 0){
                    
                        for(var s = 0;s<5;s++){
                            if(s<data.postsResult[i].star){
                                
                                html += '<i class="fas fa-star sStar"></i>';    
                            }else{
                                
                                html += '<i class="far fa-star sStar"></i>';
                            }
                        }
                    }
                                   
                    html += '  </div>'; 
                    html += '       </div>';
                            
                    html += '   </div>';
            }  
            
            $('#pstShw').append(html);  
        }
        
        $(window).scroll(function() {
            if ($(window).scrollTop() == $(document).height() - $(window).height()) {
                
                $.ajax({
                    type:'POST',
                    url:'/app/reviewFeed/morePost',
                    headers : {
                        'Content-Type': 'application/json'
                    },
                    data: JSON.stringify({ 
                        "pstno" : lstpstno
                    }),
                    success:function(data){
                        morePostHtml(data);
                    }
                });
            }
          })
          
        /* ========== 좋아요 관련  ========== */
        function addLike(pstno,pstTypeNo) {
             $.ajax({
                url : "/app/reviewFeed/addLike",
                type: "post",
                data : { 
                    "pstno" : pstno,
                    "pstTypeNo":pstTypeNo
                    },
                success : function(data) {
                  $('#btn-like-full-'+pstno).show();
                  $('#btn-like-empty-'+pstno).hide();
                  $('#lCnt-'+pstno).text(data);
                }
            }); 
        }
        
        function cancelLike(pstno,pstTypeNo) {
            $.ajax({
                url : "/app/reviewFeed/cancelLike",
                type: "post",
                data : { 
                    "pstno" : pstno,
                    "pstTypeNo":pstTypeNo
                    },
                success : function(data) {
                    $('#btn-like-empty-'+pstno).show();
                    $('#btn-like-full-'+pstno).hide();
                    $('#lCnt-'+pstno).text(data);
                }
            });
        }
  </script>
</body>
</html>