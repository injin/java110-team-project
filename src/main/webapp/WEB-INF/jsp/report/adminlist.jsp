<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel='stylesheet' href='/css/common.css'>
<link rel="stylesheet" href="/css/vendor/noty.css">
<link rel="stylesheet" href="/css/vendor/sunset.css">
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

textarea {
	resize: none;
}

.opt {
	padding-left: 7px;
	font-weight: 700;
	font-size: 10px;
}

.ico_new {
	margin-left: 5px;
	margin-bottom: 4px;
	vertical-align: -1.7px;
}

.textcolor {
	color: black;
}

.report-btn {
	color: #00cc99;
	background-color: #fff;
	border-color: #00cc99;
}

.report-btn:hover {
	color: #fff;
	background-color: #00cc99;
	border-color: #00cc99;
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

.report-textarea {
	width: 100%;
	height: 10rem;
	padding: 0;
}

.report-textarea2 {
	width: 100%;
	height: 5rem;
	padding: 1px;
	border: 0px;
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

<div class="tabs tabs-style-shape mt-2" style="float: left;">
        <nav>
            <ul>
                <li class="tab-current">
                <a href="../report/list" 
                    style="text-decoration: none; color: #fff; font-weight: bold; font-size: 20px;">
                        <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                            <use xlink:href="#tabshape">
                                <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z">
                                </path>
                            </use>
                       </svg> 
                   <span>신고목록</span>
                     </a></li>
                <li><a href="../admin/themeList"
                    style="text-decoration: none; color: #fff; font-weight: bold; font-size: 20px;">
                        <svg viewBox="0 0 80 60" preserveAspectRatio="none">
                            <use xlink:href="#tabshape">
                               <path id="tabshape" d="M80,60C34,53.5,64.417,0,0,0v60H80z">
                               </path>
                            </use>
                        </svg>
                   <span>추천테마영화</span>
                    </a></li>
            </ul>
        </nav>
    </div>
<table class="table table-hover">
	<thead>
		<tr class="col-12">
			<th scope="col" style="width: 100px;">신고번호</th>
			<th scope="col" style="width: 107px;">신고자</th>
			<th scope="col" style="width: 650px;">신고내용</th>
			<th scope="col">신고날짜</th>
			<th scope="col">처리여부</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="dateNow" />
		<c:forEach items="${reportList}" var="report" varStatus="status">
			<tr>
				<td>${report.rptno}</td>
				<td>${report.nick}</td>
				<td data-toggle="collapse" data-target="#demo-${report.rptno}">
					${report.cont} <a href="${report.url}"> <c:if
							test="${not empty report.reportTypes}">
							<br>
							<c:forEach items="${report.reportTypes}" var="type">
								<c:if test="${type.type eq '1'}">
									<span class="badge badge-danger">선정적/욕설/비방</span>
								</c:if>
								<c:if test="${type.type eq '2'}">
									<span class="badge badge-warning">다른 영화 사진</span>
								</c:if>
								<c:if test="${type.type eq '3'}">
									<span class="badge badge-info">부정확한 내용</span>
								</c:if>
								<c:if test="${type.type eq '4'}">
									<span class="badge badge-dark">기타</span>
								</c:if>
							</c:forEach>
						</c:if>
				</a> <c:if test="${report.createdDate eq dateNow}">
						<img src="https://cafe.pstatic.net/cafe4/ico-new.gif" width="10"
							height="9" class="ico_new" alt="새 게시글" title="새 게시글">
					</c:if>
				</td>
				<td>${report.createdDate}</td>
				<c:choose>
					<c:when test="${report.hndl eq false}">
						<td id="report-btn-${report.rptno}"><button type="button"
								class="btn report-btn report-btn-size" data-toggle="modal"
								onclick="showModal(${report.rptno})">미처리</button></td>
					</c:when>
					<c:otherwise>
						<td>
							<div class="btn-group dropright">
								<button type="button"
									class="btn report-btn2 report-btn-size dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="true">처리</button>
								<div class="dropdown-menu">
									<textarea class="report-textarea2" id="ucont-${report.rptno}">${report.hcont}</textarea>
									<div class="dropdown-divider"></div>
									<button class="btn report-btn float-right "
										onclick="insertHcont('ucont-${report.rptno}')">수정</button>
								</div>
							</div>
						</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</c:forEach>
	</tbody>
</table>


<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
	aria-labelledby="reportModalTitle" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="reportModalTitle">신고처리</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<textarea class="report-textarea" id="hcont" placeholder="내용을 입력하세요"></textarea>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button class="btn report-btn" onclick="insertHcont('hcont')">입력</button>
			</div>
		</div>
	</div>
</div>


<jsp:include page="rptpaging.jsp" flush="true">
	<jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
	<jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
	<jsp:param name="startPageNo" value="${paging.startPageNo}" />
	<jsp:param name="pageNo" value="${paging.pageNo}" />
	<jsp:param name="endPageNo" value="${paging.endPageNo}" />
	<jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
	<jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>

<form id="listForm" action="list" method="post">
	<input type="hidden" name="pageNo">
</form>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="/js/vendor/noty.js"></script>

<script>
/* $(document).ready(function(){
    $("li").hover(function(){
        $(this).addClass("tab-current");
        }, function(){
        $(this).removeClass("tab-current");
    });
}); */

 

    var currentRptno;
    function showModal(rptno) {
        currentRptno = rptno;
        $('#reportModal').modal('show');
    }
    
    function goPage(pageNo) {
        $('#listForm input[name="pageNo"]').val(pageNo);
        $('#listForm').submit();
    }

    function insertHcont(type) {
        var contVal;
        if(type == 'hcont'){
            contVal = $('textarea[id="hcont"]').val();    
        }else{
            // type = ucont-xxx
            currentRptno = type.substr(6);
            contVal = $('textarea[id='+type+']').val();
        }
        
        if (contVal == '') {
            commonAlert('error','내용을 입력해 주세요.');
            return;
        }
  
         $.ajax({
            url : "/app/report/addHndl",
            type: "post",
            data : {
                "rptno" : currentRptno,
                "hcont" : contVal
            },
            success : function(data) {
                if (data == true) {
                  
                    if(type == 'hcont'){
                        $('#hcont').val('');
                        $('#reportModal').modal('hide');
                        
                        var html = '<div class="btn-group dropright">';
                        html += '<button type="button" class="btn report-btn2 report-btn-size dropdown-toggle" data-toggle="dropdown"';
                        html += '     aria-haspopup="true" aria-expanded="true">처리</button>';
                        html += '<div class="dropdown-menu">';
                        html += '<textarea class="report-textarea2" id="ucont-';
                        html += currentRptno;
                        html += '">';
                        html += contVal;
                        html += '</textarea>';
                        html += '<div class="dropdown-divider"></div>';
                        html += '<button class="btn report-btn float-right " onclick="insertHcont(\'ucont-';
                        html += currentRptno;
                        html += '\')">수정</button>';
                        html += '</div>';
                        html += '</div>';
                        $('#report-btn-'+currentRptno).html(html);
                        
                    }else{
                        
                        $('#ucont-'+currentRptno).val(contVal);
                    }

                    commonAlert('success','처리되었습니다');
                }
                
            },
            error: function(xhr, status, msg) {
                console.log(xhr);
                console.log(status);
                console.log(msg);
            }
        });  
     }
    
    
</script>

