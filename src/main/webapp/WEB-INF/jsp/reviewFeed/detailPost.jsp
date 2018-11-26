<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->



<div class="modal fade" id="detailModal" tabindex="-1" role="dialog">
	<div class="modal-dialog modal-lg" role="document" id="rModal"
		style="max-width: 70rem;">
		<div class="modal-content">

			<div class="modal-header">
				<%--  <c:if test="${post.pstTypeNo ==0}"> --%>
				<p style="float: right; font-size: 1.5rem; margin-bottom: 0;">
					<b><i>영화 제목</i></b>
				</p>
				<%--  </c:if> --%>



				<!-- 모달 닫기 -->
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" style="margin-left: 0px">
					<span aria-hidden="true">&times;</span>
				</button>

			</div>
			<!-- modal-header -->

			<div class="modal-body row">


				<%-- 왼쪽 col,사진부분 --%>
				<div class="col-8">

					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="0"
								class="active"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
							<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<img class="d-block w-100" src="/img/default-profile-img.png"
									alt="First slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="/img/default-profile-img.png"
									alt="Second slide">
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="/img/default-profile-img.png"
									alt="Third slide">
							</div>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>

				<%-- 오른쪽 col --%>
				<div class="col-4">

					<div class="media row" style="padding: 0 1rem">
						<img src="/img/default-profile-img.png"
							style="width: 2.5rem; height: 2.5rem; border-radius: 50%; margin-right: 0.5rem;" />
						<div class="media-body">
							<ul
								style="float: left; list-style: none; padding-left: 0; margin-bottom: 0">
								<li><a href="#" style="color: black;">닉네임</a></li>
								<li><a data-toggle="dropdown" id="fDropdown" href="#"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"
									style="color: blue; font-size: 0.2rem; vertical-align: top;">
										친구태그 </a></li>
							</ul>

						</div>
					</div>

					<p class="reviewCont" style="border: 1px solid silver;">
						내용
						<!-- <script>
                                        showCont("${post.content}",
                                                "${status.index}");
                                    </script> -->
					</p>


					<div class="row">

						<%-- 좋아요 --%>
						<div class="col-6" style="text-align: left;">
							<a href="#" style="color: black"> <i
								class="far fa-thumbs-up btmIcon" style="color: red;"></i>0
							</a> <a href="#" style="color: black"> <i
								class="far fa-comment btmIcon"></i>0
							</a>
						</div>

						<%-- 별점 --%>
						<%-- <c:if test="${post.pstTypeNo ==0}"> --%>
						<div class='col-6' style="text-align: right;">
							<%-- <c:if test="${0 ne post.star}"> --%>
							<c:forEach begin="1" end="5" var="x">
								<c:choose>
									<c:when test="${x le 5}">
										<i class="fas fa-star sStar"></i>
									</c:when>
									<c:otherwise>
										<i class="far fa-star sStar"></i>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- </c:if> --%>
						</div>
						<%-- </c:if> --%>
					</div>





					<div class="row col" style="margin: 0; padding: 0;">
					<%-- 댓글 작성란 --%>
                        <div class="card mb-2">
                            <div class="media" style="padding: .5rem;">
                                <div>
                                    <img class="mr-2 profile-medium"
                                        src="/img/default-profile-img"
                                        alt="Generic placeholder image">
                                    <div>닉네임</div>
                                </div>
                                <div class="media-body text-right" >
                                    <textarea class="form-control" name="cont"
                                        placeholder="Write a comment"></textarea>
                                </div>
                                <button type="button" class="btn btn-dark mt-2"
                                        onclick="addCmt()" style="height: 3rem;padding: 0 .5rem;">
                                        <i class="fas fa-paper-plane"></i> 등록
                                    </button>
                            </div>
                        </div>
                        
                        <%-- 댓글리스트 --%>
						<div class="comment-main rounded m-0">
						
							<ul class="p-0">
								<li>
									<div class="row comment-box p-1 pt-3 pr-4">
										<div class="col-3 user-img text-center">
											<img src="/img/default-profile-img.png" class="main-cmt-img">
											<label >닉네임</label>
										</div>
										<div class="col-9 user-comment bg-light rounded">
													<p class="w-100 p-2 m-0">Lorem ipsum dolor sit
														amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit
														amet.Lorem ipsum dolor sit amet.</p>
													<p class="w-100 p-2 m-0">
														<span class="float-right">
														<i class="fa fa-clock mr-1" aria-hidden="true"></i>
														01 : 00</span>
													</p>
										</div>
									</div>
								</li>
								<li>
                                    <div class="row comment-box p-1 pt-3 pr-4">
                                        <div class="col-3 user-img text-center">
                                            <img src="/img/default-profile-img.png" class="main-cmt-img">
                                            <label >닉네임</label>
                                        </div>
                                        <div class="col-9 user-comment bg-light rounded">
                                                    <p class="w-100 p-2 m-0">Lorem ipsum dolor sit
                                                        amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit
                                                        amet.Lorem ipsum dolor sit amet.</p>
                                                    <p class="w-100 p-2 m-0">
                                                        <span class="float-right">
                                                        <i class="fa fa-clock mr-1" aria-hidden="true"></i>
                                                        01 : 00</span>
                                                    </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row comment-box p-1 pt-3 pr-4">
                                        <div class="col-3 user-img text-center">
                                            <img src="/img/default-profile-img.png" class="main-cmt-img">
                                            <label >닉네임</label>
                                        </div>
                                        <div class="col-9 user-comment bg-light rounded">
                                                    <p class="w-100 p-2 m-0">Lorem ipsum dolor sit
                                                        amet.Lorem ipsum dolor sit amet.Lorem ipsum dolor sit
                                                        amet.Lorem ipsum dolor sit amet.</p>
                                                    <p class="w-100 p-2 m-0">
                                                        <span class="float-right">
                                                        <i class="fa fa-clock mr-1" aria-hidden="true"></i>
                                                        01 : 00</span>
                                                    </p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="row comment-box p-1 pt-3 pr-4">
                                        <div class="col-3 user-img text-center">
                                            <img src="/img/default-profile-img.png" class="main-cmt-img">
                                            <label >닉네임</label>
                                        </div>
                                        <div class="col-9 user-comment bg-light rounded">
                                                    <p class="w-100 p-2 m-0">Lorem ipsum dolor sit
                                                        amet.Lorem ipsum dolor sit amet.</p>
                                                    <p class="w-100 p-2 m-0">
                                                        <span class="float-right">
                                                        <i class="fa fa-clock mr-1" aria-hidden="true"></i>
                                                        01 : 00</span>
                                                    </p>
                                        </div>
                                    </div>
                                </li>
                                
						
						</ul>
                        </div>


					</div>
				</div>


			</div>
			<!-- modal-body -->

		</div>



	</div>
</div>