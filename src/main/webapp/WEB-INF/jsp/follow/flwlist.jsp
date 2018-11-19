<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>follow</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>

<style>
.profile-img {
	width: 5em;
	height: 5em;
	border-radius: 3rem;
}

.btn-size {
	padding: 0.1rem 0.3rem;
}

.th-fix {

width: 15%; 
text-align: center;

}


</style>




</head>
<body>

	<jsp:include page="../include/header.jsp"></jsp:include>



	<div class="container">
		<div class="row flex-xl-nowarp">
			<div class="col-12 col-md-3 col-xl-3">
				<form action="flwlist" method="post" enctype="multipart/form-data">
					<img class="card-img-top" src="${loginUser.profileImagePath}"
						alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">${loginUser.nickname}</h5>
						<p class="card-text">Some quick example text to build on the
							card title and make up the bulk of the card's content.</p>
					</div>
				</form>
			</div>
			<main class="col-12 col-md-9 col-xl-8">
		   <img style="width:820px; height : 450px;" src="${loginUser.coverImagePath}">
	       <table class="table">
                <thead>
                    <tr>
                        <th scope="col" class="th-fix">나의 피드</th>
                        <th scope="col" class="th-fix">정보수정</th>
                        <th scope="col" class="th-fix">통  계</th>
                        <th scope="col" class="th-fix">팔로우</th>
                        <th scope="col" class="th-fix">활동로그</th>
                        <th scope="col" class="th-fix">장면보관함</th>
                    </tr>
                </thead>
            </table>
			
			<div class="row">
				<c:forEach items="${flwlist}" var="member">
					<div class="col-lg-6 col-md-6 col-sm-12 mb-3">
						<div class="card">
							<div class="card-body">
								<div class="media">
									<img class="mr-3 profile-img" src="${member.profileImagePath}"
										alt="/img/default-profile-img">
									<div>
										<h4>${member.nickname}</h4>
										<button class="btn btn-primary btn-size"
											onclick="removeFlw(${member.mno})">언팔로우</button>
									</div>
								</div>
							</div>
							<button onclick="addFlw(${member.mno})">addtest</button>
						</div>
					</div>
				</c:forEach>
			</div>
			<nav aria-label="Page navigation example">
                    <ul class="pagination justify-content-center ">
                        <li class="page-item"><a class="page-link" href="#"
                            aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                        </a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#"
                            aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
                                class="sr-only">Next</span>
                        </a></li>
                    </ul>
                </nav>
			</main>
		
		</div>
	</div>

	<form action="flwdelete" id="deleteForm" method="post">
		<input type="hidden" name="flw">
	</form>

	<form action="flwadd" id="add" method="post">
		<input type="hidden" name="flw">
	</form>

	<jsp:include page="../include/footer.jsp"></jsp:include>
	<script type="text/javascript">


function removeFlw(number) {
    $('#deleteForm input[name="flw"]').val(number);
    $('#deleteForm').submit();
}

function addFlw(number){
  /*   $('#add input[name="flw"]').val(number);
    $('#add').submit(); */
    
    console.log(number);
    
}

</script>


</body>
</html>