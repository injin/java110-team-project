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
      <div class="modal-body p-4">
        
        <form action="add" method="post" id="srAddForm" enctype="multipart/form-data">
            <!-- 장면시간 슬라이더 -->
            <div class="slidecontainer">
                <fmt:parseNumber var="maxTime" type="number" value="${tmdbMovie.runtime * 60}" />
                <input type="range" min="0" max="${maxTime}" value="0" class="range-slider" id="srTimeSlider">
            </div>
            
            <!-- 장면시간 -->
            <div class="input-group mb-2">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="far fa-clock"></i></span>
              </div>
              <input type="text" class="form-control is-invalid" placeholder="장면시간" aria-label="장면시간"
                    aria-describedby="basic-addon1" name="time" id="time" value="00:00:00" autocomplete="off">
              <div class="invalid-feedback">등록 불가능한 시간입니다.</div>
              <div class="valid-feedback">등록 가능한 시간입니다.</div>
              <!-- <input type="hidden" name="time"> -->
            </div>
            
            <!-- 장면제목 -->
            <div class="input-group mb-2">
              <div class="input-group-prepend">
                <span class="input-group-text" id="basic-addon1"><i class="fas fa-film"></i></span>
              </div>
              <input type="text" class="form-control" placeholder="장면제목" aria-label="장면제목"
                    aria-describedby="basic-addon1" name="title" autocomplete="off">
            </div>
            
            <!-- 장면내용 -->
            <div class="input-group mb-2">
              <div class="input-group-prepend">
                <span class="input-group-text"><i class="fas fa-align-left"></i></span>
              </div>
              <textarea class="form-control" placeholder="장면내용" name="cont" aria-label="장면내용" rows="5"></textarea>
            </div>
            
            <!-- 파일 선택 -->
            <div class="input-group mb-2">
                <input type="file" class="form-control-file" name="phot" accept="image/*">
            </div>
            
            <!-- 스포여부 -->
            <div class="input-group mb-2">
                <label class="switch mr-2">
                  <input type="checkbox" class="default" id="tfSpo">
                  <span class="slider round"></span>
                </label>
                <label for="blSpo">스포여부</label>
                <input type="hidden" name="spo">
            </div>
            
            <input type="hidden" name="mvno" value="${tmdbMovie.id}">
            <input type="hidden" name="movie.mvno" value="${tmdbMovie.id}">
            <input type="hidden" name="movie.title" value="${tmdbMovie.title}">
        </form>
        
      </div>
        
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" onclick="addSceneReview()">등록</button>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="srAlbumAddModal" tabindex="-1" role="dialog" aria-labelledby="srAlbumAddModalTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">보관하기</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body p-4 scrollbar-light-blue">
        <c:choose>
            <c:when test="${not empty sceneAlbumList}">
                <c:forEach items="${sceneAlbumList}" var="album">
                    <div class="card mt-1">
                        <div class="card-body">
                            <div class="media">
                              <c:if test="${album.include == true}">
                                <img class="mr-3" src="/img/btn-box.png" alt="앨범 이미지">
                              </c:if>
                              <c:if test="${album.include == false}">
                                <img class="mr-3" src="/img/btn-box-empty.png" alt="앨범 이미지">
                              </c:if>
                              <div class="media-body">
                                <h5 class="mt-0">${album.lbmTitle}
                                    <c:if test="${album.include == true}">
                                        <button type="button" class="btn btn-secondary float-right" disabled>보관됨</button>
                                    </c:if>
                                    <c:if test="${album.include == false}">
                                        <button type="button" class="btn btn-primary float-right" 
                                            onclick="addToSrlAlbum(${album.lbmno})">보관하기</button>
                                        <form id="addSrAlbumForm" action="addToSrAlbum" method="post">
                                            <input type="hidden" name="lbmno" value="">
                                            <input type="hidden" name="srno" value="${sceneReview.srno}">
                                        </form>
                                        
                                    </c:if>
                                </h5>
                              </div>
                            </div>
                        </div>
                    </div>
                    
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="alert alert-light" role="alert">
                    <span>등록된 장면앨범이 없습니다. <br>정보수정 메뉴에서 장면앨범을 만들어 주세요.</span>
                </div>
            </c:otherwise>
        </c:choose>
      </div>
    </div>
  </div>
</div>