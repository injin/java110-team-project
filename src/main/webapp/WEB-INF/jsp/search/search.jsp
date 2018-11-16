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
<link rel='stylesheet' href='/css/card.css'>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="bgGray">

	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container" style="margin: 0 auto;"> <jsp:include
		page="searchResult.jsp"></jsp:include> </main>

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