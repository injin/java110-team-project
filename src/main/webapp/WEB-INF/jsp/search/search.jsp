<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        var keyword = '${keyword}';
        var totalResults = '${totalResults}'
        var clickCount = 0;
        var count = 0;
        var total = 0;
        var movieFooter = document.getElementById('showAllMovies');
/*         var h = document.getElementsByClassName('hi')[1];

        h.style.visibility = "hidden";
 */
 
        
        for (var i = 0; i < 3; i++) {
            var movieFrame = document.getElementsByClassName('movieFrame')[i];
            console.log(movieFrame);
            movieFrame.style.display="block";
            
            if(${totalResults}<=3){
                movieFooter.style.visibility = "hidden";
    
            }
        }
 
 
 
 
        
        function showMore() {
            
            console.log(${totalResults});
            if(${totalResults}>20){
                total = 20;
            }
             for (var i = 3; i < 20; i++) {
                var movieFrame = document.getElementsByClassName('movieFrame')[i];
                movieFrame.style.display="block";
            } 
             
             movieFooter.style.visibility = "hidden";
     
        }
/*             count++;

            if (count == 1) {

                alert('count==1');

                /*            var movieList = new Array();
                           var j= 3;

                           <c:forEach items="${movieList}" var="movie">
                           movieList.push({
                               title: '${movie.title}',
                               popularity: ${movie.popularity},
                               img: '${imgPrefix}'+'/'+'${movie.posterPath}'
                           });
                           </c:forEach>

                           document.getElementById('showAllMovies').onclick = function () 
                           {
                               if(j==20) return;
                               console.log(movieList);
                               for(var i=j; i=j+3; i++)
                                   {
                                    document.getElementById('')
                                   }
                               j += 3; 
                           }; 
                 
            } else {
                alert('count==2')
                //getMovieList(this);
            } */

        

        function getMovieList(input) {
            var values = []; //ArrayList 값을 받을 변수를 선언
            console.log(keyword);
            console.log(totalResults);
            //검색할 코드를 넘겨서 값을 가져온다.      
            $.ajax("/app/movieInfo/listByKeyword", {
                method : "POST",
                headers : {
                    'Content-Type' : 'application/json;'
                },
                data : JSON.stringify({
                    "keyword" : keyword,
                    "page" : count
                }),
                success : function(result) {
                    if (result.movieList.length != 0) { //controller에서 넘겨준 성공여부 코드

                        values = result.movieList; //java에서 정의한 ArrayList명을 적어준다.

                        $.each(values, function(index, value) {
                            console.log(index + " : " + value.title); //MovieInfoController.java 의 변수명을 써주면 된다.
                        });

                        alert("성공");
                    } else {
                        alert("실패");
                    }
                }
            });
        }
    </script>
</body>
</html>