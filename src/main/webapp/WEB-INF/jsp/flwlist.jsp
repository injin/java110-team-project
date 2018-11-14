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
  padding-top: 10px;

}

.flwbutton{
 text-align :center;
}

.cover{
  width : 900px;
  height: 500px;
  padding-left: 20px;
 }

</style>


</head>
<body>
      
   <jsp:include page="include/header.jsp"></jsp:include>

	<main role="main" class="container">
	<div class="jumbotron">
		<h1>Navbar example</h1>
		<p class="lead">This example is a quick exercise to illustrate how
			fixed to top navbar works. As you scroll, it will remain fixed to the
			top of your browser's viewport.</p>
		<a class="btn btn-lg btn-primary" role="button">View navbar docs
			&raquo;</a>
	</div>
	<div class="row">
		<div class="cover">
			<c:forEach items="${flwlist}" var="flw">
				<div class="outer ">
					<div class='left'>
						<img class="profileflw" src="/upload/profile/${flw.profileImage}" />
					</div>
					<div class='right inner_container'>
						<label class="text">${flw.nickname}</label><br>
						<button class="btn btn-lg btn-primary ">팔로우&raquo;</button>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	</main>






	<%-- <form action="flwlist" method="post" enctype="multipart/form-data">
        <table class="#">
            <tbody>
                <c:forEach items="${flwlist}" var="flw">
                    <tr>
                        <td>${flw.mno}</td>
                        <td>${flw.nickname}</td>
                        <td>${flw.profileImage}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </form>
 --%>
	
</body>
</html>