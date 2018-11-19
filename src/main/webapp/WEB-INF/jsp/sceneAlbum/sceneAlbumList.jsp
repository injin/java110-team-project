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
			<div class="row albumList col-lg-9">
				<div class="row" style="margin: 0 auto;">
					<div class="album">
						<img src="/upload/p0.png">
						<p style="width: 7rem; display: inline;">
							<span><b>원테이크</b></span>
						</p>
						<i class="fas fa-globe-americas globe"
							style="float: right; margin: 0.3rem;"></i><br> <span
							style="font-size: 0.8rem;">14개</span><br> <span>2018-...</span>
					</div>
					<div class="album"></div>
					<div class="album"></div>
				</div>
			</div>
		</div>


	</div>
</section>
