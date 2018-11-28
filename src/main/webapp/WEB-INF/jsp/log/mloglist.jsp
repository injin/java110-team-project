<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log리스트 불러오기</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main" class="container pt-0">
        <div class="row">
            <aside class="col-3">
            
            <div class="mt-2">
              <img class="card-img-top" id="mypage-profile-img" src="${loginUser.profileImagePath}" alt="프로필 이미지">
              <div class="card-body">
                <h5 class="card-title">${loginUser.nickname}</h5>
                <p class="card-text">${loginUser.pr}</p>
              </div>
            </div>
                
            </aside>
            <div class="col-9 borderGray p-0" id="mypage-right">
                <img src="${loginUser.coverImagePath}" id="mypage-cover-img">
                <div class="row">
                    <div class="col-lg-12">
                    <table class="table">
                      <thead id="mypage-menu">
                        <tr class="d-flex">
                          <th scope="col" class="col-2 text-center"><a href="#">나의피드</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">정보수정</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">통계</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">팔로우</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">활동로그</a></th>
                          <th scope="col" class="col-2 text-center"><a href="#">장면보관함</a></th>
                        </tr>
                      </thead>
                    </table>
                    </div>
                </div>

                <div class="row pl-3 pr-3">
                    <div class="col-lg-2 col-md-4 col-sm-12">
                        <div class="input-group mb-3">
                            <select class="custom-select" id="logType">
                                <option value="mp" selected>영화리뷰</option>
                                <option value="dp">일상리뷰</option>
                                <option value="sr">장면리뷰</option>
                                <option value="pc">게시물 댓글</option>
                                <option value="sc">장면리뷰 댓글</option>
                                <option value="fr">친구</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="logList col-lg-12" id="list-mp">
                        <h4>영화리뷰 로그</h4>
                        <ul class="list-group">
                        <c:forEach var="log" items="${list}">
                            <c:if test="${log.direct eq 'mp'}">
                                <li class="list-group-item">
                                <span style="float: left; margin-bottom: 0">
                                    <a href="#">${log.nick}</a>님이
                                    <c:if test="${log.act eq 'wr'}">
                                        <a href="${log.url}">${log.indirect}</a> 에 영화 리뷰를 작성했습니다
                                    </c:if>
                                    <c:if test="${log.act eq 'lk'}">
                                        <a href="${log.url}">${log.indirect}</a> 에 영화 리뷰를 좋아합니다
                                    </c:if>
                                </span>
                                <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
                            </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="logList col-lg-12" id="list-dp">
                        <h4>일상리뷰 로그</h4>
                        <ul class="list-group">
                        <c:forEach var="log" items="${list}">
                            <c:if test="${log.direct eq 'dp'}">
                                    <li class="list-group-item">
                                    <span style="float: left; margin-bottom: 0">
                                        <a href="#">${log.nick}</a>님이
                                        <c:if test="${log.act eq 'wr'}">
                                            <a href="${log.url}">${log.indirect}</a> 에 일상 리뷰를 작성했습니다
                                        </c:if>
                                        <c:if test="${log.act eq 'lk'}">
                                            <a href="${log.url}">${log.indirect}</a> 에 일상 리뷰를 좋아합니다
                                        </c:if>
                                    </span>
                                    <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
                                </li>
                                <%-- <a href="#" class="list-group-item list-group-item-action">
                                    <p style="float: left; margin-bottom: 0">${log.text}</p>
                                    <p style="float: right; margin-bottom: 0">${log.createdDate}</p>
                                </a> --%>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="logList col-lg-12" id="list-sr">
                        <h4>장면리뷰 로그</h4>
                        <ul class="list-group">
                        <c:forEach var="log" items="${list}">
                            <c:if test="${log.direct eq 'sr'}">
                                <li class="list-group-item">
                                    <span style="float: left; margin-bottom: 0">
                                        <a href="#">${log.nick}</a>님이
                                        <c:if test="${log.act eq 'wr'}">
                                            <a href="<c:url value="${log.url}"/>">${log.indirect}</a> 에 장면 리뷰를 작성했습니다
                                        </c:if>
                                        <c:if test="${log.act eq 'lk'}">
                                            <a href="${log.url}">${log.indirect}</a> 에 장면 리뷰를 좋아합니다
                                        </c:if>
                                    </span>
                                    <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
                                </li>
                                    <%-- <p style="float: left; margin-bottom: 0">${log.text}</p>
                                    <p style="float: right; margin-bottom: 0">${log.createdDate}</p> --%>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="logList col-lg-12" id="list-pc">
                        <h4>게시물 댓글</h4>
                        <ul class="list-group">
                        <c:forEach var="log" items="${list}">
                            <c:if test="${log.direct eq 'pc'}">
                                <li class="list-group-item">
                                    <span style="float: left; margin-bottom: 0">
                                        <a href="#">${log.nick}</a>님이 
                                        <a href="${log.url}">${log.indirect}</a> 님의 게시물에 댓글을 작성했습니다
                                    </span>
                                    <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="logList col-lg-12" id="list-sc">
                        <h4>장면리뷰 댓글</h4>
                        <ul class="list-group">
                        <c:forEach var="log" items="${list}">
                            <c:if test="${log.direct eq 'sc'}">
                                <li class="list-group-item">
                                    <span style="float: left; margin-bottom: 0">
                                        <a href="#">${log.nick}</a>님이 
                                        <a href="${log.url}">${log.indirect}</a> 의 장면 리뷰에 댓글을 작성하였습니다
                                    </span>
                                    <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                    <div class="logList col-lg-12" id="list-fr">
                        <h4>친구</h4>
                        <ul class="list-group">
                        <c:forEach var="log" items="${list}">
                            <c:if test="${log.direct eq 'fr'}">
                               <li class="list-group-item">
                                    <span style="float: left; margin-bottom: 0">
                                        <a href="#">${log.nick}</a>님이 
                                        <a href="${log.url}">${log.indirect}</a> 을/를 팔로우 했습니다
                                    </span>
                                    <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
                                </li>
                            </c:if>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                
            </div>
        </div>
    
    

    <a class="return-top" href="#" >
    <img src="/img/top-btn.png"  width="50" height="50"></a>




    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script type="text/javascript">
        // 기본으로 게시물 목록만 보여줌
        var initType = $('#logType').val();
        showSelectedLogList(initType);

        function showSelectedLogList(logType) {
            $('.logList').hide();
            $('#list-' + logType).show();
        }

        $('#logType').on('change', function() {
            var selectedLogType = $('#logType').val();
            showSelectedLogList(selectedLogType);
        });
       
        



        

        /* document.getElementById('logType').onchange = function() {
            alert('js 셀렉트 박스 변경하셨네요');
        }; */
    </script>
</body>
</html>