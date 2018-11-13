<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>follow</title>
<link rel='stylesheet' href='/css/follow.css'>
</head>
<body>
     
<!--     <table>
     <tr><td>나의 피드</td><td>정보수정</td><td>통계</td><td>팔로우</td><td>활동로그</td><td>장면보관함</td></tr>
    </table> -->

	<table>
		<thead>
			<tr>
				<th>회원번호</th>
				<th>팔로워번호</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${list}" var="follow">
				<tr>
					<td>${follw.no}</td>
					<td>${follow.fno}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>