<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log리스트 불러오기</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
    crossorigin="anonymous">

<style>
main {
    padding-top: 20px;
}
</style>
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main" class="container">

    <div class="row">
        <div class="col-lg-2 col-md-4 col-sm-12">
            <div class="input-group mb-3">
                <select class="custom-select" id="logType">
                    <option value="mp" selected>영화리뷰</option>
                    <option value="dp">일상리뷰</option>
                    <option value="sr">장면리뷰</option>
                    <option value="pc">게시물 댓글</option>
                    <option value="sc">장면리뷰 댓글</option>
                    <option value="fr">친구</option>
                </select>
            </div>
        </div>
    </div>

    <div>
            <div class="logList" id="list-mp">
                <h4>영화리뷰 로그</h4>
                <ul class="list-group">
                <c:forEach var="log" items="${list}">
                    <c:if test="${log.direct eq 'mp'}">
                        <%-- ${log.text} --%>
                        <a href="#" class="list-group-item list-group-item-action">${log.text}</a>
                    </c:if>
                </c:forEach>
                </ul>
            </div>
            <div class="logList" id="list-dp">
                <h4>일상리뷰 로그</h4>
                <c:forEach var="log" items="${list}">
                    <c:if test="${log.direct eq 'dp'}">
                        <a href="#" class="list-group-item list-group-item-action">${log.text}</a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="logList" id="list-sr">
                <h4>장면리뷰 로그</h4>
                <c:forEach var="log" items="${list}">
                    <c:if test="${log.direct eq 'sr'}">
                        <a href="${log.url}" class="list-group-item list-group-item-action">${log.text}</a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="logList" id="list-pc">
                <h4>게시물 댓글</h4>
                <c:forEach var="log" items="${list}">
                    <c:if test="${log.direct eq 'pc'}">
                        <a href="#" class="list-group-item list-group-item-action">${log.text}</a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="logList" id="list-sc">
                <h4>장면리뷰 댓글</h4>
                <c:forEach var="log" items="${list}">
                    <c:if test="${log.direct eq 'sc'}">
                        <a href="#" class="list-group-item list-group-item-action">${log.text}</a>
                    </c:if>
                </c:forEach>
            </div>
            <div class="logList" id="list-fr">
                <h4>친구</h4>
                <c:forEach var="log" items="${list}">
                    <c:if test="${log.direct eq 'fr'}">
                        <a href="#" class="list-group-item list-group-item-action">${log.text}</a>
                    </c:if>
                </c:forEach>
            </div>
    </div>

    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>

    <script type="text/javascript">
        // 기본으로 게시물 목록만 보여줌
        var initType = $('#logType').val();
        showSelectedLogList(initType);

        function showSelectedLogList(logType) {
            $('.logList').hide();
            $('#list-' + logType).show();
        }

        $('#logType').on('change', function() {
            var selectedLogType = $('#logType').val();
            showSelectedLogList(selectedLogType);
        });

        /* document.getElementById('logType').onchange = function() {
            alert('js 셀렉트 박스 변경하셨네요');
        }; */
    </script>
</body>
</html>