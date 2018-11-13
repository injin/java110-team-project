<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력</title>
</head>
<body>
${ms}
    <h1>수정창</h1>
    <form action='update' method='post' enctype="multipart/form-data">
    <input type=hidden name="no" value="${ms.no}">
            이름 <input type='text' name='name' value ="${ms.name}"><br> 
        <span><input type='radio' name='type'  value="tr"<c:if test ="${ms.type eq 'tr'}" >checked</c:if>>여행 
        <input type='radio' name='type' value="fd"<c:if test ="${ms.type eq 'fd'}" >checked</c:if>>음식
        <input type='radio' name='type'  value="sp"<c:if test ="${ms.type eq 'sp'}" >checked</c:if>>쇼핑</span><br>
        <textarea name="cont" rows="4" cols="30">${ms.cont}</textarea><br>
        <input type='file' name='file'><br>
        <input type="submit" value="확인"> <input type="reset" value="취소">
    </form>
</body>
</html>