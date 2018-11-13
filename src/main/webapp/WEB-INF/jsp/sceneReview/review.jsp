<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/report.css'>
<link rel='stylesheet' href='/css/common.css'>
<style>
    #movie-cover {
        width: 100%;
        height: 500px;
        background-size: cover;
        border-bottom: 1px solid #ccc;
    }
    #movie-title {
        width: 300px;
        height: 100px;
        background-color: rgba(255, 256, 255, 0.3);
        padding: 8px 10px;
        margin-top: 20px;
        margin-left: 10px;
        float: left;
        display: inline-block;
    }
    #movie-genres {
        width: 80px;
        display: inline-block;
        float: right;
        margin-top: 20px;
    }
    .genre-tag {
        border : 1.5px solid #00cca3;
        font-weight: bold;
        line-height: 1.8em;
        color: #00cca3;
        margin-top: 5px;
        border-radius: 20px;
        text-align: center;
        background-color: rgba(255, 256, 255, 0.2);
    }
    a.btn-pencil > img {
        width: 38px; height: 38px;
        margin-top: -8px;
    }
    
</style>
</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>


    <main role="main" class="container">
        
        <div class="row">
            <div class="col-12" id="movie-cover" style="background-image: url(${sceneCover.coverImg})">
                <div id="movie-content">
                    <div id="movie-title">
                        <h3><b>${tmdbMovie.title}</b>
                            <c:if test="${not empty sessionScope.loginUser}">
                            <a href="#" class="btn-pencil" id="btn-add-scene"><img src="/img/btn-pencil.png"></a>
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
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript">
    
    // 등록 버튼 클릭시
    $('#btn-add-scene').click(() => {
        alert('등록 모달 오픈');
        
    });
    
    
    </script>
</body>
</html>