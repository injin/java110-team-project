<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="mgrModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document" id="rModal">
		<form action="add" method="post">
			<div class="modal-content">

				<!-- Modal-Header -->
				<div class="modal-header form-inline">
					<h5 class="modal-title"></h5>

					<div class="title_box">
						${sceneAlbum.lbmTitle} <span class="title_edit"
							onclick="editTitle(${sceneAlbum.lbmno})"> <i
							class="far fa-edit" style="font-size: 1rem;"></i></span>
					</div>

					<div class="row">
						<!-- 공개여부 -->
						<c:choose>
							<c:when test="${sceneAlbum.open == 'true'}">
								<span class="openIcon"
									onclick="editOpen(${sceneAlbum.lbmno}, ${sceneAlbumopen})">
									<i class="fas fa-globe-americas globe"></i>
								</span>
							</c:when>
							<c:otherwise>
								<span class="openIcon"
									onclick="editOpen(${sceneAlbum.lbmno}, ${sceneAlbumopen})">
									<i class="fas fa-lock lock"></i>
								</span>
							</c:otherwise>
						</c:choose>

						<!-- 모달 닫기 -->
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>

				</div>
				<!-- modal-header -->

				<div class="modal-body p-0">
					<div class="row mbr-justify-content-center">
					   
					   <!-- 앨범리스트 -->
						<div class="col-lg-3 boxBorder">
							<div class="scrollbar-light-blue boxList">
								<c:forEach items="${sceneAlbumList}" var="album">
									<div class="album_title al_wrap text-center"
										onclick="editAlbum(this)" data-lbmno="${album.lbmno}"
										data-lbm-title="${album.lbmTitle}" data-open="${album.open}">
										<div class="al_overflow">${album.lbmTitle}</div>
										<i class="fas fa-trash-alt al_trash"
											onclick="removeLbm(${album.lbmno})"></i>
									</div>
								</c:forEach>
							</div>
							<div class="al_add"
								onclick="document.getElementById('btnaddAlbum').click();">
								<i class="fas fa-plus"></i>보관함 추가
							</div>
							<input type="hidden" data-toggle="modal" id="btnaddAlbum"
								data-target="#albumModal" />
						</div>

                        <!-- 앨범별 장면 출력 부분 -->
						<div class="col-lg-9 pl-0">
							<div class="srlist"></div>
						</div>
					</div>
				</div>
				<!-- modal-body -->

			</div>
		</form>
	</div>
</div>