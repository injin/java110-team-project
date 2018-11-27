<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="mgrModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document" id="rModal">
        <form action="add" method="post">
            <div class="modal-content">

                <div class="modal-header form-inline">
                    <h5 class="modal-title" >보관함 수정</h5>
                    
                    <c:choose>
                                <c:when test="${sceneAlbum.open == 'true'}">
                                    <div class="row">
                                        <span style="margin-left: 1.3rem;"><i
                                            class="fas fa-globe-americas globe"
                                            style="float: right; margin: 0.2rem;"></i></span>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="row">
                                        <span style="margin-left: 1.3rem;"><i
                                            class="fas fa-lock lock"> </i></span>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                    
                    <!-- 모달 닫기 -->
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close" style="margin-left: 0px">
                        <span aria-hidden="true">&times;</span>
                    </button>

                </div>
                <!-- modal-header -->

                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" name="lbmTitle" class="form-control"
                            id="albumTitle" placeholder="보관함명">
                    </div>
                
                    <label style="margin-right: 1rem;"><input type="radio" name="open" value="true" checked>전체공개</label>
                    <label><input type="radio" name="open" value="false">나만보기</label>
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