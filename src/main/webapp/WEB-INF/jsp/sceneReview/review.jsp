<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    
</style>
</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>


    <main role="main" class="container borderGray">
        <div class="row">
            <div class="col-12" id="movie-cover" style="background-image: url(${sceneCover.coverImg})">
                <div id="movie-content">
                    <div id="movie-title">
                        <h3><b>${tmdbMovie.title}</b>
                            <c:if test="${not empty sessionScope.loginUser}">
                            <a href="#" data-toggle="modal" data-target="#srAddModal" class="btn-pencil" ><img src="/img/btn-pencil.png"></a>
                            </c:if>
                        </h3>
                        <p>(${tmdbMovie.releaseDate})</p>
                    </div>
                    
                    <div id="movie-genres">
                        <c:forEach items="${tmdbMovie.genres}" var="genre">
                            <div class="genre-tag">${genre.name}</div>
                        </c:forEach>
                    </div>
                    
                </div>
            </div>
        </div>
        
        
    <%-- <button type="button" class="btn btn-primary" data-toggle="modal"
            data-target="#reportModal">신고하기</button>
    <jsp:include page="../report/report.jsp"></jsp:include> --%>
    
    <%@ include file="addPopup.jsp" %>
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript">
    
    /* 모달 관련  */
    var $modal = $('#srAddModal').modal({show : false});
    $modal.on('hide.bs.modal', function(e) {
        $('form#srAddForm input').val('');
    });
    
    /* 슬라이드 관련 */
    $('#srTimeSlider').on('input', function() {
        var sec_num = parseInt(this.value, 10);
        var hours   = Math.floor(sec_num / 3600);
        var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
        var seconds = sec_num - (hours * 3600) - (minutes * 60);

        if (hours   < 10) {hours   = "0"+hours;}
        if (minutes < 10) {minutes = "0"+minutes;}
        if (seconds < 10) {seconds = "0"+seconds;}
        $('#srTime').val(hours+':'+minutes+':'+seconds);
    });
    
    function addSceneReview() {
        
        if (validateForm() == false)
            return;
        
        // 장면 시간 초단위 세팅
        var srTimeVal = $('#srTime').val();
        var hourVal = parseInt(srTimeVal.substring(0, 2));
        var minuteVal = parseInt(srTimeVal.substring(3, 5));
        var secondVal = parseInt(srTimeVal.substring(6, 8));
        $('input[name="time"]').val(hourVal*3600 + minuteVal*60 + secondVal);
        
        // 스포 여부
        $('input[name="spo"]').val($('#tfSpo').prop('checked')? 'Y': 'N');
        
        $('form#srAddForm').submit();
    }
    
    function validateForm() {
        
        // 장면 시간 검사
        var srTimeVal = $('#srTime').val();
        var pattern = /[0-9]{2}:[0-9]{2}:[0-9]{2}/gi;
        if (!(pattern.test(srTimeVal))) {
            alert('장면 시간 형식에 맞게 입력해 주세요(시:분:초)');
            return false;
        }
        
        // 장면제목
        var titleVal = $('input[name="title"]').val();
        if (titleVal == null) {
            alert('장면제목을 입력해 주세요');
            return false;
        }
        
        // 장면내용
        var contVal = $('textarea[name="cont"]').val();
        if (contVal == null) {
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
    
    </script>
</body>
</html>