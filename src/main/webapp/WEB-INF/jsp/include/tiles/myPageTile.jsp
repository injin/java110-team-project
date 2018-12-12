<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${targetUser.nickname}</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel="stylesheet" href="/css/fontawesome.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
<link rel='stylesheet' href='/css/common.css'>
<link rel='stylesheet' href='/css/rcme.css'>
<t:importAttribute name="currentMenu" />
<t:importAttribute name="cssFiles" />
<c:forEach var="css" items="${cssFiles}">
    <link rel="stylesheet" type="text/css" href="${css}">
</c:forEach>
<t:importAttribute name="jsFiles" />
<c:forEach var="jsFile" items="${jsFiles}">
    <script src="${jsFile}"></script>
</c:forEach>

</head>
<body>
    <jsp:include page="../header.jsp"></jsp:include>

    <main role="main" class="container pt-0">
    <div class="row">
        <aside class="col-3">
            <div class="mt-2">
                <img class="card-img-top" id="mypage-profile-img"
                    src="${targetUser.profileImagePath}" alt="프로필 이미지">
                <div class="card-body">
                    <h5 class="card-title">${targetUser.nickname}</h5>
                    <p class="card-text scrollbar-light-blue"
                        style="height: 10rem;">${targetUser.pr}</p>
                </div>
            </div>
            <c:if test="${not empty loginUser}">
                <c:if test="${targetUser.flw == false && loginUser.mno != targetUser.mno}">
                    <button class="btn btn-primary float-right"
                        id="flwBtn"
                        onclick="addFollow(${targetUser.mno},'${targetUser.nickname}', 'fl')">팔로우</button>
                </c:if>
            </c:if>


            <%-- 친구 추천 부분 --%>
            <c:if test="${not empty sessionScope.loginUser}">
                <c:if test="${targetUser.mno == loginUser.mno}">
                    <table class="w-100" id="flwSmlr">
                        
                    </table>
                </c:if>
            </c:if>

        </aside>
        <div class="col-9 borderGray p-0" id="mypage-right">
            <img src="${targetUser.coverImagePath}"
                id="mypage-cover-img">
            <div class="row">
                <div class="col-lg-12">

                    <div class="tab_container">
                        <ul>
                            <li id="li-feed"><a href="<c:url value="/app/reviewFeed/Feed?id=${targetUser.mno}"/>">피드</a></li>
                            <li id="li-sceneAlbum"><a href="<c:url value="/app/sceneAlbum/list?tgtMno=${targetUser.mno}"/>">장면보관함</a></li>
                            <c:if test="${targetUser.mno == loginUser.mno}">
                                <li id="li-statis"><a href="<c:url value="/app/stsc/list"/>">통계</a></li>
                                <li id="li-follow"><a href="<c:url value="/app/follow/flwlist"/>">팔로우</a></li>
                                <li id="li-log"><a href="<c:url value="/app/log/mloglist"/>">활동로그</a></li>
                                <li id="li-update"><a href="<c:url value="/app/auth/update"/>">정보수정</a></li>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="row pl-3 pr-3">

                <jsp:include page="../commonJs.jsp"></jsp:include>
                <t:insertAttribute name="body" />

            </div>
        </div>
    </div>
    </main>

    <jsp:include page="../footer.jsp"></jsp:include>

    <script>
    
    //친구 추천 리스트 가져오기
     $.ajax({
        url : "/app/follow/flwrcmd",
        type: "post",
        success : function(data) {
            console.log(data)
            var html ='';
                html +='<thead>';
                html +='<tr>';
                html +='<th>비슷한 취향의 유저</th>';
                html +='</tr>';
                html +='</thead>';
                html +='<tbody>';
            data.forEach(function(value, index) {
                html += '<tr id="tr-rcmd-' + value.mno + '">';
                html += '    <td><img src="'+value.profileImage+'" class="profile4X4">' + value.nickname;
                html += '        <button class="btn btn-outline-primary float-right"';
                html += '                onclick="addFollow(' + value.mno + ',\'' + value.nickname +'\', \'rcmd\')">팔로우</button>';
                html += '    </td>';
                html += '</tr>';
            });
                html +='</tbody>';
                $('#flwSmlr').html(html);
        }
        });
    
   //현재 메뉴 활성화
   $('#li-${currentMenu}').addClass('active');
   
   // 팔로우 하기
   function addFollow(mno,nickname, type) {
       
       $.ajax({
           url : "/app/follow/flwadd",
           type: "post",
           data : {
               "mno" : mno,
               "nickname" : nickname
           },
           success : function(data) {
               if (data.result == true) {
                   if (type == 'fl') {
                       $('#flwBtn').remove();
                   } else if (type == 'rcmd') {
                       $('#tr-rcmd-' + mno).remove();
                       
                       var cardHtml = makeCardHtml(data.addedMember);
                       $('#follow-card-list').append(cardHtml);
                   }
                   commonAlert('success','팔로우 되었습니다.');
               } else {
                   commonAlert('error','문제가 발생하였습니다.');
               } 
               
           },
           error: function(xhr, status, msg) {
               console.log(xhr);
               console.log(status);
               console.log(msg);
           }
       });
   }
   
   function makeCardHtml(member) {
       var html = '<div class="col-lg-6 col-md-6 col-sm-12 mb-3" id="flw-card-' + member.mno + '" >';
           html += '<div class="card" >';
           html += '<div class="card-body">';
           html += '<div class="media">';
           html += '<img class="mr-3 profile-large" src="' + member.profileImagePath + '" alt="프로필 이미지">';
           html += '<div>';
           html += '<h4 style ="text-align: center"><a class="c-pointer" onclick="' + member.mno + ')">' + member.nickname + '</a></h4>';
           html += '<button class="btn btn-primary " onclick="removeFlw(' + member.mno + ')">언팔로우</button>';
           html += '</div></div></div></div></div>';
           
       return html;
   }
   
   </script>


</body>
</html>