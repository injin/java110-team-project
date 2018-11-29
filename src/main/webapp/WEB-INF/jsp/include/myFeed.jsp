<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>${loginUser.nickname}</title>
  <link rel='stylesheet' href='/css/bootstrap.css'>
  <link rel="stylesheet" href="/css/fontawesome.css">
  <link rel="stylesheet" href="/css/all.css">
  <link rel='stylesheet' href='/css/common.css'>
  <link rel='stylesheet' href='/css/writingPost.css'>
  <link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
  <link rel='stylesheet' href='/css/starrr.css'>
  <link rel='stylesheet' href='/css/detailPost.css'>
  <link rel='stylesheet' href='/css/feed.css'>
  
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
  
    function showCont(cont, index) {
  
      var text = cont.replace(/[\s]+/g, " ").trim();
      var word = text.split(' ');
      var newHTML = "";
  
      word
          .forEach(function(value, index) {
            var str = "";
            var endBr = value.endsWith('<br>');
            var valueArr = [ value ];
            if (value.includes('<br>')) {
              valueArr = value.split('<br>');
              str = "<br>";
            }
  
            valueArr
                .forEach(function(value2, index) {
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
      document.getElementById('reviewCont-' + index).innerHTML = newHTML;
    };
  </script>
</head>
<body>
  <jsp:include page="../include/header.jsp"></jsp:include>

  <main role="main" class="container pt-0">
    <div class="row">
      <aside class="col-3">
        <div class="mt-2">
          <img class="card-img-top" id="mypage-profile-img" src="${loginUser.profileImagePath}" alt="프로필 이미지">
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
              <th scope="col" class="col-2 text-center"><a href="#">리뷰피드</a></th>
              <th scope="col" class="col-2 text-center"><a href="#">장면보관함</a></th>
              <th scope="col" class="col-2 text-center"><a href="#">통계</a></th>
              <th scope="col" class="col-2 text-center"><a href="#">팔로우</a></th>
              <th scope="col" class="col-2 text-center"><a href="#">활동로그</a></th>
              <th scope="col" class="col-2 text-center"><a href="#">정보수정</a></th>
            </tr>
            </thead>
          </table>
          </div>
        </div>
        
        <div class="row pl-3 pr-3">
<%-- ========================================================================================== --%>
          <!-- 작업공간 START -->
          <div class="wPost">
            <h6 style="font-size: 0.7rem; font-weight: bold">리뷰 작성하기</h6>
            <div style="border-bottom: 1px solid #00cc99; color: #00cc99">
              <c:choose>
                <c:when test="${not empty sessionScope.loginUser}">
                  ${sessionScope.loginUser.nickname}님, 무슨 영화를 보셨나요?
                </c:when>
                <c:otherwise>
                                  로그인후 리뷰를 작성해주세요.
                </c:otherwise>
              </c:choose>
            </div>
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
        <c:if test="${post.open}">
          <div class="wPost reviewPst">
            <div class="media row" style="padding: 0 1rem">
              <img src="${post.member.profileImagePath}"
                style="width: 2.5rem; height: 2.5rem; border-radius: 50%; margin-right: 0.5rem;" />
              <div class="media-body">
                <ul
                  style="float: left; list-style: none; padding-left: 0; margin-bottom: 0">
                  <li><a href="#" style="color: black;">${post.member.nickname}</a></li>
                  <li><c:if test="${not empty post.ftags}">
                      <c:forEach items="${post.ftags}" var="ftag">
                        <a href="#"
                          style="color: blue; font-size: 0.2rem; vertical-align: top;">
                          ${ftag.nickname} </a>
                      </c:forEach>
                    </c:if></li>
                </ul>
                <%-- 버튼 들어갈 부분 --%>
                <div id="drop">
                    <div class="btn-group-vertical" role="group" aria-label="Button group with nested dropdown">
                        <div class="btn-group" role="group">
                            <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"></button>
                            <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                                <!-- <a class="dropdown-item" href="#">Dropdown link</a>
                                <a class="dropdown-item" href="#">Dropdown link</a> -->
                                <button type="button" class="btn btn-secondary btn-xs">수정</button>
                                <br>
                                <button type="button" class="btn btn-secondary btn-xs">삭제</button>
                            </div>
                        </div>
                    </div>
                </div>
                <%-- 버튼 --%>
                <c:if test="${post.pstTypeNo ==0}">
                  <p style="float: right; font-size: 1.5rem; margin-bottom: 0;">
                    <b><i>${post.title}</i></b>
                  </p>
                </c:if>
                
                
              </div>
            </div>
            <%-- 내용보여주는부분 --%>
            <div class="clearfix media row" style="margin: 0.2rem 0">
              <div class="media-body">
                <p class="reviewCont" id="reviewCont-${status.index}">
                  <script>
                    showCont("${post.content}",
                        "${status.index}");
                  </script>
                </p>
              </div>
              <c:if test="${post.photos[0].phot !=null}">


                <%-- 이미지 클릭시 상세모달로 --%>
                <img onclick="openDetailModal(${status.index})"
                  src="/upload/post/${post.photos[0].phot}"
                  data-title="${post.title}"
                  style="width: 20rem; height: 13rem; margin-left: 1rem;" />
                <input type="hidden" data-toggle="modal" id="detailPst"
                  data-target="#detailModal" />

              </c:if>
            </div>

            <div class="row">

              <%-- 좋아요 --%>
              <div class="col-6" style="text-align: left;">
                <a href="#" style="color: black"> <i
                  class="far fa-thumbs-up btmIcon" style="color: red;"></i>${post.likeCnt}
                </a> <a href="#" style="color: black"> <i
                  class="far fa-comment btmIcon"></i>0
                </a>
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
        </c:if>
      </c:forEach>
          <!-- 작업공간 END -->
<%-- ========================================================================================== --%>
        </div>
      </div>
    </div>
  </main>
  <jsp:include page="/WEB-INF/jsp/reviewFeed/writingPost.jsp"></jsp:include>
  <jsp:include page="/WEB-INF/jsp/reviewFeed/detailPost.jsp"></jsp:include>

  <jsp:include page="../include/footer.jsp"></jsp:include>
  <script src="/js/jquery-ui.js"></script>
  <script src="/js/starrr.js"></script>
  <script src="/js/bootstrap-tagsinput.min.js"></script>
  <script src="/js/typeahead.bundle.min.js"></script>
  <script src="/js/writingPost.js"></script>
  <script type="text/javascript">
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
    pary.push('${pht.phot}');
    </c:forEach>
    var fary =[];  
    <c:forEach items="${post.ftags}" var="ft">
    fary.push('${ft.nickname}');
    </c:forEach>
    postList.push({
      pstno: '${post.pstno}',
      title: '${post.title}',
      profileImagePath: '${post.member.profileImagePath}',
      nick:'${post.member.nickname}',
      star:'${post.star}',
      photos:pary,
      dftags:fary
    })
  </c:forEach>
  
  
   function openDetailModal(index) {
     
     $('#detailModal #movie-title').text(postList[index].title);
     $('#detailModal #ownerImg').attr('src',postList[index].profileImagePath);
     $('#detailModal #ownerNick').text(postList[index].nick);
     $('#detailModal #dCont').html($('#reviewCont-'+index).html());
     $('#detailModal #dpstno').val(postList[index].pstno); 
     
     /* 별 부분*/
     var star = postList[index].star;
     if(star != 0){
       var html='';
     for (var i=0; i<5; i++) {
       if (i< star) {
         html += '<i class="fas fa-star sStar"></i>';
       } else {
         html += '<i class="far fa-star sStar"></i>';
       }
     }
     $('#detail-star').html(html);
     }
     
      /* 이미지 추가부분*/
     var h ='';
     h += '<ol class="carousel-indicators">';
     for (var i=0; i<postList[index].photos.length; i++) {
       if(i ==0){
     h += '  <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'" class="active"></li>';
       }else{
         h += '  <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'"></li>';    
       }
     }
     h += '</ol>';
     h += '<div class="carousel-inner">';
     for (var i=0; i<postList[index].photos.length; i++) {
       if(i ==0){
     h += '  <div class="carousel-item active">';}
       else{
         h += '  <div class="carousel-item">';    
       }
     h += '    <img class="d-block w-100" src="/upload/post/'+ postList[index].photos[i] +'" alt="'+ i +'_slide" style="height: 44rem;">';
     h += '  </div>';
     }
     h += '</div>';
     
     h += '<a class="carousel-control-prev" href="#carouselExampleIndicators"';
     h += '  role="button" data-slide="prev">';
     h += '  <span class="carousel-control-prev-icon" aria-hidden="true"></span>'; 
     h += '  <span class="sr-only">Previous</span>';
     h += '</a> <a class="carousel-control-next"';
     h += '  href="#carouselExampleIndicators" role="button" data-slide="next">';
     h += '  <span class="carousel-control-next-icon" aria-hidden="true"></span>';
     h += '  <span class="sr-only">Next</span>';
     h += '</a>';
      
     $('#carouselExampleIndicators').html(h); 
     
     /* 친구태그 부분*/
     html ='';
     for (var i=0; i<postList[index].dftags.length; i++) {
       html+='<a href="#" style="color: blue; font-size: 0.2rem; vertical-align: top;">';
       html += postList[index].dftags[i];
        html +='</a>';
     }
     $('#dftags').html(html); 
     
     listCmt(postList[index].pstno);
     
    $('#detailModal').modal('show');
  }
  
   /* 댓글 리스트 받아오는 함수 */
  function listCmt(pstno) {
    $.ajax({
      type:'POST',
      url:'/app/reviewFeed/listCmt',
      headers : {
        'Content-Type': 'application/json'
      },
      data: JSON.stringify({ 
        "pstno" : pstno
      }),
      before: function() {
        $('#pCmt').val('');
      },
      success:function(data){
        console.log('modal로 댓글 리스트가져오기');
        makeCmtHtml(data);
      }
    });
  }
  
   /* 댓글정보 html로 만드는 함수*/
  function makeCmtHtml(data) {
    var html = '';
    console.log(data.cmtsResult);
      for (var i=0;i<data.cmtsResult.length;i++) {
        
      html += '<li>';
      html += '<div class="row comment-box p-1 pt-3 pr-4">';
      html += '  <div class="col-3 user-img text-center">';
      html += '    <img src="';
      html += '/img/default-profile-img.png';
      /* html += data.cmtsResult[i].profileImage; */
      html += '" class="main-cmt-img">';
      html += '    <label>';
      html += data.cmtsResult[i].nickname; 
      html += '    </label>';
      html += '  </div>';
      html += '  <div class="col-9 user-comment bg-light rounded">';
      html += '    <p class="w-100 p-2 m-0">';
      html += data.cmtsResult[i].content; 
      html += '    </p>';
      html += '    <p class="w-100 p-2 m-0">';
      html += '      <span class="float-right">';
      html += '      <i class="fa fa-clock mr-1" aria-hidden="true"></i> 01 : 00 ';
      html += '      </span>';
      html += '    </p>';
      html += '  </div>';
      html += '</div>';
      html += '</li> ';   
    }  
    
    $('#cmt-area').html(html);  
  }
  
   function addCmt() {
     var contVal = $('#addCmtForm textarea[name="content"]').val();
     console.log(contVal);
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
           console.log('modal에서 댓글 등록');
           listCmt($('#dpstno').val());
         }
       });
   }
  </script>
</body>
</html>