<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ include file="top.jsp" %>
<header>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
      <a class="navbar-brand" href="#">Home</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav ml-auto mr-2">
        <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="dropdown01" 
                    data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="profile4X4" src="${loginUser.profileImagePath}">
                    ${loginUser.nickname}
                </a>
                <div class="dropdown-menu" aria-labelledby="dropdown01">
                  <a class="dropdown-item" href="#">메뉴1</a>
                  <a class="dropdown-item" href="#">메뉴2</a>
                  <a class="dropdown-item" href="javascript:logoutKakao()">로그아웃</a>
                </div>
              </li>
            </c:when>
            <c:otherwise>
              <li class="nav-item">
                <a class="nav-link" href="javascript:loginWithKakao()">로그인</a>
              </li>
            </c:otherwise>
        </c:choose>
          
        </ul>
        
        <form class="form-inline my-2 my-lg-0">
          <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
        </form>
      </div>
    </nav>
    
</header>
