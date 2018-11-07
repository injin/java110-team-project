<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<form action='add' method='post' enctype="multipart/form-data">
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
				<div class="input-group mb-2">
					<div class="input-group-prepend">
						<div class="input-group-text">친구태그하기</div>
					</div>
					<input type="text" class="form-control" id="inlineFormInputGroup"
						placeholder="태그할 팔로우를 작성해주세요">
				</div>
				
					<div class="form-group">
						<div class="file btn btn-lg btn-primary"
							onclick="document.getElementById('file').click();">
							<i class="far fa-image"></i> 사진 <input type="file" size="30"
								id="file" style="display: none;" accept="image/*"
								class="picupload" click-type="type2" id="picupload" multiple />
						</div>
						<!--user post text -wrap end-->
						<ul id="media-list" class="clearfix">
							<li class="myupload"><span><i class="fa fa-plus"
									aria-hidden="true"></i></span></li>
						</ul>
					</div>
				
			</div>
			<!-- modal-body -->

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
				<button type="submit" class="btn btn-primary">SUBMIT</button>
			</div>
			</div>
			</form>
		
	</div>
</div>