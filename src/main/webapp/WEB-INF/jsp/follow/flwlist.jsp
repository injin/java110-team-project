<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../include/top.jsp"%>

	<c:forEach items="${flwlist}" var="member">
		<div class="col-lg-6 col-md-6 col-sm-12 mb-3">
			<div class="card">
				<div class="card-body">
					<div class="media">
						<img class="mr-3 profile-large" src="${member.profileImagePath}"
							alt="/img/default-profile-img">
						<div>
							<h4>${member.nickname}</h4>
							<button class="btn btn-primary btn-size"
								onclick="removeFlw(${member.mno})">언팔로우</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
				
	<jsp:include page="flwpaging.jsp" flush="true">
        <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
        <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
        <jsp:param name="startPageNo" value="${paging.startPageNo}" />
        <jsp:param name="pageNo" value="${paging.pageNo}" />
        <jsp:param name="endPageNo" value="${paging.endPageNo}" />
        <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
        <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
    </jsp:include>
    
    <form id="listForm" action="flwlist" method="post">
        <input type="hidden" name="pageNo">
    </form>
	<form action="flwdelete" id="deleteForm" method="post">
		<input type="hidden" name="flw">
	</form>
	<form action="flwadd" id="add" method="post">
		<input type="hidden" name="flw">
	</form>
	
<script>

function removeFlw(number) {
    $('#deleteForm input[name="flw"]').val(number);
    $('#deleteForm').submit();
}

 function goPage(pageNo){
    
    $('#listForm input[name="pageNo"]').val(pageNo);
    $('#listForm').submit();
    
} 
</script>
