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
        
        <span>
        ${movie.title}
        ${movie.posterPath}
        </span>
        
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
        $('input[name="srTitle"]').val('');
    });
    
    /* 슬라이드 관련 */
    $('#myRange').on('input', function() {
        var sec_num = parseInt(this.value, 10);
        var hours   = Math.floor(sec_num / 3600);
        var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
        var seconds = sec_num - (hours * 3600) - (minutes * 60);

        if (hours   < 10) {hours   = "0"+hours;}
        if (minutes < 10) {minutes = "0"+minutes;}
        if (seconds < 10) {seconds = "0"+seconds;}
        $('#srTime').val(hours+':'+minutes+':'+seconds);
    });
    
    
    
    </script>
</body>
</html>