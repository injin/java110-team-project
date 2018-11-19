<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="albumModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document" id="rModal">
		<form action="add" method="post">
			<div class="modal-content">

				<div class="modal-header form-inline">
					<h5 class="modal-title" style="margin-right: 1rem">보관함 추가</h5>
					
					<!-- 모달 닫기 -->
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" style="margin-left: 0px">
						<span aria-hidden="true">&times;</span>
					</button>

				</div>
				<!-- modal-header -->

				<div class="modal-body">
					<!-- 리뷰 작성 -->
					<div class="form-group">
						<input type="text" name="lbmTitle" class="form-control"
							id="albumTitle" placeholder="보관함명">
					</div>
				
				<label>
                    <input type="radio" name="open" value="true" checked>전체공개
                    <input type="radio" name="open" value="false">나만보기
                </label>
				</div>
				
				<!-- modal-body -->

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">CANCEL</button>
					<button type="submit" class="btn btn-primary" id="modalSubmit">SUBMIT</button>
				</div>

			</div>
		</form>
	</div>
</div>