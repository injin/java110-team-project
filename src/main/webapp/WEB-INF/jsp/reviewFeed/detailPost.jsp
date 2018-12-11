<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Modal -->

<div class="modal fade" id="detailModal" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-lg" role="document" id="rModal">
        <div class="modal-content">

            <div class="modal-header">
                <p id="mh-p">
                    <b><i><span id="movie-title">영화 제목</span></i></b>
                </p>

                <!-- 모달 닫기 -->
                <button type="button" class="close ml-0" data-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>

            </div>
            <!-- modal-header -->

            <div class="modal-body row">

                <%-- 왼쪽 col,사진부분 --%>
                <div class="col-8" id="leftcol">
                    <div id="carouselExampleIndicators" class="carousel slide"
                        data-ride="carousel"></div>
                </div>

                <%-- 오른쪽 col --%>
                <div class="col-4" id="rightcol">

                    <div class="media row pr-4 pl-4 mb-1">
                        <img id="ownerImg" src="/img/default-profile-img.png" />
                        <div class="media-body">
                            <ul class="mb-0 pl-0 float-left memberul" id="nickwrap">
                                <li><span id="ownerNick">닉네임</span><span class="cmt-date" id="cdate"></span></li>
                                <%-- 친구태그 --%>
                                <li id="dftags"></li>
                            </ul>
                            
                        </div>
                    </div>

                    <p class="reviewCont scrollbar-light-blue" id="dCont">내용</p>


                    <div class="row mb-1">
                        <%-- 별점 --%>
                        <div class='col-6' id="detail-star"></div>
                    </div>

                    <div class="row col m-0 p-0">
                        <%-- 댓글 작성란 --%>
                        <c:choose>
                            <c:when test="${not empty sessionScope.loginUser}">
                                <input type="hidden" name="pstno" id="dpstno" />
                                <div class="card mb-2 w-100">
                                    <div class="media insideCard">
                                        <div>
                                            <img class="mr-2 profile-medium"
                                                src="${loginUser.profileImagePath}" alt="login-profileImage">
                                            <div class="text-center">${sessionScope.loginUser.nickname}</div>
                                        </div>
                                        <div class="media-body text-right">
                                            <textarea class="form-control resize-none" name="content" id="pCmt"
                                                placeholder="Write a comment"></textarea>
                                        </div>
                                        <button type="button" class="btn btn-primary mt-2 dSbtn ml-2"
                                            onclick="addCmt('dPost',0)">
                                            <i class="fas fa-paper-plane"></i> 등록
                                        </button>
                                    </div>
                                </div>

                            </c:when>
                            <c:otherwise>
                                <div class="media-body text-right mb-2">
                                    <textarea class="form-control resize-none" name="cont"
                                        placeholder="로그인 후 사용가능합니다." disabled></textarea>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <%-- 댓글리스트 --%>
                        <div class="comment-main rounded m-0 scrollbar-light-blue w-100">
                            <ul class="p-0" id="cmt-area">
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>