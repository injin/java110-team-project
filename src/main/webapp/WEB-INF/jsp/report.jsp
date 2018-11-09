<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document" id="report">
        <form action='add' method='post' enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                    
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>


                </div> <!-- modal-header -->
                <div class="modal-body">
                
                    <label><input type="checkbox" name="report" value="선정적/욕설/비방"> 선정적/욕설/비방</label><br>
                    <label><input type="checkbox" name="report" value="다른 영화 사진"> 다른 영화 사진</label><br>
                    <label><input type="checkbox" name="report" value="부정확한 내용"> 부정확한 내용</label><br>
                    <label><input type="checkbox" name="report" value="기타"> 기타</label><br>
                    <div class="form-group">
                        <textarea name="content" class="form-control"
                            rows="7"
                            placeholder="신고 내용을 작성해주세요"></textarea>
                    </div>
                 
            
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