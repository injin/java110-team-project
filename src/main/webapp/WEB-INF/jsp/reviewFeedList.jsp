<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="/js/bootstrap.js"></script>
</head>
<body>

	<jsp:include page="include/header.jsp"></jsp:include>


	<main role="main" class="container">
	<div class="jumbotron">
		<h1>Navbar example</h1>
		<button type="button" class="btn btn-primary" data-toggle="modal"
			data-target="#exampleModal">일상리뷰</button>

	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">일상리뷰 작성하기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<textarea class="form-control" id="exampleFormControlTextarea1"
							rows="3" placeholder="리뷰를 작성해주세요"></textarea>
					</div>
					<div class="form-group row">
						<label for="inputFriend" class="col-sm-2 col-form-label">친구
							태그하기</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputFriend">
						</div>
					</div>
					<form>
						<div class="form-group">
							<div class="file btn btn-lg btn-primary"
								onclick="document.getElementById('file').click();">
								<img height="25px" width="25px" alt="pic" src="/img/anonymous.png"> <!-- 사진 변경하면됨 -->
								사진 <input type="file" size="30" id="file" style="display: none;"
									accept="image/*"
									onchange="document.getElementById('img1').value=this.value;"
									multiple />
							</div>
						</div>
					</form>
				</div>
				<!-- modal-body -->

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CANCEL</button>
					<button type="submit" class="btn btn-primary">SUBMIT</button>
				</div>
			</div>
		</div>
	</div>
	</main>

	<jsp:include page="include/footer.jsp"></jsp:include>

	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>

	<script type="text/javascript">
        
    </script>
</body>
</html>