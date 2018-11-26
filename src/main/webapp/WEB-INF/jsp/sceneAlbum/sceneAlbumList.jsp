<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="row mbr-justify-content-center">
		<div class="col-lg-12 mbr-col-md-12" >
          <!--  <div class="row col-lg-9" style="float:right; border-right:1px solid silver; 
                      border-left:1px solid silver;" >
			<div class="a_btn btn btn-success btn-lg"
				onclick="document.getElementById('btnAlbum').click();" 
				style="margin-top: 1rem; ">
				앨범만들기<input type="hidden" data-toggle="modal" id="btnAlbum"
					data-target="#albumModal" />
			</div>
           </div> -->
			<!-- 앨범 목록 -->
			<div class="row albumList col-lg-9" >
			<div class="col-lg-12" style="float:right;" >
            <div class="a_btn btn btn-success btn-lg"
                onclick="document.getElementById('btnAlbum').click();" 
                style="margin-top: 1rem; ">
                앨범만들기<input type="hidden" data-toggle="modal" id="btnAlbum"
                    data-target="#albumModal" />
            </div>
           </div>
				<c:forEach items="${sceneAlbumList}" var="album">
					<!-- begin="0" end="5" -->
					<!-- 앨범 하나 -->

					<div class="row" style="margin: 0;">
						<div class="album" onclick="albumDetail('${album.lbmTitle}')"
						  style="cursor: pointer;">
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
				<form action="detail" method="get" id="detailForm">
					<input type="hidden" name="lbmTitle">
				</form>
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
				<form class="listForm" action="list" method="post">
					<input type="hidden" name="pageNo">
				</form>

			</div>
		</div>

	</div>
</section>
