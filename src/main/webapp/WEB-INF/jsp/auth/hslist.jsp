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
.test {
    width: 50px;
    height: 50px;
    
}
table {
  border:1px solid black;
}
table td {
    border: 1px solid red;
}
</style>
</head>
<body>

<div>
<label>불러와땅</label>
    <table>
     <tr>
           <td> 번호</td>
           <td> 이름</td>
           <td> 타입</td>
           <td> 내용</td>
           <td> 이미지</td>
           <td> 삭제 </td>
        </tr>
    <c:forEach var="item" items="${list}" >
       <tr>
           <td>${item.no} </td>
            <td>
               <a href='hsdetail?no=${item.no}'> ${item.name}</a>
            </td>
           <td>${item.type}</td>
           <td>${item.cont}</td>
           <td> 
                <c:choose>
                    <c:when test="${not empty item.phot}">
                        <img class="test" src='/upload/${item.phot}'>
                    </c:when>
                    <c:otherwise>
                        
                    </c:otherwise>
                </c:choose>
            </td>
            
        </tr>
        
    </c:forEach>
    </table>
</div>

</body>
</html>