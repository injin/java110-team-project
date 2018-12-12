<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<section>
	<div class="container">
		<div class="row mbr-justify-content-center">

			<!-- 검색결과 -->
			<c:choose>
				<c:when
					test="${fn:length(memberList) == 0 && totalResults == 0 && fn:length(hashList) == 0}">
					<div class="col-lg-12 mbr-col-md-12">
						<div class="col-centered">
							<div>
								<p class="result titleFont">
									'<b>${keyword}</b>'에 대한 검색 결과가 없습니다.
								</p>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col-lg-12 mbr-col-md-12">
						<div class="col-centered">
							<div>
								<p class="result titleFont">
									'<b>${keyword}</b>'에 대한 통합검색 결과입니다.
								</p>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
			
			<!-- 회원 -->
			<c:if test="${fn:length(memberList) > 0}">
				<div class="col-lg-12 mbr-col-md-12 resultMember">
					<div class="col-centered">

						<div class="wrap search_header">
							<div class="text-wrap vcenter">
								<h2 class=" mbr-bold mbr-section-title3 display-5">
									회원 <span>검색결과</span>
								</h2>
							</div>
						</div>
					</div>

					<!-- 회원 목록 -->
					<c:forEach items="${memberList}" var="list" varStatus="status"
						begin="0" end="${fn:length(memberList)}">
						<div
							class="${status.index>=3 ? 'memberFrame showType' : 'memberFrame'}">
							<div class="wrap member c-pointer" onclick="goToFeed(${list.mno})">
								<div class="ico-wrap">

									<c:set var="path" value="${list.p_phot}" />
									<c:choose>
										<c:when test="${empty path}">
											<div>
												<img class="img" src="/img/default-profile-img.png"
													alt="${list.title}">
											</div>
										</c:when>
										<c:otherwise>
											<div>
												<img class="img" src="${list.p_phot}" alt="${list.mno}">
											</div>
										</c:otherwise>
									</c:choose>

								</div>
								<div class="text-wrap vcenter">
									<p class="mbr-text display-6 text-dark c-pointer">${list.nick}</p>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 회원 목록 -->

					<c:if test="${fn:length(memberList) > 3}">
						<c:set var="type" value="mb" />
						<div class="wrap search_footer" id="showAllMembers"
							onclick="showMoreInSearchResult(${fn:length(memberList)}, '${type}')">
							<div class="text-wrap vcenter">
								<p>더 보기</p>
							</div>
						</div>
					</c:if>
				</div>
			</c:if>
			<!-- 회원 -->
<%-- 
            <!-- 장면앨범 -->
            <c:if test="${fn:length(memberList) > 0}">
                <div class="col-lg-12 mbr-col-md-12 resultMember">
                    <div class="col-centered">

                        <div class="wrap search_header">
                            <div class="text-wrap vcenter">
                                <h2 class=" mbr-bold mbr-section-title3 display-5">
                                    회원 <span>검색결과</span>
                                </h2>
                            </div>
                        </div>
                    </div>

                    <!-- 장면앨범 목록 -->
                    <c:forEach items="${memberList}" var="list" varStatus="status"
                        begin="0" end="${fn:length(memberList)}">
                        <div
                            class="${status.index>=3 ? 'memberFrame showType' : 'memberFrame'}">
                            <div class="wrap member c-pointer" onclick="goToFeed(${list.mno})">
                                <div class="ico-wrap">

                                    <c:set var="path" value="${list.p_phot}" />
                                    <c:choose>
                                        <c:when test="${empty path}">
                                            <div>
                                                <img class="img" src="/img/default-profile-img.png"
                                                    alt="${list.title}">
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div>
                                                <img class="img" src="${list.p_phot}" alt="${list.mno}">
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="text-wrap vcenter">
                                    <p class="mbr-text display-6 text-dark c-pointer">${list.nick}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <!-- 장면앨범 목록 -->

                    <c:if test="${fn:length(memberList) > 3}">
                        <c:set var="type" value="mb" />
                        <div class="wrap search_footer" id="showAllMembers"
                            onclick="showMoreInSearchResult(${fn:length(memberList)}, '${type}')">
                            <div class="text-wrap vcenter">
                                <p>더 보기</p>
                            </div>
                        </div>
                    </c:if>
                </div>
            </c:if>
            <!-- 장면앨범 -->
 --%>
			<!-- 영화 -->
			<c:if test="${totalResults > 0}">
				<div class="col-lg-12 mbr-col-md-12 resultMovie">
					<div class="col-centered">
						<div class="wrap search_header">
							<div class="text-wrap vcenter">
								<h2 class=" mbr-bold mbr-section-title3 display-5">영화 검색결과</h2>
							</div>
						</div>
					</div>



					<!-- 영화 목록 -->
					<c:forEach items="${movieList}" var="list" varStatus="status"
						begin="0" end="${totalResults}">
						<!-- begin="0" end="2" -->
						<div
							class="${status.index>=3 ? 'movieFrame showType' : 'movieFrame'}">
							<%-- id="post-${status.index}" --%>


							<div class="wrap movie">
								<div class="ico-wrap col-lg-4">

									<c:set var="path" value="${list.posterPath}" />
									<c:choose>
										<c:when test="${empty path}">
											<div>
												<img class="img" src="/img/default-movie-img.png"
													alt="${list.title}">
											</div>
										</c:when>
										<c:otherwise>
											<div>
												<img class="img" src="${imgPrefix}/${list.posterPath}"
													alt="${list.title}">
											</div>
										</c:otherwise>
									</c:choose>

								</div>
								<!-- "  mbr-text display-6" -->
								<div class="text-wrap vcenter mbr-text display-6 col-lg-8">
									<h5>
										<b><a
											href="<c:url value='/app/sceneReview/review?mvno=${list.id}'/>"
											class="titleFont">${list.title}</a></b>

										<!-- /app/sceneReview/review?movieId=${list.id} -->
										<c:if test="${!empty list.releaseDate}">
											<span class="smTxt">(${list.releaseDate})</span>
										</c:if>
									</h5>
									<c:choose>
										<c:when test="${!empty list.overview}">
											<div class="overView">${list.overview}</div>
										</c:when>
										<c:otherwise>
											<div class="overView">
												<br>줄거리가 없습니다.
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 영화목록 -->

					<c:if test="${totalResults > 3}">
						<c:set var="type" value="mv" />
						<div class="wrap search_footer" id="showAllMovies"
							onclick="showMoreInSearchResult(${totalResults}, '${type}')">
							<div class="text-wrap vcenter">
								<p>더 보기</p>
							</div>
						</div>
					</c:if>
				</div>
			</c:if>
			<!-- 영화 -->

			<!-- 해시태그 -->
			<c:if test="${fn:length(hashList) > 0}">
				<div class="col-lg-12 mbr-col-md-12 resultTag">
					<div class="col-centered">
						<div class="wrap search_header">
							<div class="text-wrap vcenter">
								<h2 class=" mbr-bold mbr-section-title3 display-5">게시물 해쉬태그</h2>
							</div>
						</div>
					</div>


					<%-- 포스터 보이는 부분 --%>
					<c:forEach items="${hashList}" var="post" varStatus="status"
						begin="0" end="${fn:length(hashList)}">
						<c:if test="${post.open}">
							<div
								class="gPost ${status.index>=3 ? 'tagFrame showType' : 'tagFrame'}">
								<div class="media row pr-3 pl-3">
									<img class="rprofileImg" src="${post.member.profileImagePath}" />
									<div class="media-body">
										<ul class="memberul">
											<li><span onclick="goToFeed(${post.member.mno})"
												class="text-dark c-pointer">${post.member.nickname}</span></li>
											<c:if test="${not empty post.ftags}">
												<li><c:forEach items="${post.ftags}" var="ftag">
														<span
															<%-- onclick="goToFeed(${post.ftags.mno})" --%> class="tagName c-pointer">
															${ftag.nickname} </span>
													</c:forEach></li>
											</c:if>
										</ul>
										<span class="cmt-date">&nbsp;<fmt:formatDate
												pattern="yyyy-MM-dd hh:mm:ss" value="${post.createdDate}" /></span>
										<c:if test="${post.pstTypeNo ==0}">
											<p class="dptitle">
												<b><i>${post.title}</i></b>
											</p>
										</c:if>
									</div>
								</div>


								<%-- 내용보여주는부분 --%>
								<div class="clearfix media row m-1">
									<div class="media-body">
										<p class="reviewCont" id="reviewCont-${post.pstno}">
											<script>
                                        showCont("${post.content}",
                                                "${post.pstno}");
                                    </script>
										</p>
									</div>
									<c:if test="${post.photos[0] !=null}">
										<%-- 이미지 클릭시 상세모달로 --%>
										<div class="image">
											<img onclick="openDetailModal(${post.pstno})"
												src="/upload/post/${post.photos[0]}"
												data-title="${post.title}"
												class="pstImgtoDetail img-responsive" /> <input
												type="hidden" data-toggle="modal" id="detailPst"
												data-target="#detailModal" />
											<c:if test="${fn:length(post.photos)>1}">
												<div class="text">
													<p>${fn:length(post.photos)-1}장+</p>
												</div>
											</c:if>
										</div>
									</c:if>
								</div>


								<div class="row">

									<%-- 좋아요 --%>
									<div class="col-6 text-left">
										<i
											class="fas fa-thumbs-up btmIcon c-pointer likeColor 
                   <c:if test="${empty sessionScope.loginUser}"> disabled</c:if>
                   <c:if test="${!post.likeCheck}"> dis-none</c:if>"
											id="btn-like-full-${post.pstno}"
											onclick="cancelLike(${post.pstno},${post.pstTypeNo})"></i> <i
											class="far fa-thumbs-up btmIcon c-pointer likeColor 
                   <c:if test="${empty sessionScope.loginUser}"> disabled</c:if>
                   <c:if test="${post.likeCheck}"> dis-none</c:if>"
											id="btn-like-empty-${post.pstno}"
											onclick="addLike(${post.pstno},${post.pstTypeNo});"></i> <span
											id="lCnt-${post.pstno}">${post.likeCnt}</span> <i
											class="far fa-comment btmIcon c-pointer"
											onclick="showMore(this,${post.pstno})"></i> <span
											id="cCnt-${post.pstno}">${post.cmtCnt}</span>
									</div>

									<%-- 별점 --%>
									<c:if test="${post.pstTypeNo ==0}">
										<div class='col-6 text-right'>
											<c:if test="${0 ne post.star}">
												<c:forEach begin="1" end="5" var="x">
													<c:choose>
														<c:when test="${x le post.star}">
															<i class="fas fa-star sStar"></i>
														</c:when>
														<c:otherwise>
															<i class="far fa-star sStar"></i>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</c:if>
										</div>
									</c:if>

								</div>

							</div>
						</c:if>
					</c:forEach>

					<!-- 더보기 -->
					<c:if test="${fn:length(hashList) > 3}">
						<c:set var="type" value="tg" />
						<div class="wrap search_footer" id="showAllTags"
							onclick="showMoreInSearchResult(${fn:length(hashList)}, '${type}')">
							<div class="text-wrap vcenter">
								<p>더 보기</p>
							</div>
						</div>
					</c:if>
				</div>
			</c:if>
			<!-- 해시태그 -->

		</div>
	</div>
</section>
