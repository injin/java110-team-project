<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<h2>신고목록</h2>

<table class="table">
	<thead>
		<tr>
			<th scope="col">신고번호</th>
			<th scope="col">신고자</th>
			<th scope="col">신고링크</th>
			<th scope="col">신고날짜</th>
			<th scope="col">처리여부</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${findAll}" var="report">
			<tr>
				<td>${report.rptno}</td>
				<td>${report.nick}</td>
				<td><a href="${report.url}">${report.url}</a></td>
				<td>${report.createdDate}</td>
				   <c:choose>
					<c:when test="${report.hndl eq false}">
						 <td>미처리</td>
						</c:when>
						<c:otherwise>
							<td>처리</td>
						</c:otherwise>
				    </c:choose>
			</tr>
			<tr>
			  <td></td>
			  <td></td>
			  <td>${report.cont}</td>
			  <td></td>
			  <td></td>
			</tr>
		</c:forEach>
	</tbody>
</table>
