<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>가져온 영화 정보</h3>

${movieName}<br>
${genreList}<br>
${posterPath}<br><hr>
${movieName2}<br>
${genreList2}<br>
${posterPath2}<br>
${getImages}<br>
${getCredits}<br>
${getSimilarMovies}<br>

<img src="https://image.tmdb.org/t/p/w300_and_h450_bestv2/${posterPath}">

</body>
</html>