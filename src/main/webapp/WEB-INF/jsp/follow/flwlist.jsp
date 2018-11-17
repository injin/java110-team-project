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

 .profile-img {
    width: 5em;
    height: 5em;
    border-radius: 3rem;
} 

.btn-size{
    padding: 0.1rem 0.3rem;
}

.container-size {
  margin-left: 200px;
  margin-right : 200px;
}


</style>


</head>
<body>
      
   <jsp:include page="../include/header.jsp"></jsp:include>
 
 <div class="container">
  <div class="row flex-xl-nowarp">
   <div class="col-12 col-md-3 col-xl-3">
   <form action = "flwlist" method ="post" enctype="multipart/form-data">
   <img class="card-img-top" src="${loginUser.profileImagePath}" alt="Card image cap">
    <div class="card-body">
    <h5 class="card-title">${loginUser.nickname}</h5>
    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
    </div>
  </form>
  </div>
  
   <main class ="col-12 col-md-9 col-xl-8">
   <div class="jumbotron">
        <h1>Navbar example</h1>
        <p class="lead">This example is a quick exercise to illustrate how
            fixed to top navbar works. As you scroll, it will remain fixed to the
            top of your browser's viewport.</p>
        <a class="btn btn-lg btn-primary" role="button">View navbar docs
            &raquo;</a>
    </div>
    <div class="row">
    <c:forEach items="${flwlist}" var="flw">
      <div class="col-lg-6 col-md-6 col-sm-12 mb-3">
        <div class="card">
          <div class="card-body">
                <div class="media">
                  <img class="mr-3 profile-img" src="${flw.profileImagePath}" alt="/img/default-profile-img">
                  <div>
                    <h4 class="">${flw.nickname}</h4>
                    <button class="btn btn-primary btn-size" >언팔로우</button>
                  </div>
                </div>
          </div>
        </div>
      </div>
    </c:forEach>
    </div>
   </main>
  </div>
 </div>

</body>
</html>