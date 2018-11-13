<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${hs}
<form action="update" method="post" enctype="multipart/form-data">
<input type="hidden" name="no" value="${hs.no}" />
<div id=name>
<h2>수정창</h2>
<label>이름:</label>
<input type="text" name="name" id="name" value="${hs.name}"> <br>
</div>

<div id=type>


    <label>타입:</label>
    
    <label for="eat">음식</label>
    <input type="radio" name="type" id="eat" value="et"  <c:if test="${hs.type eq 'et'}">checked</c:if>>
    <label for="trip">여행</label>
    <input type="radio" name="type" id="trip" value="tr" <c:if test="${hs.type eq 'tr'}">checked</c:if>>
    <label for="shop">쇼핑</label>
    <input type="radio" name="type" id="shop" value="sh" <c:if test="${hs.type eq 'sh'}">checked</c:if>>



</div>

<div id=area>
<label for="cont">내용:</label>
<textarea rows="5" cols="50" name="cont">${hs.cont}</textarea>
</div>

<div id=upload>
<label>파일</label>
<input type="file" name="phot" id="file1">

</div>

<input type="submit" value="확인"> <input type="reset" value="취소">

</form>


</body>
</html>