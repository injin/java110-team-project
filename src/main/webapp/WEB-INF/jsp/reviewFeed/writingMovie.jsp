<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="movieModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document" id="filmModal">
		<form action='add' method='post' enctype="multipart/form-data">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">리뷰 작성하기</h5>
					<div class="col-8">

						<div class="input-group mb-2 ui-widget ui-front">
							<div class="input-group-prepend">
								<div class="input-group-text">영화</div>
							</div>
							<input type="text" class="form-control" id="movieSearch"
								placeholder="영화를 검색해주세요" autocomplete="off"> <input
								type="hidden" id="movieId">
						</div>
					</div>

					<!-- 공개여부 스위치 -->
					<label class="switch"> <input type="checkbox" name="open"
						class="open" checked> <span class="slider round"><i
							class="fas fa-lock lock" style="display: none;"></i><i
							class="fas fa-globe-americas globe"></i> </span>
					</label>

					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<div class="modal-body">
					<div class="form-group">
						<textarea name="content" class="form-control htxtarea" rows="10"
							placeholder="리뷰를 작성해주세요"></textarea>
					</div>
					<div class="input-group mb-2">
						<div class="input-group-prepend">
							<div class="input-group-text">친구태그하기</div>
						</div>
						<input type="text" class="form-control" name="followGroup"
							placeholder="태그할 팔로우를 작성해주세요">
					</div>

					<div class="form-group">

						<div class="file btn btn-lg btn-primary"
							onclick="document.getElementById('picupload1').click();">
							<i class="far fa-images"></i>사진 <input type="file" size="30"
								style="display: none;" accept="image/*" class="picupload"
								id="picupload1" name="files" multiple />
						</div>

						<div class="btn btn-lg btn-primary"
							onclick="document.getElementById('starbtn').click();">
							<i class="far fa-star"></i>별점 <input type="button"
								style="display: none;" id="starbtn" />
						</div>

						<div class='starrr'></div>

						<div>
							<span class='your-choice-was' style='display: none;'> <span
								class='choice' style='display: none;'></span>
							</span>
						</div>
						<!--user post text -wrap end-->
						<ul id="media-list1" class="clearfix">
							<li class="myupload "><span><i class="fa fa-plus"
									aria-hidden="true"></i></span></li>
						</ul>
					</div>
					<!-- modal-body -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">CANCEL</button>
						<button type="submit" class="btn btn-primary">SUBMIT</button>
					</div>
				</div>
		</form>
	</div>
</div>