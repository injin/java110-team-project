<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="row mbr-justify-content-center">
		<div class="col-lg-12 mbr-col-md-12">
			<!--             <div class="col-lg-3 mbr-col-md-3 profile"></div>
            <div class="col-lg-9 wrap content"></div>
            <div class="col-lg-9 content tab"></div>
 -->
			<!-- 틀잡기 -->

			<!-- 버튼 -->

			<!-- 			<div class="col text-center pst"
                                onclick="document.getElementById('btnIlsang').click();">
                                앨범만들기<input type="hidden"
                                    data-toggle="modal" data-target="#albumModal" />id="btnIlsang" 
                            </div>
 -->

			<div class="a_btn btn btn-success btn-lg"
				onclick="document.getElementById('btnAlbum').click();">
				앨범만들기<input type="hidden" data-toggle="modal" id="btnAlbum"
					data-target="#albumModal" />
			</div>

			<!-- 앨범 목록 -->
			<div class="row albumList col-lg-9">
				<c:forEach items="${sceneAlbumList}" var="album" begin="0" end="5">
					<div class="row" style="margin: 0;">
						<div class="album">
							<img src="/img/default.jpg">
							<c:choose>
								<c:when test="${album.open == 'true'}">
									<div class="row">
										<span class="overflow" style="margin-left: 1rem;"> <b>${album.lbmTitle}</b></span>
										<span style="margin-left: 1.3rem;"><i
											class="fas fa-globe-americas globe"
											style="float: right; margin: 0.2rem;"></i></span>
									</div>
								</c:when>
								<c:otherwise>
									<div class="row">
										<span class="overflow" style="margin-left: 1rem;"> <b>${album.lbmTitle}</b></span>
										<span style="margin-left: 1.3rem;"><i
											class="fas fa-lock lock"> </i></span>
									</div>
								</c:otherwise>
							</c:choose>
							<span style="font-size: 0.8rem; float: left;">14개</span> <span
								style="float: left; clear: both;">${album.cdt}</span>
						</div>
					</div>
				</c:forEach>

				<!-- 페이징버튼 -->
				
				<jsp:include page="paging.jsp" flush="true">
    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
    <jsp:param name="pageNo" value="${paging.pageNo}" />
    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
</jsp:include>


<!-- 				
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only">Previous</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only">Next</span>
						</a></li>
					</ul>
				</nav>
 -->

			</div>
		</div>

	</div>
</section>
