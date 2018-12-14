<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<footer class="footer page-footer font-small stylish-color-dark bg-dark text-white">
  <!-- Footer -->
    <!-- Footer Links -->
    <div class="container text-center text-md-left">
      <!-- Grid row -->
      <div class="row">
        <!-- Grid column -->
        <div class="col-md-4 mx-auto">
          <!-- Content -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Scene Cok</h5>
<pre class="text-light mt-3 mb-4">
DISCOVER AND SHARE
a constantly expanding
Movie Around The World
</pre>
        </div>
        <!-- Grid column -->
        <hr class="clearfix w-100 d-md-none">
        <hr class="clearfix w-100 d-md-none">
        <!-- Grid column -->
        <div class="col-md-2 mx-auto">
          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>
          <ul class="list-unstyled">
            <li>
              <a href="<c:url value='/app/'/>">홈</a>
            </li>
            <li>
              <a href="<c:url value='/app/reviewFeed/list'/>">전체 피드</a>
            </li>
          </ul>
        </div>
        <!-- Grid column -->
        <hr class="clearfix w-100 d-md-none">
        <div class="col-md-2 mx-auto">
          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>
          <ul class="list-unstyled">
            <li>
              <a href="#!">나의 피드</a>
            </li>
            <li>
              <a href="<c:url value='/app/rcmd/list'/>">영화 추천</a>
            </li>
          </ul>
        </div>
        <!-- Grid column -->
        <div class="col-md-2 mx-auto">
          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">POWERED BY</h5>
          <ul class="list-unstyled">
            <li>
              <a href="<c:url value='https://www.themoviedb.org/documentation/api'/>">
                <img alt="The Movie DB" style="height: 35px;" src="https://www.themoviedb.org/assets/1/v4/logos/408x161-powered-by-rectangle-green-bb4301c10ddc749b4e79463811a68afebeae66ef43d17bcfd8ff0e60ded7ce99.png">
              </a>
            </li>
            <li>
              <a href="<c:url value='https://github.com/injin/java110-team-project'/>">GitHub</a>
            </li>
          </ul>
        </div>
        <!-- Grid column -->
      </div>
      <!-- Grid row -->
    </div>
    <!-- Footer Links -->
    <!-- Call to action -->
    <c:choose>
        <c:when test="${ empty sessionScope.loginUser}">
            <ul class="list-unstyled list-inline text-center">
              <li class="list-inline-item">
                <h5 class="mb-1">Register with KAKAO</h5>
              </li>
              <li class="list-inline-item">
                <a href="javascript:loginWithKakao()" class="btn btn-rounded btn-outline-primary btn-sm my-2 my-sm-0">Sign up!</a>
              </li>
            </ul>
        </c:when>
    </c:choose>
    <!-- Call to action -->
    <!-- Copyright -->
    <div class="footer-copyright text-center pb-3">© 2018 Copyright:
      <a href="<c:url value='/app/'/>">scenecok.com</a>
      <br>
      <br>위 내용에 대한 저작권 및 법적 책임은 자료 제공사 또는 글쓴이에게 있으며,
      <br><b>씬콕</b>의 입장과 다를 수 있습니다.
    </div>
    <!-- Copyright -->
<!-- Footer -->
</footer>