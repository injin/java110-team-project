<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../include/top.jsp"%>

<style>
.btn-primary {
  color: #00cc99;
  background-color: #fff;
  border-color: #00cc99;
}


</style>

	<c:forEach items="${flwlist}" var="member"  varStatus="status">
		<div class="col-lg-6 col-md-6 col-sm-12 mb-3" id="flw-card-${member.mno}" >
			<div class="card" >
				<div class="card-body">
					<div class="media">
						<img class="mr-3 profile-large" src="${member.profileImagePath}"
							alt="/img/default-profile-img">
						<div>
							<h4 style ="text-align: center"><a class="c-pointer" onclick="goToFeed(${member.mno})">${member.nickname}</a></h4>
							<button class="btn btn-primary "
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
    
    <form  action="flwlist" id="listForm" method="post">
        <input type="hidden" name="pageNo">
    </form>
	<form action="flwdelete" id="deleteForm" method="post">
		<input type="hidden" name="flw">
	</form>
	
	
<script>

function removeFlw(mno) {
    
    $.ajax({
        url : "/app/follow/flwdelete",
        type: "post",
        data : {
            "flw" : mno,
        },
        success : function(data) {
             if (data == true) {
               commonAlert('success','언팔로우 되었습니다.');
               $('#flw-card-' + mno).remove();
               
            } else {
                commonAlert('error','문제가 발생하였습니다.');
            } 
            
        },
        error: (xhr, status, msg) => {
            console.log(xhr);
            console.log(status);
            console.log(msg);
        }
    });
}
    

 function goPage(pageNo){
    
    $('#listForm input[name="pageNo"]').val(pageNo);
    $('#listForm').submit();
    
} 
</script>
