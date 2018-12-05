<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- ====================================== Modal ============================================= --%>

<div class="modal fade" id="editingModal" tabindex="-1" role="dialog"><!--  -->
  <div class="modal-dialog modal-lg" role="document" id="rModal"><!--  -->
    <form action="add" method="post" enctype="multipart/form-data">
      <div class="modal-content">
      <input type="hidden" id="pstno">
      
        <div class="modal-header form-inline">
          <h5 class="modal-title" style="margin-right: 1rem">리뷰 수정 </h5>

<%-- ====================================== 영화검색 ============================================ --%>
          <input type="hidden" id="pstTypeNo" name="pstTypeNo"><!--  -->
          
          <div class="input-group ui-widget ui-front onlyMovie msearch" style="width:29em">
            <div class="input-group-prepend">
              <div class="input-group-text">영화</div>
            </div>
            <input type="text"
                class="form-control ui-autocomplete-input ui-autocomplete-loading"
                id="movieSearch" name="title" autocomplete="off"><!--  -->
                <!--  placeholder="영화를 검색해주세요" -->
            <input type="hidden" id="movieId" name="mvno" value="0"><!--  -->
          </div>
          
<%-- ==================================== 공개 여부 스위치 ======================================== --%>
          <label class="switch">
            <input type="checkbox" name="open" class="open" checked>
            <span class="slider round">
              <i id="lock" class="fas fa-lock l" style="display: none;"></i>
              <i id="globe" class="fas fa-globe-americas g" style=""></i>
            </span>
          </label>
          
<%-- ===================================== 모달 닫기 ============================================ --%>
          <button type="button" class="close" data-dismiss="modal"
               aria-label="Close" style="margin-left: 0px">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        
<%-- ===================================== 모달 헤더 ============================================ --%>
        <div class="modal-body">
        
<%-- ===================================== 리뷰 작성 ============================================ --%>
          <div class="form-group">
            <textarea name="content" class="form-control" rows="10"
                 id="editingTxtarea" placeholder="리뷰를 작성해주세요"></textarea><!--  -->
          </div>
          
<%-- ===================================== 리뷰 작성 ============================================ --%>
<%--
          <div class="input-group" style="text-align: auto;">
            <div class="input-group-prepend">
              <div class="input-group-text">친구태그하기</div>
            </div>
            <section id="examples"><!--  -->
              <div class="example example_objects_as_tags">
                <div class="bs-example ftag">
                  <input type="text" id="editingFlw"/><!--  -->
                </div>
              </div>
            </section>
            <input type="hidden" id="ftagsForAdd" name="ftagsForAdd" value="-1" /><!--  -->
          </div>
--%>
<%-- ===================================== 사진 첨부 ============================================ --%>
          <div class="form-group">
            <div class="file btn btn-primary photo-star-section"
                 onclick="document.getElementById('picupload1').click();">
              <i class="far fa-images"></i>사진 
              <input type="file" size="30"
                   style="display: none;" accept="image/*" class="picupload"
                   id="picupload1" name="files" multiple /><!--  -->
            </div>
            
<%-- ===================================== 별 점 =============================================== --%>
            <button class="btn btn-primary onlyMovie photo-star-section"
                 type="button" id="starbtn"><!--  -->
              <i class="far fa-star"></i>별점
            </button>
            <input type="hidden" id="star" name="star" value="0"/><!--  -->
            <div class='starrr onlyMovie photo-star-section' id="showStar"></div><!--  -->
            
<%-- ================================= 사진 보이는 list ========================================== --%>
            <ul id="media-list" class="clearfix"><!--  -->
              <li class="myupload ">
                <span>
                  <i class="fa fa-plus" aria-hidden="true"></i>
                </span>
              </li>
            </ul>
          </div>
        </div>
        <!-- modal-body -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
          <button type="submit" class="btn btn-primary" id="modalSubmit">SUBMIT</button>
        </div>
        
      </div>
    </form>
  </div>
</div>