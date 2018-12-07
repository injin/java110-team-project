<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%--

    !! INJIN33님의 잘못된 삽질로 FOOTER가 두개 이기 때문에 수정을 두번 해야함!!

--%>
<footer class="footer page-footer font-small stylish-color-dark pt-4"
        style="color: white; background-color: #343a40 !important;">
  <!-- Footer -->
    <!-- Footer Links -->
    <div class="container text-center text-md-left">
      <!-- Grid row -->
      <div class="row">
        <!-- Grid column -->
        <div class="col-md-4 mx-auto">
          <!-- Content -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">MovieInSta</h5>
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
              <a href="#!">장면 리뷰</a>
            </li>
            <li>
              <a href="#!">장면 앨범</a>
            </li>
            <li>
              <a href="/app/reviewFeed/list">전체 피드</a>
            </li>
            <li>
              <a href="#!">나의 피드</a>
            </li>
            <li>
              <a href="#!">영화 추천</a>
            </li>
          </ul>
        </div>
        <!-- Grid column -->
        <hr class="clearfix w-100 d-md-none">
        <!-- Grid column -->
        <div class="col-md-2 mx-auto">
          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">POWERED BY</h5>
          <ul class="list-unstyled">

            <li>
              <a href="https://github.com/injin/java110-team-project">GitHub</a>
            </li>
            <li>
              <a href="https://developers.kakao.com/">KAKAO API</a>
            </li>
            <li>
              <a href="https://www.themoviedb.org/documentation/api">The MOVIE DB</a>
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
            <hr>
            <ul class="list-unstyled list-inline text-center py-2">
              <li class="list-inline-item">
                <h5 class="mb-1">Register for free</h5>
              </li>
              <li class="list-inline-item">
                <a href="javascript:loginWithKakao()" class="btn btn-rounded btn-outline-primary btn-sm my-2 my-sm-0">Sign up!</a>
              </li>
            </ul>
        </c:when>
    </c:choose>
    <hr>
    <!-- Call to action -->
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
      <a href="http://localhost:8888/app/"> scenenanda.com</a>
      <br>
      <br>위 내용에 대한 저작권 및 법적 책임은 자료 제공사 또는 글쓴이에게 있으며,
      <br><b>인진이와 아이들</b>의 입장과 다를 수 있습니다.
    </div>
    <!-- Copyright -->
<!-- Footer -->
</footer>