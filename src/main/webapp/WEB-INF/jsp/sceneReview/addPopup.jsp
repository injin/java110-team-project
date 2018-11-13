<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="../include/top.jsp" %>

<div class="modal fade" id="srAddModal" tabindex="-1" role="dialog" aria-labelledby="srAddModalTitle" aria-hidden="true">
  <div class="modal-dialog " role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="srAddModalTitle">장면추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"><i class="far fa-clock"></i></span>
          </div>
          <input type="text" class="form-control" placeholder="장면시간" aria-label="장면시간"
                aria-describedby="basic-addon1" name="srTime" id="srTime">
        </div>
        
        <div class="input-group mb-3">
          <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"><i class="fas fa-film"></i></span>
          </div>
          <input type="text" class="form-control" placeholder="장면제목" aria-label="장면제목"
                aria-describedby="basic-addon1" name="srTitle">
        </div>
        
        
        <fmt:parseNumber var="maxTime" type="number" value="${tmdbMovie.runtime * 60}" />
        <input type="range" min="0" max="${maxTime}" value="50" class="slider" id="myRange">
        
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">등록</button>
      </div>
    </div>
  </div>
</div>