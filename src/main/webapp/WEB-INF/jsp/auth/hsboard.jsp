<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="add" method="post" enctype="multipart/form-data">
<div id=name>
<label>이름:</label>
<input type="text" name="name" id="name"> <br>
</div>

<div id=type>
<label>타입:</label>
<label for="eat">음식</label>
<input type="radio" name="type" id="eat" value="et" checked>
<label for="trip">여행</label>
<input type="radio" name="type" id="trip" value="tr">
<label for="shop">쇼핑</label>
<input type="radio" name="type" id="shop" value="sh">
</div>

<div id=area>
<label for="cont">내용:</label>
<textarea rows="5" cols="50" name="cont" ></textarea>
</div>

<div id=upload>
<label>파일</label>
<input type="file" name="phot" id="file1">

</div>

<input type="submit" value="확인"> <input type="reset" value="취소">

</form>


</body>
</html>