<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>접근 에러</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>

</head>
<body>

    <jsp:include page="../include/header.jsp"></jsp:include>
    
    <main role="main" class="container">
        
        <div class="alert alert-secondary mt-5" role="alert">
          <h4 class="alert-heading">권한 에러!</h4>
          <p>회원 전용 메뉴입니다.<br> 로그인 후 이용해주세요</p>
        </div>
        
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    
    <script type="text/javascript">
    
    
    
    </script>
</body>
</html>