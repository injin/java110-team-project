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
        
        <div class="slidecontainer">
            <fmt:parseNumber var="maxTime" type="number" value="${tmdbMovie.runtime * 60}" />
            <input type="range" min="0" max="${maxTime}" value="0" class="range-slider" id="myRange">
        </div>
        
        <div class="input-group mb-2">
          <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"><i class="far fa-clock"></i></span>
          </div>
          <input type="text" class="form-control" placeholder="장면시간" aria-label="장면시간"
                aria-describedby="basic-addon1" name="srTime" id="srTime" value="00:00:00">
        </div>
        
        <div class="input-group mb-2">
          <div class="input-group-prepend">
            <span class="input-group-text" id="basic-addon1"><i class="fas fa-film"></i></span>
          </div>
          <input type="text" class="form-control" placeholder="장면제목" aria-label="장면제목"
                aria-describedby="basic-addon1" name="srTitle">
        </div>
        
        <div class="input-group mb-2">
          <div class="input-group-prepend">
            <span class="input-group-text"><i class="fas fa-align-left"></i></span>
          </div>
          <textarea class="form-control" placeholder="장면내용" aria-label="장면내용" rows="5"></textarea>
        </div>
        
        <div class="input-group mb-2">
            <input type="file" class="form-control-file" id="srImg">
        </div>
        
        <div class="input-group mb-2">
            <label class="switch mr-2">
              <input type="checkbox" class="default" id="blSpo">
              <span class="slider round"></span>
            </label>
            <label for="blSpo">스포여부</label>
        </div>
        
        
      </div>
        
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary">등록</button>
      </div>
    </div>
  </div>
</div>