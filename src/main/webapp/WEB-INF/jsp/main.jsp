<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="include/top.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link href="/css/fontawesome.css" rel="stylesheet">
<link href="/css/all.css" rel="stylesheet">
<link rel='stylesheet' href='/css/writingPost.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/bootstrap-tagsinput.css'>
<link rel='stylesheet' href='/css/starrr.css'>
<link rel='stylesheet' href='/css/detailPost.css'>
<style>
.card-hot-sr {
    max-height: 20em;
}

.card-hot-sr .img-sr {
    height: 10em;
}

.hot-sr-img {
    height: 10em;
}

.hot-sr {
    height: 5em;
}

.hot {
    height: 20em;
    max-height: 20em;
}

.p-hot {
    max-height: 2em;
}

.p-hot2 {
    max-height: 10em;
    padding-top: 3em;
}

.c-hot {
    margin-top: 5em;
    padding-top: 1.5em;
}

.wPost {
    background: white;
    padding: 1rem 1rem 0 1rem;
    border-radius: 0.5rem;
    box-shadow: 7px 7px 30px -5px rgba(0, 0, 0, 0.1);
    margin: 2rem 0;
}

.pst {
    padding: 1rem 0;
    cursor: pointer !important;
}

.pst:hover {
    background-color: #f2f2f2;
    font-weight: bold;
}

.pst>i {
    font-size: 2rem;
    vertical-align: sub;
}

.btmIcon {
    padding: 0 0.4rem 1rem 1rem;
    font-size: 1.3rem;
    vertical-align: sub;
}

.hash {
    color: blue;
    font-weight: bold;
}

.reviewCont {
    height: 13rem;
    -ms-text-overflow: ellipsis;
    -o-text-overflow: ellipsis;
    text-overflow: ellipsis;
    white-space: pre-line;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: pre-line;
}

.mauto {
    margin: 0 auto;
}

.sStar {
    font-size: 1.5rem;
    color: #FFD119;
}

</style>
<script>

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
    <jsp:include page="include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
    <div class="masthead block-wide text-white text-center"
        style="height: 450px;">
        <div class="overlay"></div>
        <div class="container">
            <div class="row">
                <div class="col-xl-9 mx-auto">
                    <h1 class="mb-5">Connect to Moviestagram</h1>
                    <h5 class="mb-5">Discover, and share a
                        constantly expanding Movie around the world</h5>
                </div>
                <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">

                </div>
            </div>
        </div>
    </div>

    <div class="text-center" style="margin-top: 50px">
        <h3 class="mb-5">
            <strong>지금 인기 있는 장면</strong>
        </h3>
    </div>

    <div class="row">
        <c:forEach var="top" items="${topSrList}">
            <div class="col-3 mb-3">
                <div class="card">
                    <a
                        href="/app/sceneReview/review?mvno=${top.mvno}&srno=${top.srno}">
                        <img class="card-img-top hot-sr-img"
                        src="/upload/sceneReview/${top.photo}"
                        alt="Card image cap">
                    </a>
                    <div class="card-body hot-sr">
                        <h6 class="card-title">
                            <c:set var="Text" value="${top.title}" />
                            <c:if test="${fn:length(Text)<20}">
                                <b>${fn:substring(Text,0,20)}</b>
                            </c:if>
                            <c:if test="${fn:length(Text)>20}">
                                <b>${fn:substring(Text,0,20)}...</b>
                            </c:if>
                            <br>
                            <span>(${top.time})</span>
                        </h6>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="block-wide pb-3" style="background-color: #e6e6e6;">
        <div class="text-center c-hot">
            <h3 class="mb-5">
                <strong>HOT 영화리뷰</strong>
            </h3>
        </div>

        <!-- 슬라이더 START -->
        <div id="hotSr" class="carousel slide" data-ride="carousel">

            <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#hotSr" data-slide-to="0"
                    class="active"></li>
                <li data-target="#hotSr" data-slide-to="1"></li>
                <li data-target="#hotSr" data-slide-to="2"></li>
            </ul>





            <div class="carousel-inner no-padding my-5">
                <c:forEach items="${topMpList}" var="post"
                    varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <div
                            class="carousel-item  <c:if test="${status.first}">active</c:if>">
                            <div class="row pl-3 pr-3">
                    </c:if>

                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="card card-hot-sr">

                            <c:choose>
                                <c:when
                                    test="${not empty post.photos[0]}">
                                    <div class="card-body hot"
                                        onclick="openDetailModal(${status.index})"
                                        data-title="${post.title}"
                                        style="cursor: pointer">
                                        <input type="hidden"
                                            data-toggle="modal"
                                            id="detailPst"
                                            data-target="#detailModal" />
                                        <h5 class="card-title">${post.title} 리뷰</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">작성자:${post.member.nickname}</h6>
                                        <span class="cmt-date">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${post.createdDate}" /></span>
                                        <p class="card-text p-hot reviewCont"
                                            id="reviewCont-${status.index}">
                                                 <script>
                                                         showCont("${post.content}",
                                                                  "${status.index}");
                                                 </script>
                                        </p>
                                        <img class="img-sr"
                                            src="/upload/post/${post.photos[0]}">
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="card-body hot"
                                        onclick="openDetailModal(${status.index})"
                                        style="cursor: pointer">
                                        <input type="hidden"
                                            data-toggle="modal"
                                            id="detailPst"
                                            data-target="#detailModal" />
                                        <h5 class="card-title">${post.title}리뷰</h5>
                                        <h6 class="card-subtitle mb-2 text-muted">작성자:${post.member.nickname}</h6>
                                        <span class="cmt-date">&nbsp;<fmt:formatDate pattern="yyyy-MM-dd" value="${post.createdDate}" /></span>
                                        <p class="card-text p-hot2 reviewCont"
                                            id="reviewCont-${status.index}">
                                            <script>
                                                showCont("${post.content}",
                                                        "${status.index}");
                                            </script>
                                        </p>
                                        <!--  <img class="img-sr" src="/img/default-movie-img.png"> -->
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>

                    <c:if test="${status.index%3 == 2 || status.last}">
            </div>
        </div>
        </c:if>
        </c:forEach>
    </div>

    <a class="carousel-control-prev" href="#hotSr" data-slide="prev">
        <span class="carousel-control-prev-icon sp"></span>
    </a> <a class="carousel-control-next" href="#hotSr" data-slide="next">
        <span class="carousel-control-next-icon sp"></span>
    </a>

    </div>
    <!-- 슬라이더 END -->
    </div>

    <div class="block-wide pb-3">
        <div class="text-center" style="margin-top: 50px">
            <h3 class="mb-5">
                <strong>장면 앨범</strong>
            </h3>
        </div>

        <!-- 슬라이더 START -->
        <div id="scn" class="carousel slide" data-ride="carousel">

            <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#scn" data-slide-to="0" class="active"></li>
                <li data-target="#scn" data-slide-to="1"></li>
                <li data-target="#scn" data-slide-to="2"></li>
            </ul>





            <div class="carousel-inner no-padding my-5">
                <c:forEach items="${albumList}" var="album"
                    varStatus="status">
                    <c:if test="${status.index%3 == 0}">
                        <div
                            class="carousel-item  <c:if test="${status.first}">active</c:if>">
                            <div class="row pl-3 pr-3">
                    </c:if>

                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <div class="card card-hot-sr">
                            <div class="album"
                                onclick="albumDetail('${album.lbmTitle}','${album.open}', '${album.lbmno}')"
                                style="cursor: pointer;">
                                <c:choose>
                                 <c:when test="${empty album.phot}">
                                     <img src="/img/default.jpg">     
                                 </c:when>
                                 <c:otherwise>
                                     <img class="card-img-top hot-sr-img scene"
                                            src="/upload/sceneReview/${album.phot}"
                                            alt="Card image cap">
                                 </c:otherwise>
                            </c:choose>
                                    <div class="row">
                                        <span class="overflow" style="margin-left: 1rem;"> <b>${album.lbmTitle}</b></span>
                                        <span style="margin-left: 1.3rem;"><i
                                            class="fas fa-globe-americas globe"
                                            style="float: right; margin: 0.2rem;"></i></span>
                                    </div>
                                <span style="font-size: 0.8rem; float: left;">${album.srCnt}개</span> <span
                                style="float: left; clear: both;">${album.cdt}</span>
                            </div>
                        </div>
                    </div>

                    <c:if test="${status.index%3 == 2 || status.last}">
            </div>
        </div>
        </c:if>
        </c:forEach>
    </div>

    <a class="carousel-control-prev" href="#scn" data-slide="prev">
        <span class="carousel-control-prev-icon sp"></span>
    </a> <a class="carousel-control-next" href="#scn" data-slide="next">
        <span class="carousel-control-next-icon sp"></span>
    </a>

    </div>
    <!-- 슬라이더 END -->
    </div>

    </main>
    <jsp:include page="reviewFeed/writingPost.jsp"></jsp:include>
    <jsp:include page="reviewFeed/detailPost.jsp"></jsp:include>
    <jsp:include page="include/footer.jsp"></jsp:include>
    <script src="/js/jquery-ui.js"></script>
    <script src="/js/starrr.js"></script>
    <script src="/js/bootstrap-tagsinput.min.js"></script>
    <script src="/js/typeahead.bundle.min.js"></script>
    <script src="/js/writingPost.js"></script>
    <script>

   var flwList = [];
   <c:forEach items="${userFlwList}" var="lst">
   flwList.push({
       "value" : "${lst.mno}",
       "text" : "${lst.nickname}"
   });
   </c:forEach>
   
   var topMpList = [];
   
   
   <c:forEach items="${topMpList}" var="post">
   var pary =[];
       <c:forEach items="${post.photos}" var="pht">
       pary.push('${pht}');
       </c:forEach>
       var fary =[];    
       <c:forEach items="${post.ftags}" var="ft">
       fary.push('${ft.nickname}');
       </c:forEach>
       topMpList.push({
           pstno: '${post.pstno}',
           title: '${post.title}',
           profileImagePath: '${post.member.profileImagePath}',
           nick:'${post.member.nickname}',
           star:'${post.star}',
           photos:pary,
           dftags:fary,
           createdDate:'${post.createdDate}'
       })
   </c:forEach>
   
   function openDetailModal(index) {
       console.log(index);
       $('#detailModal #movie-title').text(topMpList[index].title);
       $('#detailModal #ownerImg').attr('src',topMpList[index].profileImagePath);
       $('#detailModal #ownerNick').text(topMpList[index].nick);
       $('#detailModal #dCont').html($('#reviewCont-'+index).html());
       $('#detailModal #dpstno').val(topMpList[index].pstno); 
       $('#detailModal #cdate').text(new Date(topMpList[index].createdDate).toLocaleString()); 
       /* 별 부분*/
       var star = topMpList[index].star;
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
        if (topMpList[index].photos.length == 0) {
            $('#leftcol').hide();
            $('#rightcol').removeClass('col-4').addClass('col-12');
            $('#detailModal .modal-dialog').css('maxWidth', '35rem');
        } else {
            
            var h ='';
            h += '<ol class="carousel-indicators">';
            for (var i=0; i<topMpList[index].photos.length; i++) {
                if(i ==0){
            h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'" class="active"></li>';
                }else{
                    h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'"></li>';        
                }
            }
            h += '</ol>';
            h += '<div class="carousel-inner">';
            for (var i=0; i<topMpList[index].photos.length; i++) {
                if(i ==0){
            h += '    <div class="carousel-item active">';}
                else{
                    h += '    <div class="carousel-item">';        
                }
            h += '        <img class="d-block w-100" src="/upload/post/'+ topMpList[index].photos[i] +'" alt="'+ i +'_slide" style="height: 44rem;">';
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
            
            $('#leftcol').show();
            $('#rightcol').removeClass('col-12').addClass('col-4');
            $('#detailModal .modal-dialog').css('maxWidth', '70rem');
        }
        
       
       /* 친구태그 부분*/
       html ='';
       for (var i=0; i<topMpList[index].dftags.length; i++) {
           html+='<a href="#" style="color: blue; font-size: 0.2rem; vertical-align: top;">';
           html += topMpList[index].dftags[i];
            html +='</a>';
       }
       $('#dftags').html(html); 
       
       listCmt(topMpList[index].pstno);
       
      $('#detailModal').modal('show');
      
  }
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
           html += '    <div class="col-3 user-img text-center">';
           html += '        <img src="';
           html += '/img/default-profile-img.png';
           /* html += data.cmtsResult[i].profileImage; */
           html += '" class="main-cmt-img">';
           html += '        <label>';
           html += data.cmtsResult[i].nickname; 
           html += '        </label>';
           html += '    </div>';
           html += '    <div class="col-9 user-comment bg-light rounded">';
           html += '        <p class="w-100 p-2 m-0">';
           html += data.cmtsResult[i].content; 
           html += '        </p>';
           html += '        <p class="w-100 p-2 m-0">';
           html += '            <span class="cmt-date float-right">';
           html +=  new Date(data.cmtsResult[i].createdDate).toLocaleString();
           html += '            </span>';
           html += '        </p>';
           html += '    </div>';
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