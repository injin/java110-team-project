<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>
	<div class="container" style= "height:1000px;">
		<div class="row mbr-justify-content-center">

            <!-- 회원 -->
            <div class="col-lg-12 mbr-col-md-12 col-centered">
                <div class="wrap search_header">
                    <div class="text-wrap vcenter">
                        <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">
                            회원 <span>검색결과</span>
                        </h2>
                    </div>
                </div>
            </div>

            <c:forEach items="${movieList}" var="list" begin="0" end="2">
                <div class="col-lg-12 mbr-col-md-12">
                    <div class="wrap">
                        <div class="ico-wrap">
                            <div>
                                <img  class="img" src="${imgPrefix}/${list.posterPath}" alt="${list.title}">
                            </div>
                        </div>
                        <div class="text-wrap vcenter">
                            <p class="mbr-fonts-style text1 mbr-text display-6">
                                <b>${list.title}</b>
                            </p>
                            <br>
                            <p>${list.releaseDate}</p>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="col-lg-12 mbr-col-md-12">
                <div class="wrap search_footer">
                    <div class="text-wrap vcenter">
                        <p>모두보기</p>
                    </div>
                </div>
            </div>
            <!-- 회원 -->
            
            
            
            <!-- 영화 -->
			<div class="col-lg-12 mbr-col-md-12 col-centered">
				<div class="wrap search_header">
					<div class="text-wrap vcenter">
						<h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">
							영화 <span>검색결과</span>
						</h2>
					</div>
				</div>
			</div>

			<c:forEach items="${movieList}" var="list" begin="0" end="2">
				<div class="col-lg-12 mbr-col-md-12">
					<div class="wrap">
						<div class="ico-wrap">
							<div>
								<img  class="img" src="${imgPrefix}/${list.posterPath}" alt="${list.title}">
							</div>
						</div>
						<div class="text-wrap vcenter">
							<p class="mbr-fonts-style text1 mbr-text display-6">
								<b>${list.title}</b>
							</p>
							<br>
							<p>${list.releaseDate}</p>
						</div>
					</div>
				</div>
			</c:forEach>

			<div class="col-lg-12 mbr-col-md-12">
				<div class="wrap search_footer">
					<div class="text-wrap vcenter">
						<p>모두보기</p>
					</div>
				</div>
			</div>
            <!-- 영화 -->

		</div>
</section>