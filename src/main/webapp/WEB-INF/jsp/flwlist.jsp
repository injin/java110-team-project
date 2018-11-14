<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>follow</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>

<style>

.outer {
  display : inline-block;
  width : 400px;
  height: 150px;
}

.left {
  
  float: left;
  width: 30%;
  height : 100%;
}

.right {
  float: right;
  width: 70%;
  height : 100%;
}

.inner_container
{
   display: table-cell;
   text-align :center;
   margin: 0 auto;
}

.profileflw{
  display: inline-block;
  width: 90%;
  height: 90%;
  border-radius: 100%;
}

.text {
  
  font-weight: bold;
  font-size: 35px;
  padding-top: 15px;
  padding-bottom: 5px; 
}

.flwbutton{
 text-align :center;
}

.cover{
  width : 900px;
  height: 500px;
 }

</style>


</head>
<body>
      
   <jsp:include page="include/header.jsp"></jsp:include>

	
<div class ="row">
<div class ="cover">	
<div class ="outer ">
<div class='left'><img class="profileflw" src="/img/btn-pencil.png"/></div>
<div class='right inner_container'><label class="text">디자인 안습..</label><br><button class="btn btn-lg btn-primary ">팔로우&raquo;</button></div>
</div>
<div class ="outer ">
<div class='left'><img class="profileflw" src="/img/btn-pencil.png"/></div>
<div class='right inner_container'><label class="text">디자인 안습..</label><br><button class="btn btn-lg btn-primary ">팔로우&raquo;</button></div>
</div>
<div class ="outer ">
<div class='left'><img class="profileflw" src="/img/btn-pencil.png"/></div>
<div class='right inner_container'><label class="text">디자인 안습..</label><br><button class="btn btn-lg btn-primary ">팔로우&raquo;</button></div>
</div>
<div class ="outer ">
<div class='left'><img class="profileflw" src="/img/btn-pencil.png"/></div>
<div class='right inner_container'><label class="text">디자인 안습..</label><br><button class="btn btn-lg btn-primary ">팔로우&raquo;</button></div>
</div>
<div class ="outer ">
<div class='left'><img class="profileflw" src="/img/btn-pencil.png"/></div>
<div class='right inner_container'><label class="text">디자인 안습..</label><br><button class="btn btn-lg btn-primary ">팔로우&raquo;</button></div>
</div>
</div>
</div>
	<!--     <table>
     <tr><td>나의 피드</td><td>정보수정</td><td>통계</td><td>팔로우</td><td>활동로그</td><td>장면보관함</td></tr>
    </table> -->
    
<%--     
<form action="list" method="post" enctype="multipart/form-data">
        <table class="#">
            <tbody>
                <c:forEach items="${flwlist}" var="flw">
                    <tr>
                        <td>${flw.flw}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
           
    </form> --%>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/common.js"></script>
	
</body>
</html>