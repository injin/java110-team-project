<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
</style>




<h1 style="margin: 30px 30px 30px 5px; font-family: fantasy;">신고목록</h1>
<table class="table table-hover">
	<thead>
		<tr>
			<th scope="col">신고번호</th>
			<th scope="col">신고자</th>
			<th scope="col">신고내용</th>
			<th scope="col">신고날짜</th>
			<th scope="col">처리여부</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate pattern="yyyy-MM-dd" value="${now}" var="dateNow" />
		<c:forEach items="${findAll}" var="report" varStatus="status">
			<tr>
				<td>${report.rptno}</td>
				<td>${report.nick}</td>
				<td><a href="${report.url}" class="textcolor">${report.cont}</a>
					<c:choose>
						<c:when test="${report.createdDate eq dateNow}">
							<img src="https://cafe.pstatic.net/cafe4/ico-new.gif" width="10"
								height="9" class="ico_new" alt="새 게시글" title="새 게시글">
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose></td>
				<td>${report.createdDate}</td>
				<c:choose>
					<c:when test="${report.hndl eq false}">
						<td id="report-btn-${report.rptno}"><button type="button"
								class="btn report-btn report-btn-size" data-toggle="modal"
								onclick="showModal(${report.rptno})">미처리</button></td>
					</c:when>
					<c:otherwise>
						<td><div class="btn-group dropright">
								<button type="button"
									class="btn report-btn2 report-btn-size dropdown-toggle"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="true">처리</button>
								<div class="dropdown-menu">
									<textarea class="report-textarea">${report.hcont}</textarea>
									<div class="dropdown-divider"></div>
									<button class="btn report-btn">수정</button>
								</div>
							</div></td>
					</c:otherwise>
				</c:choose>
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
				<button class="btn report-btn" data-dismiss="modal"
					onclick="insertHcont()">입력</button>
			</div>
		</div>
	</div>
</div>


<jsp:include page="rptpaging.jsp" flush="true">
	<jsp:param name="firstPageNo" value="${rptPaging.firstPageNo}" />
	<jsp:param name="prevPageNo" value="${rptPaging.prevPageNo}" />
	<jsp:param name="startPageNo" value="${rptPaging.startPageNo}" />
	<jsp:param name="pageNo" value="${rptPaging.pageNo}" />
	<jsp:param name="endPageNo" value="${rptPaging.endPageNo}" />
	<jsp:param name="nextPageNo" value="${rptPaging.nextPageNo}" />
	<jsp:param name="finalPageNo" value="${rptPaging.finalPageNo}" />
</jsp:include>

<form id="listForm" action="list" method="post">
	<input type="hidden" name="pageNo">
</form>

<script>

    var currentRptno;
    function showModal(rptno) {
        currentRptno = rptno;
        $('#reportModal').modal('show');
    }
    
    function goPage(pageNo) {
        $('#listForm input[name="pageNo"]').val(pageNo);
        $('#listForm').submit();
    }

    function insertHcont() {
        var contVal = $('textarea[id="hcont"]').val();
        if (contVal == '') {
            alert('내용을 입력해 주세요.');
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
                  
                   var html ='';
                        html += '<div class="btn-group dropright">';
                        html += '<button type="button" class="btn report-btn2 report-btn-size dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">처리</button>'
                        html += '<div class="dropdown-menu">'
                        html += '<textarea class ="report-textarea">'+ contVal +'</textarea>'
                        html += '<div class="dropdown-divider"></div>'
                        html += '<button class ="btn report-btn">수정</button></div>'
                        html += '</div>'
                        html += '</div>'
                        
                    $('#report-btn-' + currentRptno).html(html);
                    $('#hcont').val('');
                   
                }
                
            },
            error: (xhr, status, msg) => {
                console.log(xhr);
                console.log(status);
                console.log(msg);
            }
        });
    }
</script>

