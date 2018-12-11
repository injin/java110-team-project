<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
    function makeContHtml(cont, index) {
        var text = cont.replace(/[\s]+/g, " ").trim();
        var word = text.split(' ');
        var newHTML = "";
        word.forEach(function(value, index) {
                    var str = "";
                    var endBr = value.endsWith('<br>');
                    var valueArr = [ value ];
                    if (value.includes('<br>')) {
                        valueArr = value.split('<br>');
                        str = "<br>";
                    }
                    valueArr.forEach(function(value2, index) {
                                if (index == (valueArr.length - 1)
                                        && endBr == false) {
                                    str = " ";
                                }
                                if (value2.startsWith("#")) {
                                    newHTML += ("<span class='hash'><a href='/app/searchResult?keyword="
                                            + value2.substring(1)
                                            + "'>"
                                            + value2 + "&nbsp;</a></span>" + str);
                                } else {
                                    newHTML +=  (value2+ str);
                                }
                            });
                });
        return newHTML;
    }
    
    function showCont(cont, index) {
        var newHTML = makeContHtml(cont, index);
        document.getElementById('reviewCont-' + index).innerHTML = newHTML;
    }
</script>
<!-- 작업공간 START -->
<%-- ====================================== if ================================================ --%>
<%-- 글 작성 부분 --%>
<div class="starrrrr"></div>
<c:if test="${targetUser.mno == loginUser.mno}">
  <div class="wPost">
    <h6 id="wreviewH6">리뷰 작성하기</h6>
    <div id="wreviewDiv">
      <c:choose>
        <c:when test="${not empty sessionScope.loginUser}">
          <input type="hidden" id="sessionMno" value="${sessionScope.loginUser.mno}"/>
          ${sessionScope.loginUser.nickname}님, 무슨 영화를 보셨나요?
        </c:when>
        <c:otherwise>
          로그인후 리뷰를 작성해주세요.
        </c:otherwise>
      </c:choose>
    </div>
    <div class="row">
      <div class="col text-center pst"
        onclick="document.getElementById('btnIlsang').click();">
        <i class="far fa-image"></i> 일상 리뷰 올리기
        <c:choose>
          <c:when test="${not empty sessionScope.loginUser}">
            <input type="hidden" data-toggle="modal" id="btnIlsang"
              onclick="postShow('btnIlsang')" data-target="#reviewModal" />
          </c:when>
          <c:otherwise>
            <input type="hidden" id="btnIlsang" onclick="loginError()" />
          </c:otherwise>
        </c:choose>
      </div>
      <div class="col text-center pst"
        onclick="document.getElementById('btnMovie').click();">
        <i class="fas fa-film"></i> 영화 리뷰 올리기
        <c:choose>
          <c:when test="${not empty sessionScope.loginUser}">
            <input type="hidden" data-toggle="modal" id="btnMovie"
              data-target="#reviewModal" onclick="postShow('btnMovie')" />
          </c:when>
          <c:otherwise>
            <input type="hidden" id="btnMovie" onclick="loginError()" />
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</c:if>
<%-- ====================================== if ================================================ --%>
<%-- 포스터 보이는 부분 --%>
<c:forEach items="${postList}" var="post" varStatus="status">
  <c:if test="${status.last}">
    <c:set var="lastpstno" value="${post.pstno}" />
  </c:if>
  <div class="wPost reviewPst list-group-item">
    <div class="media row pr-3 pl-3">
      <img src="${post.member.profileImagePath}" class="rprofileImg" />
      <div class="media-body">
        <ul class="memberul">
          <li><a href="#" class="text-dark">${post.member.nickname}</a>
            <%-- =================================== POST HEADER ========================================== --%>
            <c:choose>
              <c:when test="${post.open == false}">
                <i id="lock-${post.pstno}" class="fas fa-lock lock"
                  style="display: block;"></i>
              </c:when>
            </c:choose> <%-- ==================================== POST OPEN? ========================================== --%>
          </li>
          <li><c:if test="${not empty post.ftags}">
              <c:forEach items="${post.ftags}" var="ftag">
                <a href="#" class="tagName"> ${ftag.nickname} </a>
              </c:forEach>
            </c:if></li>
        </ul>

        <span class="cmt-date">&nbsp;<fmt:formatDate
            pattern="yyyy-MM-dd hh:mm:ss" value="${post.createdDate}" /></span>
        <c:if test="${post.pstTypeNo ==0}">
          <p class="dptitle">
            <b><i>${post.title}</i></b>
          </p>
        </c:if>
      </div>
      <%-- dropDownBtn 들어갈 부분 --%>
      <c:if test="${targetUser.mno == loginUser.mno}">
          <a class="dropdown-toggle c-pointer" id="dropdown01" 
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          </a>
          <div class="dropdown-menu dropdown-flex" aria-labelledby="dropdown01">
            <c:choose>
              <c:when test="${post.pstTypeNo == 0}">
                <a class="dropdown-item c-pointer" data-toggle="modal" data-target="#reviewModal"
                  onclick="openEditingModal(${post.pstno}, 'btnMovie')">수정</a>
              </c:when>
              <c:otherwise>
                <a class="dropdown-item c-pointer" data-toggle="modal" data-target="#reviewModal"
                  onclick="openEditingModal(${post.pstno}, 'btnIlsang')">수정</a>
              </c:otherwise>
            </c:choose>
            
            <a class="dropdown-item c-pointer"
              onclick="deletePost(${post.pstno})">삭제</a>
            
            <%-- <a class="dropdown-item" href="<c:url value='/app/reviewFeed/Feed?id=${loginUser.mno}'/>">나의 페이지</a> --%>
          </div>
      </c:if>
      <%-- dropDownBtn 여기까지 --%>
    </div>
    <%-- =================================== POST HEADER ========================================== --%>
    <%-- 내용보여주는부분 --%>
    <div class="clearfix media row m-1">
      <div class="media-body">
        <p class="reviewCont" id="reviewCont-${post.pstno}">
          <script>
            showCont("${post.content}", "${post.pstno}");
          </script>
        </p>
      </div>
      <c:if test="${post.photos[0] != null}">
        <%-- 이미지 클릭시 상세모달로 --%>
        <img onclick="openDetailModal(${post.pstno})"
          src="/upload/post/${post.photos[0]}" data-title="${post.title}"
          class="pstImgtoDetail" />
        <input type="hidden" data-toggle="modal" id="detailPst"
          data-target="#detailModal" />
      </c:if>
    </div>

    <div class="row">
      <%-- 좋아요 --%>
      <div class="col-6 text-left">
        <i
          class="fas fa-thumbs-up btmIcon c-pointer likeColor 
                   <c:if test="${empty sessionScope.loginUser}"> disabled</c:if>
                   <c:if test="${!post.likeCheck}"> dis-none</c:if>"
          id="btn-like-full-${post.pstno}"
          onclick="cancelLike(${post.pstno},${post.pstTypeNo})"></i> <i
          class="far fa-thumbs-up btmIcon c-pointer likeColor 
                   <c:if test="${empty sessionScope.loginUser}"> disabled</c:if>
                   <c:if test="${post.likeCheck}"> dis-none</c:if>"
          id="btn-like-empty-${post.pstno}"
          onclick="addLike(${post.pstno},${post.pstTypeNo});"></i> <span
          id="lCnt-${post.pstno}">${post.likeCnt}</span> <i
          class="far fa-comment btmIcon c-pointer"
          onclick="showMore(this,${post.pstno})"></i> <span
          id="cCnt-${post.pstno}">${post.cmtCnt}</span>
      </div>
      <%-- 별점 --%>
      <c:if test="${post.pstTypeNo ==0}">
        <div class='col-6 text-right'>
          <c:if test="${0 ne post.star}">
            <c:forEach begin="1" end="5" var="x">
              <c:choose>
                <c:when test="${x le post.star}">
                  <i class="fas fa-star sStar"></i>
                </c:when>
                <c:otherwise>
                  <i class="far fa-star sStar"></i>
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </c:if>
        </div>
      </c:if>

    </div>

  </div>
</c:forEach>
<!-- 작업공간 END -->
<%-- ========================================================================================== --%>
<jsp:include page="/WEB-INF/jsp/reviewFeed/detailPost.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/reviewFeed/writingPost.jsp"></jsp:include>

<script type="text/javascript">
<%-- ========================================================================================== --%>
  /* 삭제하기 */
  
  function deletePost(id){
    var postId=id;
    console.log(postId);
    $.ajax({
      url: "/app/reviewFeed/delete",
      type: "POST",
      data: { "postId" : postId },
      success: function(){
        console.log(id);
        location.reload();
      },
      error: function(xhr, status, msg) {
          console.log(xhr);
          console.log(status);
          console.log(msg);
        }
    });
  }
<%-- ========================================================================================== --%>
  /* 원래 있던 부분 */
  var sessionMember = {
                "nickname" : '${sessionScope.loginUser.nickname}',
                "profileImage" : '${sessionScope.loginUser.profileImage}',
                "mno" : '${sessionScope.loginUser.mno}'
        };
  
  var flwList = [];
        <c:forEach items="${userFlwList}" var="lst">
        flwList.push({
            "value" : "${lst.mno}",
            "text" : "${lst.nickname}"
        });
        </c:forEach>
        var postList = []; 
         
        <c:forEach items="${postList}" var="post">
        
        var pary =[];
            <c:forEach items="${post.photos}" var="pht">
              pary.push('${pht}');
            </c:forEach>
            var fary =[];    
            <c:forEach items="${post.ftags}" var="ft">
              fary.push('${ft.nickname}');
            </c:forEach>
            
             postList.push({
                "pstno": ${post.pstno},
                "title": '${post.title}',
                member:{
                    "profileImagePath": '${post.member.profileImagePath}',
                    "nickname":'${post.member.nickname}',   
                    "mno":'${post.member.mno}'
                    
                },
                "star": ${post.star},
                "photos":pary,
                "ftags":fary,
                "likeCheck":'${post.likeCheck}',
                "pstTypeNo":'${post.pstTypeNo}',
                "createdDate":'${post.createdDate}',
                "likeCnt":'${post.likeCnt}',
                "open" : ${post.open},
                "mvno" : ${post.mvno}
            }) 
            
        </c:forEach> 
            
  </script>
<%-- ========================================================================================== --%>
<script src="/js/jquery-ui.js"></script>
<script src="/js/bootstrap-tagsinput.min.js"></script>
<script src="/js/typeahead.bundle.min.js"></script>
<script src="/js/writingPost.js"></script>
<script src="/js/editingPost.js"></script>
<script src="/js/detailPost.js"></script>
<script src="/js/starrr.js"></script>
<script src="/js/showPosts.js"></script>
</body>
</html>