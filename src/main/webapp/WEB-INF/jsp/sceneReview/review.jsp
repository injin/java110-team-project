<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장면리뷰</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
<link rel="stylesheet" href="/css/common.css">
<link rel="stylesheet" href="/css/card.css">
<link rel="stylesheet" href="/css/movieReview.css">

<style>
#loader {
    position: fixed;
    top: 30%;
    left: 45%;
    z-index: 9999;
    display: none;
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"></jsp:include>
<main role="main" class="container borderGray">

    <div class="row">
        <div class="col-12 p-0" id="movie-cover">
            <img id="movie-img" src="${sceneReview.imgPath}">
            <div class="row col-12" id="movie-content">
                <div id="movie-title" class="float-left">
                    <h3><b>${tmdbMovie.title}</b>
                        <c:if test="${not empty sessionScope.loginUser}">
                            <br>
                            <a data-toggle="modal" data-target="#srAddModal" class="btn-icon c-pointer" title="장면등록" ><img src="/img/btn-pencil.png"></a>
                            <c:if  test="${sceneReview.trgtSrExist == true}">
                                <a href="#" data-toggle="modal" data-target="#srAlbumAddModal" class="btn-icon" title="장면앨범" ><img src="/img/btn-box2.png"></a>
                                <span class="c-pointer btn-icon <c:if test="${sceneReview.like == false}">dis-none</c:if>" id="btn-heart-full" 
                                    onclick="cancelLike()" title="좋아요"><img src="/img/btn-heart-full.png"></span>
                                <span class="c-pointer btn-icon <c:if test="${sceneReview.like == true}">dis-none</c:if>" id="btn-heart-empty" 
                                    onclick="addLike()" title="좋아요"><img src="/img/btn-heart-empty.png"></span>
                            </c:if>
                        </c:if>
                        <c:if test="${empty sessionScope.loginUser}">
                            <br>
                            <a class="btn-icon c-pointer" onclick="loginAlert()" title="장면등록"><img src="/img/btn-pencil.png"></a>
                            <a class="btn-icon c-pointer" onclick="loginAlert()" title="장면앨범"><img src="/img/btn-box2.png"></a>
                            <span class="btn-icon c-pointer" id="btn-heart-empty"onclick="loginAlert()" title="좋아요"><img src="/img/btn-heart-empty.png"></span>
                        </c:if>
                    </h3>
                    <p class="mb-0 pt-0">(${tmdbMovie.releaseDate})</p>
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
                            <img class="scene-img" src="${scene.imgPath}" data-toggle="tooltip"
                                 data-placement="top" title="${scene.title} (${scene.time})"
                                 onclick="goToSceneReviewDetail(${sceneReview.mvno}, ${scene.srno})">
                        </div>
                    </c:forEach>
                </div>
                
                <c:if test="${sceneReview.trgtSrExist == true}">
                    <c:choose>
                        <c:when test="${sessionScope.loginUser.admin == true}">
                            <a id="btn-siren" class="btn-icon c-pointer" onclick="deleteSceneReview()">
                                <img src="/img/btn-trash.png"></a>
                        </c:when>
                        <c:when test="${not empty sessionScope.loginUser && sceneReview.reported == false}">
                            <a href="#" data-toggle="modal" data-target="#reportModal" id="btn-siren" class="btn-icon" >
                                <img src="/img/btn-siren.jpg"></a>
                        </c:when>
                    </c:choose>
                </c:if>
                
            </div>
            
        </div>
    </div>
    
    <div class="row mt-3 ml-1">
        <c:if test="${sceneReview.time eq null}">
            <div class="col-lg-9 col-md-12">
                <div class="alert alert-secondary" role="alert">
                    <c:choose>
                        <c:when test="${fn:length(sceneList) == 0}">
                            <span>등록된 장면이 없습니다. <br>이 영화의 첫 리뷰어가 되어주세요!</span>
                        </c:when>
                        <c:when test="${sceneReview.trgtSrExist == false}">
                            <span>해당 장면이 없거나 삭제되었습니다.</span>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </c:if>
        <c:if test="${sceneReview.time ne null}">
        <div class="col-lg-9 col-md-12">
            <c:if  test="${sceneReview.trgtSrExist == true}">
                <h3><a class="c-pointer" onclick="goToFeed(${sceneReview.writer.mno})">
                    <img class="profile-small" src="${sceneReview.writer.profileImagePath}" alt="${writer.nickname} 이미지"></a>
                    <span id="span-sr-title">${sceneReview.title}</span><span id="span-sr-time"> (${sceneReview.time})</span>
                </h3>
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
                    <form id="addCommentForm" action="addComment" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="srno" value="${sceneReview.srno}">
                    <input type="hidden" name="map.lat">
                    <input type="hidden" name="map.lng">
                    <input type="hidden" name="map.mapName">
                    <input type="hidden" name="mvnm" value="${tmdbMovie.title}">
                    <input type="hidden" name="photoName">
                    <div class="card" id="comment-area">
                        <div class="media">
                          <div>
                              <img class="mr-2 profile-medium" src="${loginUser.profileImagePath}" alt="${loginUser.nickname} 이미지">
                              <div class="mr-2 text-center">${loginUser.nickname}</div>
                          </div>
                          <div class="media-body">
                            <textarea class="form-control resize-none" name="cont" rows="3" placeholder="댓글을 입력해 주세요(400자)"></textarea>
                            <button type="button" id="btn-map" class="btn btn-light mt-2"><i class="fas fa-map-marker-alt"></i> 장소</button>
                            
                            <label class="btn btn-light mt-2 mb-0" for="my-file-selector">
                                <input id="my-file-selector" type="file" name="phot" style="display:none" 
                                onchange="$('#upload-file-info').html(this.files[0].name)">
                                <i class="fas fa-file-image"></i> 사진
                            </label>
                            <span class='label label-info' id="upload-file-info"></span>
                            
                            <button type="button" class="btn btn-dark mt-2 float-right" onclick="addComment()">
                                <i class="fas fa-paper-plane"></i> 등록</button>
                          </div>
                        </div>
                    </div>
                    </form>
                    
                    <div class="card mt-2" id="map-container">
                      <div class="card-body p-0">
                        <div style="display:none">
                            <div id="search_box" class="pl-2 form-inline">
                                <input type="text" class="form-control mr-sm-2" id="search_keyword" placeholder="검색">
                            </div>
                        </div>
                        <div id="map"></div>
                      </div>
                    </div>
                </c:if>
                
                <c:if test="${not empty cmtList}">
                <c:forEach items="${cmtList}" var="cmt">
                    <div class="media mt-3">
                        <img class="mr-2 profile-medium2" src="${cmt.member.profileImagePath}" alt="Generic placeholder image">
                        <div class="media-body">
                            <span>
                                <span <c:if test="${cmt.member.mno != 21}">class="c-pointer" onclick="goToFeed(${cmt.member.mno})"</c:if>>${cmt.member.nickname}</span>&nbsp;
                                <span class="cmt-date"><fmt:formatDate pattern="yyyy-MM-dd hh:mm:ss" value="${cmt.createdDate}" /></span>
                                <c:if test="${cmt.member.mno eq sessionScope.loginUser.mno}">
                                    &nbsp;<i class="far fa-edit c-pointer" id="cmt-edit-btn-${cmt.cmno}" onclick="showEditForm(${cmt.cmno})"></i>
                                    &nbsp;<i class="fas fa-times c-pointer" id="cmt-del-btn-${cmt.cmno}" onclick="deleteComment(${cmt.cmno})"></i>
                                </c:if>
                            </span><br>
                            <div id="cmt-edit-${cmt.cmno}" data-cont="${cmt.cont}" data-cmno="${cmt.cmno}"></div>
                            <div class="break-all cmt-cont" id="cmt-show-${cmt.cmno}">${cmt.cont}</div>
                            
                            <c:if test="${cmt.map.lat ne null && cmt.map.lng ne null}">
                                <a class="map-link" target="_blank" href="http://google.com/maps/?q=${cmt.map.lat},${cmt.map.lng}">
                                    <i class="fas fa-map-marker-alt"></i> ${cmt.map.mapName}</a>
                            </c:if>
                            
                            <c:if test="${cmt.photo ne null}">
                                <div><img src="/upload/sceneReview/${cmt.photo}" class="rounded cmt-img" alt="댓글 이미지"></div>
                            </c:if>
                        </div>
                    </div>
                </c:forEach>
                
                <jsp:include page="paging.jsp" flush="true">
                    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
                    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
                    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
                    <jsp:param name="pageNo" value="${paging.pageNo}" />
                    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
                    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
                    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
                </jsp:include>
                <form id="cmtListForm" action="review" method="post">
                    <input type="hidden" name="srno" value="${sceneReview.srno}">
                    <input type="hidden" name="mvno" value="${sceneReview.mvno}">
                    <input type="hidden" name="pageNo">
                </form>
                </c:if>
                
            </c:if>
        </div>
        </c:if>
        
        <div class="col-lg-3 col-md-12">
            <c:if test="${fn:length(smlrList) > 0}">
            <div class="wrap d-inline-block w-100">
                <h5><b>유사영화</b></h5>
                <c:forEach items="${smlrList}" var="smlrMovie" begin="0" end="3">
                    <div class="mt-1 c-pointer txt-underline" onclick="goToSceneReview(${smlrMovie.id})">
                    <div class="media">
                      <img class="mr-2 w50" src="${posterPrefix}${smlrMovie.posterPath}" alt="${smlrMovie.title}">
                      <div class="media-body">
                        <h6 class="mt-1"><b>${smlrMovie.title}</b></h6>
                        <span>(${smlrMovie.releaseDate})</span>
                      </div>
                    </div>
                    </div>
                </c:forEach>
            </div>
            </c:if>
            
            <c:if test ="${fn:length(topReviewer) > 0}">
                <div class="wrap d-inline-block w-100">
                    <h5><b>우수 리뷰어</b></h5>
                    <c:forEach items="${topReviewer}" var="reviewer">
                        <div class="mt-1 c-pointer txt-underline" onclick="goToFeed(${reviewer.mno})">
                        <div class="media">
                          <img class="mr-2 profile-medium2" src="${reviewer.profileImagePath}" alt="${reviewer.nickname}">
                          <div class="media-body">
                            <h6 class="mt-1"><b>${reviewer.nickname}</b></h6>
                          </div>
                        </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>

<%@ include file="report.jsp" %>
<%@ include file="addPopup.jsp" %>

<form id="deleteCommentForm" action="deleteComment" method="post">
    <input type="hidden" name="srno" value="${sceneReview.srno}">
    <input type="hidden" name="mvno" value="${sceneReview.mvno}">
    <input type="hidden" name="cmno">
</form>

<form id="editCommentForm" action="editComment" method="post">
    <input type="hidden" name="srno" value="${sceneReview.srno}">
    <input type="hidden" name="mvno" value="${sceneReview.mvno}">
    <input type="hidden" name="cmno">
    <input type="hidden" name="cont">
</form>

<img id="loader" src="/img/loader.gif">

</main>
    
    <jsp:include page="../include/commonJs.jsp"></jsp:include>
    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyA9sQq54221Pu41MGJFSeAYiHPoYebDTd8&libraries=places"></script>
    <script src="/js/vendor/jquery.tweetParser.js"></script>
    
    <script>
    
    $('[data-toggle="tooltip"]').tooltip();
    
    $(".cmt-cont").tweetParser({
        urlClass : "tweet_link", //this is default
        userClass : "tweet_user", //this is default
        hashtagClass : "navy",
        target : "_blank", //this is default
        hashtagPath: "<c:url value='/app/searchResult?keyword=' />"
    });
    
    /* ========== 하단 장면 목록 박스 관련  ========== */
    var initScene = { imgPath: '${sceneReview.imgPath}'};
    $('.scene-img').on('mouseover', function() {
        var imgPath = $(this).attr('src');
        $('#movie-img').attr('src', imgPath);
    }).on('mouseleave', function() {
        $('#movie-img').attr('src', initScene.imgPath);
    });
    
     /* ========== 입력 모달 관련  ========== */
    var $modal = $('#srAddModal').modal({show : false});
    
    var INVALID_TIME = [];
    <c:forEach items="${sceneList}" var="scene">
        INVALID_TIME.push('${scene.time}');
    </c:forEach>
    
    $('#srTimeSlider').on('input', function() {
        var sec_num = parseInt(this.value, 10);
        var hours   = Math.floor(sec_num / 3600);
        var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
        var seconds = sec_num - (hours * 3600) - (minutes * 60);

        if (hours   < 10) {hours   = "0"+hours;}
        if (minutes < 10) {minutes = "0"+minutes;}
        if (seconds < 10) {seconds = "0"+seconds;}
        $('#time').val(hours+':'+minutes+':'+seconds);
        
        checkTimeValid();
    });
    
    // 장면 리뷰 시간 중복 체크
    checkTimeValid();
    $('#time').on('input', function(){
        if (checkTimeValid()) {
            var timeStr = $('#time').val();
            var hours = parseInt(timeStr.substring(0,2));
            var minutes = parseInt(timeStr.substring(3,5));
            var seconds = parseInt(timeStr.substring(6));
            $('#srTimeSlider').val(hours*3600 + minutes*60 + seconds);
        }
    });
    
    function checkTimeFormat(value) {
        var regex = new RegExp(/^([0-1][0-9]|2[0-3]):([0-5][0-9]):([0-5][0-9])$/);
        return regex.test(value);
    }
    
    function checkTimeValid() {
        var timeStr = $('#time').val();
        if (checkTimeFormat(timeStr) == false) {
            $('#time').removeClass('is-valid').addClass('is-invalid');
            $('#invalid-txt').text('형식에 맞지 않는 시간입니다. 예) 00:00:00');
            return false;
        } else if (INVALID_TIME.includes(timeStr)) {
            $('#time').removeClass('is-valid').addClass('is-invalid');
            $('#invalid-txt').text('등록 불가능한 시간입니다.');
            return false;
        } else {
            $('#time').removeClass('is-invalid').addClass('is-valid');
            return true;
        }
    }
    
    function addSceneReview() {
        if (validateForm() == false)
            return;
        $('input[name="photo"]').val(currentFileName);
        $('input[name="spo"]').val($('#tfSpo').prop('checked')? 'Y': 'N');
        $('form#srAddForm #add-sr-btn').attr('disabled', true);
        $('form#srAddForm').submit();
    }
    
    function validateForm() {
        // 장면 시간 검사
        var timeVal = $('#srAddForm #time').val();
        if (checkTimeFormat(timeVal) == false) {
            commonAlert('error', '장면 시간 형식에 맞게 입력해 주세요(시:분:초)');
            return false;
        }
        if ($('#srAddForm #time').hasClass('is-invalid')) {
            commonAlert('error', '이미 등록된 시간입니다.');
            return false;
        }
        // 장면제목
        var titleVal = $('#srAddForm input[name="title"]').val();
        if (titleVal == '') {
            commonAlert('error', '장면제목을 입력해 주세요.');
            return false;
        }
        // 장면내용
        var contVal = $('#srAddForm textarea[name="cont"]').val();
        if (contVal == '') {
            commonAlert('error', '장면내용을 입력해 주세요.');
            return false;
        }
        // 파일 선택
        if ($('#srAddForm input[name="phot"]').val().length == 0) {
            commonAlert('error', '이미지를 선택해 주세요.');
            return false;
        }
        return true;
    }
    
    var currentFileName;
    var currentCmtFileName;
    $('#srAddModal input[name="phot"]').change(function() {
        var file = $(this)[0].files[0];
        uploadFile(file, 'sr');
    });
    $('#addCommentForm input[name="phot"]').change(function() {
        var file = $(this)[0].files[0];
        uploadFile(file, 'cmt');
    });
    
    function uploadFile(file, type) {
        var formData = new FormData();
        formData.append('phot', file);
        if (type == 'sr' && currentFileName != null) {
            formData.append('removeFileName', currentFileName);
        } else if (type == 'cmt' && currentCmtFileName != null) {
            formData.append('removeFileName', currentCmtFileName);
        }
        
        $.ajax({
            url : "/app/sceneReview/fileUpload",
            contentType: false,
            processData: false,
            type: "post",
            data : formData,
            beforeSend: function() {
                $('#loader').show();
            },
            success : function(data) {
                if (data != null) {
                    if (type == 'sr') {
                        currentFileName = data;
                    } else if (type == 'cmt') {
                        currentCmtFileName = data;
                    }
                }
            },
            error : function(error) {
                commonAlert('error', '파일 업로드에 실패하였습니다.');
                console.log(error);
                console.log(error.status);
            },
            complete : function() {
                $('#loader').hide();
            }
        });
    }
    
    /* ========== 댓글 관련  ========== */
    function contMore() {
        $('#p-cont').html('${sceneReview.cont}');
    }
    
    function validateComment(contVal) {
        if (contVal == '') {
            commonAlert('error', '내용을 입력해주세요.');
            return false;
        }
        
        if (contVal.length > 400) {
            commonAlert('error', '400자 까지만 작성이 가능합니다.');
            return false;
        }
        
        return true;
    }
    
    function addComment() {
        var contVal = $('#addCommentForm textarea[name="cont"]').val();
        if (!validateComment(contVal)) return;
        
        if (marker != null) {
            $('#addCommentForm input[name="map.lat"]').val(marker.position.lat());
            $('#addCommentForm input[name="map.lng"]').val(marker.position.lng());
            $('#addCommentForm input[name="map.mapName"]').val(marker.address);
        }
        
        if (currentCmtFileName != null)
            $('#addCommentForm input[name="photoName"]').val(currentCmtFileName);
            
        $('#addCommentForm').submit();
    }
    
    function deleteComment(cmno) {
        $('#deleteCommentForm input[name="cmno"]').val(cmno);
        $('#deleteCommentForm').submit();
    }
    
    function showEditForm(cmno) {
        
        var $editBtn = $('#cmt-edit-btn-' + cmno);
        var $delBtn = $('#cmt-del-btn-' + cmno);
        var $editDiv = $('#cmt-edit-' + cmno);
        var $showDiv = $('#cmt-show-' + cmno);
        $editBtn.hide();
        $delBtn.hide();
        $showDiv.hide();
        
        var cmno = $editDiv.data('cmno');
        var contStr = $editDiv.data('cont').replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
        var editHtml = '<div class="card p-2"><div class="media"><div class="media-body">';
            editHtml += '<textarea class="form-control resize-none" rows="3" id="textarea-cmt-' + cmno + '">' + contStr + '</textarea>';
            editHtml += '<button type="button" class="btn btn-light mt-2 float-right" onclick="closeEditForm(' + cmno + ')">';
            editHtml += '<i class="fas fa-window-close"></i> 취소</button>';
            editHtml += '<button type="button" class="btn btn-light mt-2 float-right" onclick="editComment(' + cmno + ')">';
            editHtml += '<i class="fas fa-paper-plane"></i> 수정</button>';
            editHtml += '</div></div></div>';
        $editDiv.html(editHtml).show();
    }
    
    function closeEditForm(cmno) {
        var $editBtn = $('#cmt-edit-btn-' + cmno);
        var $delBtn = $('#cmt-del-btn-' + cmno);
        var $editDiv = $('#cmt-edit-' + cmno);
        var $showDiv = $('#cmt-show-' + cmno);
        
        $editBtn.show();
        $delBtn.show();
        $showDiv.show();
        $editDiv.html('').hide();
    }
    
    function editComment(cmno) {
        var contVal = $('#textarea-cmt-' + cmno).val();
        if (!validateComment(contVal)) return;
        
        $('#editCommentForm input[name="cmno"]').val(cmno);
        $('#editCommentForm input[name="cont"]').val(contVal);
        $('#editCommentForm').submit();
    }
    
    /* ========== 지도 관련  ========== */
    $('#btn-map').click(function() {
        $('div#map-container').toggle(function() {
            if ($(this).css('display') == 'none') { //지도 숨김 시 marker remove
                if (marker != null) {
                    marker.setMap(null);
                    marker = null;
                }
            }
        });
    });
    
    var map;
    var marker;
    var autocomplete;
    var geocoder;
    function initialize() {
      map = new google.maps.Map(document.getElementById('map'), {
        center: {lat: 37.4971473, lng: 127.0222202},
        zoom: 14
      });
      map.controls[google.maps.ControlPosition.LEFT_TOP].push(document.getElementById('search_box'));
      geocoder = new google.maps.Geocoder();
      
      //마커
      google.maps.event.addListener(map, 'click', function(event) {
          geocoder.geocode({
              'latLng': event.latLng
          }, function(results, status) {
              if (status == google.maps.GeocoderStatus.OK) {
                  addMarker(event.latLng, map, results[0].formatted_address);
              } else {
                  addMarker(event.latLng, map, null);
              }
          });
      });
      
      //자동완성
      var input = document.getElementById('search_keyword');
      autocomplete = new google.maps.places.Autocomplete(input);
      autocomplete.addListener('place_changed', onPlaceChanged);
    }
    
    function onPlaceChanged() {
        var place = autocomplete.getPlace();
        if (!place.geometry) {
            commonAlert('error', '해당 검색어로 조회된 결과가 없습니다.');
            return;
        }
        addMarker(place.geometry.location, map, place.formatted_address);
    }
    
    function addMarker(location, map, address) {
      if (marker != null) marker.setMap(null);
      
      marker = new google.maps.Marker({
          position: location,
          map: map
      });
      map.panTo(location);
      
      if (address != null) marker.address = address;
    }
    
    <c:if test="${not empty loginUser && sceneReview.trgtSrExist == true}">
        google.maps.event.addDomListener(window, 'load', initialize);
    </c:if>
    
    /* ========== 앨범 관련  ========== */
    function addToSrAlbum(lbmno) {
        $.ajax({
            url : "/app/sceneReview/addToSrAlbum",
            type: "post",
            data : { "lbmno" : lbmno,
                     "srno" : '${sceneReview.srno}' },
            success : function(result) {
                if (result == true) {
                    var html = '<button type="button" id="lbm-btn-' + lbmno + '" class="btn btn-secondary float-right"';
                        html += 'onclick="removeFromSrAlbum(' + lbmno +')">보관취소</button>';
                    $('#lbm-btn-' + lbmno).replaceWith(html);
                    commonAlert('success', '앨범에 등록되었습니다.');
                } else {
                    commonAlert('error', '문제가 발생하였습니다.');
                }
            }, 
            statusCode: {
                401: function() {
                    commonAlert('info', '세션이 종료되었습니다.');
                    location.reload();
                }
            }
        });
    }
    
    function removeFromSrAlbum(lbmno) {
        $.ajax({
            url : "/app/sceneReview/deleteFromSrAlbum",
            type: "post",
            data : { "lbmno" : lbmno,
                     "srno" : '${sceneReview.srno}' },
            success : function(result) {
                if (result == true) {
                    var html = '<button type="button" id="lbm-btn-' + lbmno + '" class="btn btn-primary float-right"';
                        html += 'onclick="addToSrAlbum(' + lbmno + ')">보관하기</button>';
                    $('#lbm-btn-' + lbmno).replaceWith(html);
                    commonAlert('success', '앨범에서 삭제되었습니다.');
                } else {
                    commonAlert('error', '문제가 발생하였습니다.');
                }
            }, 
            statusCode: {
                401: function() {
                    commonAlert('info', '세션이 종료되었습니다.');
                    location.reload();
                }
            }
        });
    }
    
    /* ========== 좋아요 관련  ========== */
    function addLike() {
        $.ajax({
            url : "/app/sceneReview/addLike",
            type: "post",
            data : { "srno" : '${sceneReview.srno}' },
            success : function(data) {
                $('span[id^="btn-heart-"]').hide();
                $('span#btn-heart-full').show();
                commonAlert('success', '좋아요 처리되었습니다.');
            },
            error : function(jqXHR, status, error) {
                if (status == 401) {
                    commonAlert('info', '로그인이 만료되었습니다.');
                } else {
                    commonAlert('문제가 발생하였습니다.');
                }
            }, 
            statusCode: {
                401: function() {
                    commonAlert('info', '세션이 종료되었습니다.');
                    location.reload();
                }
            }
        });
    }
    
    function cancelLike() {
        $.ajax({
            url : "/app/sceneReview/cancelLike",
            type: "post",
            data : { "srno" : '${sceneReview.srno}' },
            success : function(data) {
                $('span[id^="btn-heart-"]').hide();
                $('span#btn-heart-empty').show();
                commonAlert('success', '좋아요 취소되었습니다.');
                console.log
            },
            error : function(jqXHR, status, error) {
                commonAlert('문제가 발생하였습니다.');
            }, 
            statusCode: {
                401: function() {
                    commonAlert('info', '세션이 종료되었습니다.');
                    location.reload();
                }
            }
        });
    }
    
    /* ========= 신고관련 ========= */
    function reportSceneReview() {
        var reportTypeArr = [];
        for (i = 0; i<reportForm.reportType.length; i++) {
            if (reportForm.reportType[i].checked) {
                reportTypeArr.push(reportForm.reportType[i].value);
            }
        }
        
        if (reportTypeArr.length == 0) {
            commonAlert('error', '신고 사유를 1개 이상 선택해 주세요.');
            return;
        }
        
        $.ajax({
            url : "/app/report/add",
            type: "post",
            headers : {
                'Content-Type': 'application/json'
            },
            data : JSON.stringify({ 
                "url" : '/app/sceneReview/review?mvno=${sceneReview.mvno}&srno=${sceneReview.srno}',
                "types" : reportTypeArr,
                "cont" : $('#reportModal textarea[name="cont"]').val(),
                "target" : '${sceneReview.srno}'
            
            }),
            success : function(data) {
                if (data) {
                    commonAlert('success', '신고되었습니다.');
                    $('a#btn-siren').remove();
                } else {
                    commonAlert('error', '문제가 발생하였습니다. <br>관리자에게 문의해주세요.');
                }
                    
            },
            complete : function() {
                $('#reportModal').modal('hide');
            }, 
            statusCode: {
                401: function() {
                    commonAlert('info', '세션이 종료되었습니다.');
                    location.reload();
                }
            }
        });
    }
    
    function deleteSceneReview() {
        $.ajax({
            url : "/app/sceneReview/delete",
            type: "post",
            data : {
                "srno" : '${sceneReview.srno}'
            },
            success : function(data) {
                if (data) {
                    commonAlert('error', '삭제되었습니다.');
                } else {
                    commonAlert('error', '삭제 중 문제가 발생하였습니다. <br>관리자에게 문의해주세요.');
                }
            },
            complete : function() {
                goToSceneReview('${sceneReview.mvno}');
            }, 
            statusCode: {
                401: function() {
                    commonAlert('info', '세션이 종료되었습니다.');
                    location.reload();
                }
            }
        });
    }
    
    </script>
</body>
</html>