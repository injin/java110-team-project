<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" id="report">
        <form name="reportForm" method="post">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body p-4">
                    <label><input type="checkbox" name="reportType" value="1"> 선정적/욕설/비방</label><br>
                    <label><input type="checkbox" name="reportType" value="2"> 다른 영화 사진</label><br>
                    <label><input type="checkbox" name="reportType" value="3"> 부정확한 내용</label><br>
                    <label><input type="checkbox" name="reportType" value="4"> 기타</label><br>
                    <div class="form-group">
                        <textarea name="cont" class="form-control" rows="7"
                            placeholder="신고 내용을 작성해주세요"></textarea>
                    </div>
                    
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="reportSceneReview()">확인</button>
                </div>
            </div>
        </form>
    </div>

</div>
