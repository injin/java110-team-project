<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장면리뷰</title>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/movieReview.css">
<link rel="stylesheet" href="/css/common.css">
<style>
.span-more {
    color: #00cc99;
    cursor: pointer;
}
span.comment-profile {
    background-size: contain;
}

    
</style>
</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
    
        <div class="row">
            <div class="col-12" id="movie-cover" style="background-image: url(${sceneReview.imgPath})">
                <div class="row col-12" id="movie-content">
                    <div id="movie-title" class="float-left">
                        <h3><b>${tmdbMovie.title}</b>
                            <c:if test="${not empty sessionScope.loginUser}">
                            <a href="#" data-toggle="modal" data-target="#srAddModal" class="btn-pencil" ><img src="/img/btn-pencil.png"></a>
                            </c:if>
                        </h3>
                        <p>(${tmdbMovie.releaseDate})</p>
                    </div>
                    
                    <div id="movie-genres" class="float-right">
                        <c:forEach items="${tmdbMovie.genres}" var="genre">
                            <div class="genre-tag">${genre.name}</div>
                        </c:forEach>
                    </div>
                </div>
                
                <div class="row">
                    <div id="scene-list-container">
                        <c:forEach items="${sceneList}" var="scene">
                            <div class="scene-box">
                                <img class="scene-img" src="${scene.imgPath}"
                                    data-toggle="tooltip" data-placement="top" title="${scene.title} (${scene.time})">
                            </div>
                        </c:forEach>
                    </div>
                </div>
                
                
            </div>
        </div>
        
        <c:if test="${sceneReview.time eq null}">
            <div class="row mt-3 ml-1">
                <div class="col-9">
                    <div class="alert alert-secondary" role="alert">
                        <span>등록된 리뷰가 없습니다. <br>이 영화의 첫 리뷰어가 되어주세요!</span>
                    </div>
                </div>
            </div>
        </c:if>
        
        <c:if test="${sceneReview.time ne null}">
        <div class="row mt-3 ml-1">
            <div class="col-9">
                <c:if  test="${sceneReview.trgtSrExist == true}">
                    <h3>${sceneReview.title}<span id="span-sr-time"> (${sceneReview.time})</span></h3>
                    <c:choose>
                        <c:when test="${fn:length(sceneReview.cont) > 150}">
                            <p id="p-cont">${fn:substring(sceneReview.cont, 0, 150)}.. 
                                <span class="span-more" onclick="contMore()">더보기</span></p>
                        </c:when>
                        <c:otherwise>
                            <p>${sceneReview.cont}</p>
                        </c:otherwise>
                    </c:choose>
                    
                    <c:if test="${not empty sessionScope.loginUser}">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1" class="comment-profile"
                                style="background:url(${loginUser.profileImagePath})">
                                <%-- <img class="profile-small" src="${loginUser.profileImagePath}"> --%>&nbsp;&nbsp;&nbsp;
                            </span>
                          </div>
                          <input type="text" class="form-control" placeholder="Write a comment" aria-describedby="basic-addon1">
                        </div>
                    </c:if>
                    
                    
                </c:if>
                <c:if  test="${sceneReview.trgtSrExist == false}">
                    <div class="alert alert-secondary" role="alert">
                      <span>해당 시간의 장면리뷰가 없습니다.</span>
                    </div>
                </c:if>
            </div>
            <div class="col-3">
                
                
                
            </div>
        </div>
        </c:if>
        
    <%-- <button type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#reportModal">신고하기</button>
    <jsp:include page="../report/report.jsp"></jsp:include> --%>
    
    <%@ include file="addPopup.jsp" %>
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript">
    
    $('[data-toggle="tooltip"]').tooltip();
    
    /* 하단 장면 목록 박스 관련 */
    var initScene = { imgPath: '${sceneReview.imgPath}'};
    $('.scene-img').on('mouseover', function() {
        var imgPath = $(this).attr('src');
        $('#movie-cover').css('background-image', 'url(' + imgPath + ')');
    }).on('mouseleave', function() {
        $('#movie-cover').css('background-image', 'url(' + initScene.imgPath + ')');
    });
    
     /* 모달 관련  */
    var $modal = $('#srAddModal').modal({show : false});
    
    /* 슬라이드 관련 */
    $('#srTimeSlider').on('input', function() {
        var sec_num = parseInt(this.value, 10);
        var hours   = Math.floor(sec_num / 3600);
        var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
        var seconds = sec_num - (hours * 3600) - (minutes * 60);

        if (hours   < 10) {hours   = "0"+hours;}
        if (minutes < 10) {minutes = "0"+minutes;}
        if (seconds < 10) {seconds = "0"+seconds;}
        $('#time').val(hours+':'+minutes+':'+seconds);
    });
    
    function addSceneReview() {
        if (validateForm() == false)
            return;
        $('input[name="spo"]').val($('#tfSpo').prop('checked')? 'Y': 'N');
        $('form#srAddForm').submit();
    }
    
    function validateForm() {
        // 장면 시간 검사
        var timeVal = $('#time').val();
        var pattern = /[0-9]{2}:[0-9]{2}:[0-9]{2}/gi;
        if (!(pattern.test(timeVal))) {
            alert('장면 시간 형식에 맞게 입력해 주세요(시:분:초)');
            return false;
        }
        
        // 장면제목
        var titleVal = $('input[name="title"]').val();
        if (titleVal == '') {
            alert('장면제목을 입력해 주세요');
            return false;
        }
        
        // 장면내용
        var contVal = $('textarea[name="cont"]').val();
        if (contVal == '') {
            alert('장면내용을 입력해 주세요');
            return false;
        }
        
        // 파일 선택
        if ($('input[name="phot"]').val().length == 0) {
            alert('이미지를 선택해 주세요');
            return false;
        }
        return true;
    }
    
    function contMore() {
        $('#p-cont').text('${sceneReview.cont}');
    }
    
    </script>
</body>
</html>