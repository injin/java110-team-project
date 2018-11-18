<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력</title>
</head>
<body>
	<h1>입력창</h1>
	<form action='add' method='post' enctype="multipart/form-data">
            이름 <input type='text' name='name'><br> 
		<span><input type='radio' name='type' value="tr" checked>여행 
		<input type='radio' name='type' value="fd">음식
		<input type='radio' name='type'value="sp">쇼핑</span><br>
		<textarea name="cont" rows="4" cols="30" placeholder="내용을 입력하세요"></textarea><br>
		<input type='file' name='file'><br>
		<input type="submit" value="확인"> <input type="reset" value="취소">
	</form>
</body>
</html>
















