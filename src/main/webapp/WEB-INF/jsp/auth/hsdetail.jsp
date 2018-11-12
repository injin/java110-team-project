<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, td {
    border: 1px solid gray;
}
#photo-image {
    height: 100px;
}
</style>
</head>
<body>
<h1>상세정보(MVC)</h1>
<table>
<tbody>
<tr><th>번호</th><td>${hs.no}</td></tr>
<tr><th>이름</th><td>${hs.name}</td></tr>
<tr><th>이메일</th><td>${hs.type}</td></tr>
<tr><th>암호</th><td>${hs.cont}</td></tr>
<tr>
<th>사진</th>
<c:choose>
<c:when test="${not empty hs.phot}">
    <td><img id='photo-image' src='/upload/${hs.phot}'></td>
</c:when>
<c:otherwise>
    
</c:otherwise>
</c:choose>
</tr>
</tbody>
</table>
<button type='button' onclick='change()'>수정</button>
<button type='button' onclick='remove()'>삭제</button>
<script>
function change() {
    location.href = 'change?no=${hs.no}'
}
function remove() {
    location.href = 'delete?no=${hs.no}'
}
</script>
</body>
</html>