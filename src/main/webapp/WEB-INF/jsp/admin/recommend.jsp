<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Scenecok</title>
<link rel="shortcut icon" type="image/x-icon" href="/img/favicon.ico">
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>
<link rel="stylesheet" href='/css/bootstrap2-toggle.min.css'>
<link rel="stylesheet" href="/css/tabs.css">
<link rel="stylesheet" href="/css/tabstyles.css">
<style>
table {
	text-align: center;
}

thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #00cc99;
}

thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
}

.report-btn2 {
	color: #fff;
	background-color: #00cc99;
	border-color: #00cc99;
}

.report-btn2:hover {
	color: #fff;
	background-color: #00e6ac;
	border-color: #00e6ac;
}

.table th, .table td {
	padding: 0.75rem;
	vertical-align: middle;
}

.report-btn-size {
	width: 74px;
	height: 38px;
}

.addTheme {
	float: right;
	margin-right: 3rem;
	margin-top: 0.5rem;
}

.btn-remove {
	background-color: #343a4082;
	color: white;
}

.btn-remove:hover {
	background-color: #343a40b5;
}

#themeModal .modal-content {
	width: 70%;
	margin: 0 auto;
	top: 12rem;
}

.tabs-style-shape {
	max-width: 500px;
}

.tabs-style-shape nav li.tab-current a span {
	background: #00cc99;
}

.tabs-style-shape nav li.tab-current a svg {
	fill: #00cc99;
}

.table th{
  padding: 0.75rem;
  vertical-align: top;
  border-top: none;
}
</style>
</head>
<body>
	<jsp:include page="../include/header.jsp"></jsp:include>
	<main role="main" class="container">
	<div class="tabs tabs-style-shape mt-2" style="float: left;">
		<nav>
			<ul>
				<li><a href="../report/list"
					style="text-decoration: none; color: #fff; font-weight: bold; font-size: 20px;">
						<svg viewBox="0 0 80 60" preserveAspectRatio="none">
                            <use xlink:href="#tabshape">
                                <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z">
                                </path>
                            </use>
                       </svg> 
                   <span>신고목록</span>
				     </a></li>
				<li class="tab-current"><a href="../admin/themeList"
					style="text-decoration: none; color: #fff; font-weight: bold; font-size: 20px;">
						<svg viewBox="0 0 80 60" preserveAspectRatio="none">
                            <use xlink:href="#tabshape">
                               <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z">
                               </path>
                            </use>
                        </svg>
                   <span>씬콕의 추천영화</span>
				    </a></li>
			</ul>
		</nav>
	</div>
	<div class="btn report-btn2 addTheme mt-3"
		onclick="document.getElementById('btnTheme').click();">
		테마 만들기 <input type="hidden" data-toggle="modal" id="btnTheme"
			data-target="#themeModal" />
	</div>

	<table class="table table-hover">
		<thead>
			<tr>
				<th colspan="2" scope="col">테마명</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty theme}">
          테마를 추가해 주세요.
        </c:if>
			<c:forEach items="${theme}" var="list" varStatus="status">
				<tr id="thm-${list.thmno}">
					<td onclick="makeMVList('${list.thm}',${list.thmno})"><a
						href="#">${list.thm}</a></td>
					<td>
						<button type="button" class="btn btn-remove report-btn-size"
							onclick="remove(${list.thmno})">삭제</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<form class="mvListForm" action="addList" method="get">
		<input type="hidden" name="thmno"> <input type="hidden"
			name="thm">
	</form>


	</main>
	<jsp:include page="../admin/makeThemePopup.jsp"></jsp:include>
	<jsp:include page="../include/commonJs.jsp"></jsp:include>
	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script src="/js/bootstrap2-toggle.min.js"></script>

	<script>
	  
    
 /*    $(document).ready(function(){
        $(".li").hover(function(){
            $(this).addClass("tab-current");
            }, function(){
            $(this).removeClass("tab-current");
        });
    }); */
	
	
       function makeMVList(thm, thmno){
           $('.mvListForm input[name="thmno"]').val(thmno);
           $('.mvListForm input[name="thm"]').val(thm);
           $('.mvListForm').submit();
       }
       
       function remove(thmno){

           $.ajax({
               type:'POST',
               url: '/app/admin/removeTheme',
               headers: {
                   'Content-Type': 'application/json'
               },
               data: JSON.stringify({
                  "thmno" : thmno
               }),
               success:function(){
                   $('#thm-'+thmno).remove();
                   alert('테마삭제완료');
               }
           }); 
       }
       
       function makeTheme(){
           
       }
       
     
    
    </script>


</body>
</html>