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
/* MyPage */
.btn-size {
	padding: 0.1rem 0.3rem;
}

.th-fix {
	width: 15%;
	text-align: center;
}

.border {
	float: right;
	border-left: 1px solid silver;
	border-right: 1px solid silver;
}

/* ---------------*/
.container-size {
	margin-left: 200px;
	margin-right: 200px;
}
</style>


</head>
<body>

	<jsp:include page="include/header.jsp"></jsp:include>


	<main role="main" class="container">

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
			<!-- main 태그 말고 다른 태그로 !  -->
			<div class="col-12 col-md-9 col-xl-8">
				<img style="width: 52.1rem; height: 420px;"
					src="${loginUser.coverImagePath}">
				<table class="table"
					style="width: 52.1rem; border-right: 1px solid silver; border-left: 1px solid silver; margin-bottom: 0px;">
					<thead>
						<tr>
							<th scope="col" class="th-fix">나의 피드</th>
							<th scope="col" class="th-fix">정보수정</th>
							<th scope="col" class="th-fix">통 계</th>
							<th scope="col" class="th-fix">팔로우</th>
							<th scope="col" class="th-fix">활동로그</th>
							<th scope="col" class="th-fix">장면보관함</th>
						</tr>
					</thead>
				</table>
				<div class="row ml-1" style="width: 52.1rem;"></div>
			</div>
		</div>
	</div>
	<section>
		<div class="row mbr-justify-content-center">
			<div class="col-lg-12 mbr-col-md-12">
				<div class="row border col-lg-9">
					<div class="col-lg-12" style="float: right;">
						<canvas id="myChart" ></canvas> 
					</div>
				</div>
			</div>
		</div>
	</section>
	</main>

	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>
	<script src="/js/piechart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>

 <script >
 var ctx = document.getElementById("myChart").getContext('2d');
 
 var stscLabel =[];
 <c:forEach items="${stscLabel}" var ="data">
 stscLabel.push('${data.gr_nm}')
 </c:forEach>
 
 var ctx = document.getElementById("myChart").getContext('2d');
 var myChart = new Chart(ctx, {
   type: 'pie',
   data: {
     labels: stscLabel,
     datasets: [{
       backgroundColor: [
         "#2ecc71",
         "#3498db",
         "#95a5a6",
         "#9b59b6",
         "#f1c40f",
         "#e74c3c",
         "#34495e"
       ],
       data: [1,2,3,4,5,6]
     }]
   }
 });
 </script>

</body>
</html>