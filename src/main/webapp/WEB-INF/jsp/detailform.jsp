<%@ page language="java" 
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보</title>
<style>
table, th, td {
    border: 1px solid gray;
}
</style>

</head>
<body>
    <h1>상세정보</h1>
    <table>
<tbody>
<tr><th>번호</th><td>${ms.no}</td></tr>
<tr><th>이름</th><td>${ms.name}</td></tr>
<tr><th>타입</th><td>${ms.type}</td></tr>
<tr><th>내용</th><td>${ms.cont}</td></tr>
<tr>
<th>사진</th>
<c:choose>
<c:when test="${not empty ms.phot}">
    <td><img id='photo-image' src='/upload/${ms.phot}'></td>
</c:when>
<c:otherwise>
    <td><img id='photo-image' src='/img/anonymous.png'></td>
</c:otherwise>
</c:choose>
</tr>
</tbody>
</table>
<a href ="updateform?no=${ms.no}"><button>수정</button></a>
<button onclick='remove()'>삭제</button>
<script type="text/javascript">

function remove(){
    location.href = 'delete?no=${ms.no}'
}

</script>
</body>
</html>