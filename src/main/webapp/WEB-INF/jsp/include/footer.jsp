<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="/js/bootstrap.bundle.js"></script>
    <script src="/js/common.js"></script>
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
          <P>DISCOVER AND SHARE</P>
          <P>a constantly expanding</P>
          <P>Movie Around The World</P>
          
<!-- 
<pre>
DISCOVER AND SHARE
a constantly expanding
Movie Around The World
</pre>
 -->

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
              <a href="#!">Link 1</a>
            </li>
            <li>
              <a href="#!">Link 2</a>
            </li>
            <li>
              <a href="#!">Link 3</a>
            </li>
            <li>
              <a href="#!">Link 4</a>
            </li>
          </ul>

        </div>
        <!-- Grid column -->

        <hr class="clearfix w-100 d-md-none">

        <!-- Grid column -->
        <div class="col-md-2 mx-auto">

          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Links</h5>

          <ul class="list-unstyled">
            <li>
              <a href="#!">Link 1</a>
            </li>
            <li>
              <a href="#!">Link 2</a>
            </li>
            <li>
              <a href="#!">Link 3</a>
            </li>
            <li>
              <a href="#!">Link 4</a>
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
      <a href="http://localhost:8888/app/"> MovieInSta.com</a>
      <br>
      <br>위 내용에 대한 저작권 및 법적 책임은 자료 제공사 또는 글쓴이에 있으며,
      <br>MovieInSta의 입장과 다를 수 있습니다.
    </div>
    <!-- Copyright -->

<!-- Footer -->
</footer>