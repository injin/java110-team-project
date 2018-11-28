<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>타이틀</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel='stylesheet' href='/css/album.css'>
<link rel='stylesheet' href='/css/common.css'>
</head>
<body>
    <jsp:include page="../include/header.jsp"></jsp:include>

    <main role="main" class="container pt-0">
    <div class="row">
        <aside class="col-3">
            <div class="mt-2">
                <img class="card-img-top" id="mypage-profile-img"
                    src="${loginUser.profileImagePath}" alt="프로필 이미지">
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


    <!-- 앨범 상세 -->
    <section>
        <div class="row mbr-justify-content-center">
            <div class="col-lg-12 mbr-col-md-12">

                <div class="row detailList">
                    <div class="col-lg-12 mt-4 ml-1 mb-5">
                        <span class="titl">${title}</span>
                        <div class="a_btn btn btn-success btn-lg mr-2"
                            onclick="document.getElementById('mgrAlbum').click();">
                            수정하기<input type="hidden" data-toggle="modal" id="mgrAlbum"
                                data-target="#mgrModal" />
                        </div>
                    </div>
                    <!-- 앨범 목록 -->
                    <div class="row" style="margin: 0 auto;">
                        <!-- 장면 -->
                        <c:forEach var="sceneReview" items="${sceneReview}">
                            <div class="row scene">
                                <a
                                    href="/app/sceneReview/review?mvno=${sceneReview.mvno}&srno=${sceneReview.srno}">
                                    <img class="card-img-top hot-sr-img"
                                    src="/upload/sceneReview/${sceneReview.photo}"
                                    alt="Card image cap">
                                </a>

                            </div>
                        </c:forEach>
                    </div>
                    <!-- 페이징버튼 -->

                    <jsp:include page="paging.jsp" flush="true">
                        <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
                        <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
                        <jsp:param name="startPageNo" value="${paging.startPageNo}" />
                        <jsp:param name="pageNo" value="${paging.pageNo}" />
                        <jsp:param name="endPageNo" value="${paging.endPageNo}" />
                        <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
                        <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
                    </jsp:include>
                    <form class="listForm" action="detail" method="post">
                        <input type="hidden" name="pageNo">
                    </form>

                </div>
            </div>
        </div>
        <jsp:include page="../sceneAlbum/mgrPopup.jsp"></jsp:include>
    </section>
    
             </div>

        </div>
    </div>
    
    </main>

    <jsp:include page="../include/footer.jsp"></jsp:include>
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script src="/js/bootstrap.js"></script>
    <script src="/js/common.js"></script>
    <script>
    
        $('.title_box').on('mouseover', function(){
            $('.title_edit').css('visibility', 'visible');
        }).on('mouseleave', function(){
            $('.title_edit').css('visibility', 'hidden');    
        });
        
        
    </script>

</body>
</html>