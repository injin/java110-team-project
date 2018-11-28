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

                <jsp:include page="../sceneAlbum/sceneAlbumList.jsp"></jsp:include>
                <jsp:include page="../sceneAlbum/albumPopup.jsp"></jsp:include>

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
        function albumDetail(lbmTitle, open, lbmno) {
            //alert(lbmTitle);
            console.log(lbmTitle);
            console.log(open);
            $('#detailForm input[name="lbmTitle"]').val(lbmTitle);
            $('#detailForm input[name="open"]').val(open);
            $('#detailForm input[name="lbmno"]').val(lbmno);
            $('#detailForm').submit();

        }

    </script>


</body>
</html>