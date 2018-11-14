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

.card-flwprofile{
    position: relative;
    display: flex;
    flex-direction: column;
    min-width: 0;
    word-wrap: break-word;
    background-color: #fff;
    background-clip: border-box;
    border: 1px solid rgba(0, 0, 0, 0.125);
    border-radius: 0.25rem;
    margin: 0.5rem;
    margin-right: -1rem;
}

.flwcover{
  width : 900px;
  height: 100%;
  padding-left: 30px;
  padding-right: 50px;
  display: contents;
 }
 
.left {
  
  float: left;
  width: 30%;
  height : 100%;
  
}

.col-md-flwprofile{
  position: relative;
 
  min-height: 1px;
 
}

.right {
    display: inline-block;
    float: left;
    width: 16rem;
    height: 90%;
    border: 1px solid black;
    text-align: center;
}

.card-body-flwprofile {
    flex: 1 1 auto;
    padding: 0.75rem;
}

.profileflw{
  display: inline-block;
  width: 90%;
  height: 90%;
  border-radius: 100%;
}

.text {
  font-weight: bold;
  font-size: 30px;
  
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
		<div class="flwcover">
			<c:forEach items="${flwlist}" var="flw">
				<div class="card-flwprofile w-50">
					<div class="card-body-flwprofile">
						<div class='col-md-flwprofile left'>
							<c:choose>
								<c:when test="${not empty flw.profileImage}">
									<img class="profileflw" src="/img/default-profile-img" />
								</c:when>
								<c:otherwise>
									<img class="profileflw" src="/img/default-profile-img" />
								</c:otherwise>
							</c:choose>
						</div>
						<div class ="right">
						<p class="card-text text">${flw.nickname}</p>
						<a href="#" class="btn btn-primary">Button</a>
						</div>
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