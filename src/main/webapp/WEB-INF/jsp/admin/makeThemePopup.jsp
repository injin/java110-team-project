<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="themeModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document" id="rModal">
        <form action="addTheme" method="get">
            <div class="modal-content">

                <div class="modal-header form-inline">
                    <h5 class="modal-title" style="margin-right: 1rem"><b>테마 추가</b></h5>
                    
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
                        <input type="text" name="thm" class="form-control"
                         autocomplete="off" placeholder="테마명">
                    </div>
                
                </div>
                
                <!-- modal-body -->

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary"
                        data-dismiss="modal">취소</button>
                    <button type="submit" class="btn btn-primary" id="modalSubmit">등록</button>
                </div>

            </div>
        </form>
    </div>
</div>