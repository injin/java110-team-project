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
<link rel="stylesheet" href="/css/all.css">
<link rel='stylesheet' href='/css/fontawesome.css'>
<link rel='stylesheet' href='/css/card.css'>
<link rel='stylesheet' href='/css/starrr.css'>
<style>
.wPost {
    background: white;
    padding: 1rem 1rem 0 1rem;
    border-radius: 0.5rem;
    box-shadow: 7px 7px 30px -5px rgba(0, 0, 0, 0.1);
    margin-bottom: 0.5rem;
}

.btmIcon {
    padding: 0 0.4rem 1rem 1rem;
    font-size: 1.3rem;
    vertical-align: sub;
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
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="bgGray">

	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container" style="margin: 0 auto;"> <jsp:include
		page="searchResult.jsp"></jsp:include>
        
        <a class="return-top" href="#" >
        <img src="/img/top-btn.png"  width="50" height="50"></a>
    </main>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>
	<script type="text/javascript">
	
        //console.log('${movieList}');

        // 페이지가 1개뿐일 경우 =>처리해줘야함
        
        var totalCount = 0;
        var movieFooter = document.getElementById('showAllMovies');
        var memberFooter = document.getElementById('showAllMembers');
        var tagFooter = document.getElementById('showAllTags');
        var frame;
        
        function showMore(input, type) {
            
            console.log(input);
            if(input>20){
                totalCount = 20;
            }else{
                totalCount = input;
            }
            console.log(type)
            
            if(type == 'mv'){
             for (var i = 3; i < totalCount; i++) {
                frame = document.getElementsByClassName('movieFrame')[i];
                frame.style.display="block";
            } 
             
             movieFooter.style.visibility = "hidden";
            
            }else if(type == 'mb'){
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('memberFrame')[i];
                    frame.style.display="block";
                } 
                 
                 memberFooter.style.visibility = "hidden";
            }else if(type == 'tg'){
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('tagFrame')[i];
                    frame.style.display="block";
                } 
                 
                 tagFooter.style.visibility = "hidden";
            }
            
            
        }
 
    </script>
</body>
</html>