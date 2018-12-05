<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일업로드 테스트</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link href="/css/fontawesome.css" rel="stylesheet">
<link href="/css/all.css" rel="stylesheet">
<link rel='stylesheet' href='/css/writingPost.css'>
<link rel='stylesheet' href='/css/common.css'>

</head>
<body>

    <main role="main" class="container">
        <form action="upload" method="post" enctype="multipart/form-data">
            <%-- 사진 첨부 --%>
            <div class="file btn btn-primary photo-star-section"
                onclick="document.getElementById('picupload1').click();">
                <i class="far fa-images"></i>사진 <input type="file" size="30"
                     accept="image/*" class="picupload d-none"
                    id="picupload1" name="files" multiple />
            </div>
            
            <%-- 사진 보이는 list --%>
            <ul id="media-list" class="clearfix">
                <li class="myupload "><span><i class="fa fa-plus"
                        aria-hidden="true"></i></span></li>
            </ul>
            
        </form>
    </main>
    
    <jsp:include page="include/footer.jsp"></jsp:include>
    <script src="/js/imgUpload.js"></script>
</body>
</html>