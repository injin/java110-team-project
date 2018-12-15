<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scenecok</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/all.css">
<link rel='stylesheet' href='/css/fontawesome.css'>
<link rel='stylesheet' href='/css/card.css'>
<link rel='stylesheet' href='/css/starrr.css'>
<link rel='stylesheet' href='/css/writingPost.css'>
<link rel='stylesheet' href='/css/detailPost.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/top-btn.css'>
<style>
.gPost {
	background: white;
	padding: 1rem 1rem 0 1rem;
	border-radius: 0.5rem;
	box-shadow: 7px 7px 30px -5px rgba(0, 0, 0, 0.1);
	margin-bottom: 0.5rem;
}

.btmIcon {
	padding: 0 0.4rem 1rem 1rem;
	font-size: 1.3rem;
	vertical-align: sub;
}

.reviewCont {
	height: 13rem;
	-ms-text-overflow: ellipsis;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
	white-space: pre-line;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: pre-line;
}

.mauto {
	margin: 0 auto;
}

.sStar {
	font-size: 1.5rem;
	color: #FFD119;
}
/* .text-wrap .c-pointer:hover {
    font-weight:bold;
} */
/* == 장면앨범 조회결과 ==  */
.memb-profile{
    border-radius: 50%;
    width: 2rem !important;
    height: 2rem;
}
.lbm .ico-wrap{
    width: 14rem;
}
.lbm .text-wrap{
    width: 15rem;
}
.lbmTitl{
    font-weight: bold;
}
/* == 장면리뷰 조회결과 == */
.cmt-date {
    color: #ccc;
    font-size: 0.9em;
}
.cmt-img {
    max-width: 35em;
}
.makeBold .c-pointer:hover {
    font-weight:bold;
} 

</style>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="bgGray">

	<jsp:include page="../include/header.jsp"></jsp:include>

	<main role="main" class="container" style="margin: 0 auto;">
	   <jsp:include page="searchResult.jsp" />
	</main>

	<jsp:include page="../reviewFeed/detailPost.jsp"></jsp:include>
    <jsp:include page="../include/commonJs.jsp"></jsp:include>
	<jsp:include page="../include/footer.jsp"></jsp:include>
    <jsp:include page="../include/top-btn.jsp"></jsp:include>
    
	<script src="/js/vendor/jquery.tweetParser.js"></script>
    <script src="/js/top-btn.js"></script>
	<script src="/js/showPosts.js"></script>
	<script src="/js/detailPost.js"></script>
	<script type="text/javascript">
        //console.log('${movieList}');

        // 페이지가 1개뿐일 경우 =>처리해줘야함

        var totalCount = 0;
        var movieFooter = document.getElementById('showAllMovies');
        var memberFooter = document.getElementById('showAllMembers');
        var tagFooter = document.getElementById('showAllTags');
        var albumFooter = document.getElementById('showAllAlbums');
        var sceneFooter = document.getElementById('showAllsceneTags');
        var frame;

        /* 장면리뷰 댓글 해쉬태그 부분 */
         $(".cmt-cont").tweetParser({
            urlClass : "tweet_link", //this is default
            userClass : "tweet_user", //this is default
            hashtagClass : "navy",
            target : "_self", //this is default
            hashtagPath: "<c:url value='/app/searchResult?keyword=' />"
        });
        
        /* 게시물 해시태그부분 */
        var sessionMember = {
            "nickname" : '${sessionScope.loginUser.nickname}',
            "profileImage" : '${sessionScope.loginUser.profileImage}',
            "mno" : '${sessionScope.loginUser.mno}'
        };

        var postList = [];

        <c:forEach items="${hashList}" var="post">

        var pary = [];
        <c:forEach items="${post.photos}" var="pht">
        pary.push('${pht}');
        </c:forEach>
        var fary = [];
        <c:forEach items="${post.ftags}" var="ft">
        fary.push('${ft.nickname}');
        </c:forEach>

        postList.push({
            "pstno" : '${post.pstno}',
            "title" : '${post.title}',
            member : {
                "profileImagePath" : '${post.member.profileImagePath}',
                "nickname" : '${post.member.nickname}',
                "mno":'${post.member.mno}'
            },
            "star" : '${post.star}',
            "photos" : pary,
            "ftags" : fary,
            "likeCheck" : '${post.likeCheck}',
            "pstTypeNo" : '${post.pstTypeNo}',
            "createdDate" : '${post.createdDate}',
            "likeCnt" : '${post.likeCnt}'
        })

        </c:forEach>

        function goToLbm(lbmno,mno){ 
            location.href = "/app/sceneAlbum/detail?open=true&lbmno="+lbmno+"&tgtMno="+mno;
        }
        
        function goToSceneTag(mvno, srno){ 
            location.href = "/app/sceneReview/review?mvno="+ mvno+ "&srno=" + srno;
        }
        
        /* 더보기버튼 */
        function showMoreInSearchResult(input, type) {

            if (input > 20) {
                totalCount = 20;
            } else {
                totalCount = input;
            }

            if (type == 'mv') {
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('movieFrame')[i];
                    frame.style.display = "block";
                }

                movieFooter.style.visibility = "hidden";

            } else if (type == 'mb') {
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('memberFrame')[i];
                    frame.style.display = "block";
                }

                memberFooter.style.visibility = "hidden";
            } else if (type == 'tg') {
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('tagFrame')[i];
                    frame.style.display = "block";
                }

                tagFooter.style.visibility = "hidden";
            } else if (type == 'ab') {
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('albumFrame')[i];
                    frame.style.display = "block";
                }

                albumFooter.style.visibility = "hidden";
            } else if (type == 'st') {
                for (var i = 3; i < totalCount; i++) {
                    frame = document.getElementsByClassName('sceneTagFrame')[i];
                    frame.style.display = "block";
                }

                sceneFooter.style.visibility = "hidden";
            }
            
        }
    </script>
</body>
</html>