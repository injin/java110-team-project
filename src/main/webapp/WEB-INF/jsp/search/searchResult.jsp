<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<section>
	<div class="container">
		<div class="row mbr-justify-content-center">

			<!-- 회원 -->
			<c:if test="${fn:length(memberList) > 0}">
				<div class="col-lg-12 mbr-col-md-12 resultMember">
					<div class="col-centered">
						<div>
							<p class="result titleFont">
								'<b>${keyword}</b>'에 대한 통합검색 결과입니다.
							</p>
						</div>
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
							<div class="wrap member">
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
									<p class="  mbr-text display-6">${list.nick}</p>
								</div>
							</div>
						</div>
					</c:forEach>
					<!-- 회원 목록 -->

					<c:if test="${fn:length(memberList) > 3}">
						<div class="wrap search_footer" id="showAllMembers"
							onclick="showMore(${fn:length(memberList)})">
							<div class="text-wrap vcenter">
								<p>더 보기</p>
							</div>
						</div>
					</c:if>
				</div>
			</c:if>
			<!-- 회원 -->

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
						<div class="wrap search_footer" id="showAllMovies"
							onclick="showMore(${totalResults})">
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


					<!-- 해시태그 목록 -->
					<c:forEach items="${hashList}" var="list" varStatus="status"
						begin="0" end="${fn:length(hashList)}">

						<div class="${status.index>=3 ? 'tagFrame showType' : 'tagFrame'}">
							<div class="wrap tag">
								<div class="ico-wrap">
									<p>${list.pstno}
								</div>
								<div class="text-wrap vcenter">
									<p class=" mbr-text display-6">
										<b>${list.cont}</b>
									</p>
									<br>
								</div>
							</div>
						</div>
					</c:forEach>

					<c:if test="${fn:length(hashList) > 3}">
						<div class="wrap search_footer" id="showAllTags"
							onclick="showMore(${fn:length(hashList)})">
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
