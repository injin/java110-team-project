<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/fontawesome.css'>
<link rel='stylesheet' href='/css/album.css'>
<link rel='stylesheet' href='/css/all.css'>

<style>
.profile-img {
    width: 5em;
    height: 5em;
    border-radius: 3rem;
    float: left;
}

.btn-size {
    padding: 0.1rem 0.3rem;
}

.container-size {
    margin-left: 200px;
    margin-right: 200px;
}
</style>

<script
    src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="bgGray">

    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main" class="container">
        <div class="col-lg-12">
    <div class="row flex-xl-nowarp">
            <div class="col-lg-3">
                <form action="flwlist" method="post" enctype="multipart/form-data">
                    <img class="card-img-top" src="${loginUser.profileImagePath}"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">${loginUser.nickname}</h5>
                        <p class="card-text">Some quick example text to build on the
                            card title and make up the bulk of the card's content.</p>
                    </div>
                </form>
            </div>

            <div class="col-lg-9 ">
                <div class="jumbotron">
                    <h1>Navbar example</h1>
                    <p class="lead">This example is a quick exercise to illustrate
                        how fixed to top navbar works. As you scroll, it will remain fixed
                        to the top of your browser's viewport.</p>
                    <a class="btn btn-lg btn-primary" role="button">View navbar
                        docs &raquo;</a>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../sceneAlbum/sceneAlbumList.jsp"></jsp:include>
    <jsp:include page="../sceneAlbum/albumPopup.jsp"></jsp:include> 
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/common.js"></script>

    <script>
    function albumDetail(lbmTitle){
    	//alert(lbmTitle);
    	console.log(lbmTitle);
    	$('#detailForm input[name="lbmTitle"]').val(lbmTitle);
    	$('#detailForm').submit();
    	
    }    
    </script>


</body>
</html>