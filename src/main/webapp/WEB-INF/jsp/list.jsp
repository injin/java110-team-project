<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입력창</title>
<style>
table, th, td {
	border: 1px solid gray;
}
</style>
</head>
<body>
	<form action="list" method="post" enctype="multipart/form-data">
	   <a href="form">추가</a>
		<table>
			<thead>
				<tr>
					<td>번호</td>
					<td>이름</td>
					<td>타입</td>
					<td>내용</td>
					<td>사진</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="ms">
					<tr>
						<td>${ms.no}</td>
						<td><a href="detail?no=${ms.no}">${ms.name}</a></td>
						<td>${ms.type}</td>
						<td>${ms.cont}</td>
						<c:choose>
								<c:when test="${not empty ms.phot}">
									<td><img id='photo-image' src='/upload/${ms.phot}'></td>
								</c:when>
								<c:otherwise>
									<td><img id='photo-image' src='/img/anonymous.png'></td>
								</c:otherwise>
							</c:choose>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</body>
</html>