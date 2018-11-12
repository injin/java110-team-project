<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log리스트 불러오기</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="starability-all.min.css">
<link rel="stylesheet"
    href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
    integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
    crossorigin="anonymous">
<link rel='stylesheet' href='/css/writingIlsang.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/starrr.css'>
<style>
.test {
    width: 50px;
    height: 50px;
}

table {
    border: 1px solid black;
}

table td {
    border: 1px solid red;
}
</style>
</head>
<body>
<jsp:include page="include/header.jsp"></jsp:include>

    <main role="main" class="container">

    <div>
        <table>
            <tr>
                    <td>로그번호</td>
                    <td>회원이름</td>
                    <td>직접대상</td>
                    <td>간접대상</td>
                    <td>행위</td>
                    <td>url</td>
                    <td>날짜</td>
            </tr>
            <c:forEach var="l" items="${list}">
                <tr>
                    <td>${l.lgno}</td>
                    <td>${l.mno }</td>
                    <td>${l.direct }</td>
                    <td>${l.indirect }</td>
                    <td>${l.act }</td>
                    <td>${l.url }</td>
                    <td>${l.createdDate }</td>
                </tr>
            </c:forEach>
        </table>
        
        <c:forEach var="log" items="${list}">
            <p>${log.text}</p>
        </c:forEach>
        

    </div>
<jsp:include page="include/footer.jsp"></jsp:include>

    <script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/starrr.js"></script>
    <script src="/js/common.js"></script>
    <script src="/js/writingIlsang.js"></script>
    <script type="text/javascript">
        $('.starrr').starrr();
    </script>
</body>
</html>