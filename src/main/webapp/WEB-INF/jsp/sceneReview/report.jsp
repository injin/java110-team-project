<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" id="report">
        <form action='add' method='post' enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">신고하기</h5>
                    
                    <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>


                </div> <!-- modal-header -->
                <div class="modal-body p-4">
                
                    <label><input type="checkbox" name="reportType" value="선정적/욕설/비방"> 선정적/욕설/비방</label><br>
                    <label><input type="checkbox" name="reportType" value="다른 영화 사진"> 다른 영화 사진</label><br>
                    <label><input type="checkbox" name="reportType" value="부정확한 내용"> 부정확한 내용</label><br>
                    <label><input type="checkbox" name="reportType" value="기타"> 기타</label><br>
                    <div class="form-group">
                        <textarea name="cont" class="form-control"
                            rows="7"
                            placeholder="신고 내용을 작성해주세요"></textarea>
                    </div>
                    
                    <div class="btn-group">
    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div><!-- /btn-group -->
  <div class="btn-group">
    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div><!-- /btn-group -->
  <div class="btn-group">
    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div><!-- /btn-group -->
  <div class="btn-group">
    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div><!-- /btn-group -->
  <div class="btn-group">
    <a href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-ellipsis-h"></i></a>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="#">Action</a>
      <a class="dropdown-item" href="#">Another action</a>
      <a class="dropdown-item" href="#">Something else here</a>
      <div class="dropdown-divider"></div>
      <a class="dropdown-item" href="#">Separated link</a>
    </div>
  </div><!-- /btn-group -->
</div>
                 
            
                </div>
                <!-- modal-body -->
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" onclick="">확인</button>
                </div>
            </div>
        </form>

    </div>
</div>