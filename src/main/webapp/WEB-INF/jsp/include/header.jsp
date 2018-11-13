<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ include file="top.jsp" %>
  <header>
      <!-- Fixed navbar -->
      <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <a class="navbar-brand" href="#">Fixed navbar</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
          
          <form action="searchResult" method="get" class="form-inline mt-2 mt-md-0">
            <input class="form-control mr-sm-2 ui-autocomplete-input ui-autocomplete-loading" type="text" placeholder="Search" aria-label="Search" 
          name="keyword">
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
          </form>
          
          <c:choose>
            <c:when test="${not empty sessionScope.loginUser}">
                <a class="nav-link" href="#" onclick="logoutKakao()">${sessionScope.loginUser.nickname}</a>
            </c:when>
            <c:otherwise>
                <a class="nav-link" id="login-btn" href="javascript:loginWithKakao()">Account</a>
            </c:otherwise>
          </c:choose> 
        </div>
      </nav>
    </header>