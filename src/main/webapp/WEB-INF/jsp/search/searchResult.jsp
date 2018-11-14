<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section>
	<div class="container">
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

            <c:forEach items="${memberList}" var="list" begin="0" end="2">
                <div class="col-lg-12 mbr-col-md-12">
                    <div class="wrap">
                        <div class="ico-wrap">
                            <div>
                                <img  class="img" src="${list.p_phot}" alt="${list.mno}">
                            </div>
                        </div>
                        <div class="text-wrap vcenter">
                            <p class="mbr-fonts-style text1 mbr-text display-6">
                                <b>${list.nick}</b>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="col-lg-12 mbr-col-md-12">
                <div class="wrap search_footer">
                    <div class="text-wrap vcenter">
                        <p>더 보기</p>
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

			<c:forEach items="${movieList}" var="list" begin="0" end="2" varStatus="status">
				<div class="col-lg-12 mbr-col-md-12" id="post-${status.index}">
					<div class="wrap">
						<div class="ico-wrap">
						<div>
                                <img  class="img" src="${imgPrefix}/${list.posterPath}" alt="${imgPrefix}/${list.posterPath}">
                            </div>
						
						
<%-- 						<c:set var="path" value="${imgPrefix}/${list.posterPath}" />
						<c:choose>
						
						    <c:when test="${path eq '${imgPrefix}/${list.posterPath}'}">
                             <div>
                                <img  class="img" src="${imgPrefix}/${list.posterPath}" alt="${list.title}">
                            </div>
						    </c:when>
						</c:choose>
 --%>	<%-- 					    <c:otherwise>
			                 <div>
                                <img  class="img" src="/img/default-movie-img.png" alt="${list.title}">
                            </div>
						    </c:otherwise>
 --%>						
 
 <%--                       <c:set var="path" value="${imgPrefix}/${list.posterPath}" />
                        <c:choose>
                        
 --%>                   
                                                   
  
<%--                          <c:set var="path" value="${imgPrefix}/${list.posterPath}" />
                        <c:choose>
                            <c:when test="${path eq '${imgPrefix}/${list.posterPath}'}"> 
                            <div>
                                <img  class="img" src="${imgPrefix}/${list.posterPath}" alt="${list.title}">
                            </div> 
                             <div>
                                <img  class="img" src="/img/default-movie-img.png" alt="${list.title}" style="display:none;">
                            </div>
                            </c:when>
                            <c:otherwise>
                              <div>
                                <img  class="img" src="${imgPrefix}/${list.posterPath}" alt="${list.title}" style="display:none;">
                            </div> 
                             <div>
                                <img  class="img" src="/img/default-movie-img.png" alt="${list.title}" >
                            </div>
                            </c:otherwise>
                        </c:choose>
                      
 --%>                        
                        
 
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
					<div class="text-wrap vcenter" id="showAllMovies" onclick="click">
						<p>더 보기</p>
					</div>
				</div>
			</div>
            <!-- 영화 -->

            <!-- 해시태그 -->
            <div class="col-lg-12 mbr-col-md-12 col-centered">
                <div class="wrap search_header">
                    <div class="text-wrap vcenter">
                        <h2 class="mbr-fonts-style mbr-bold mbr-section-title3 display-5">
                            게시물 <span>해쉬태그</span>
                        </h2>
                    </div>
                </div>
            </div>

            <c:forEach items="${hashList}" var="list" begin="0" >
                <div class="col-lg-12 mbr-col-md-12">
                    <div class="wrap">
                        <div class="ico-wrap">
                        <p>${list.pstno}
                            <div>
                            </div>
                        </div>
                        <div class="text-wrap vcenter">
                            <p class="mbr-fonts-style text1 mbr-text display-6">
                                <b>${list.cont}</b>
                            </p>
                            <br>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <div class="col-lg-12 mbr-col-md-12">
                <div class="wrap search_footer">
                    <div class="text-wrap vcenter" id="showAllTags">
                        <p>더 보기</p>
                    </div>
                </div>
            </div>

		</div>
</section>		
<!-- 요걸로! 
<script type="text/javascript">

var movieList = new Array();
var j= 3;

<c:forEach items="${movieList}" var="movie">
movieList.push({
    title: '${movie.title}',
    popularity: ${movie.popularity},
    img: '${imgPrefix}'+'/'+'${movie.posterPath}'
});
</c:forEach>

document.getElementById('showAllMovies').onclick = function () 
{
    if(j==20) return;
    console.log(movieList);
    for(var i=j; i=j+3; i++)
        {
         document.getElementById('')
        }
    j += 3; 
}; 

</script> -->
<%-- 
window.onload= function(){
     document.getElementById('showAllMovies').onclick = function () 
    { 
        alert('h');
        <c:forEach items="${movieList}" var="movie" begin="count" end="count+3">
        console.log(movieList);
            movieList.push({
                title: '${movie.title}',
                popularity: ${movie.popularity},
                posterPath: '${movie.posterPath}'
            });
        </c:forEach>
            
        console.log(movieList);

    }; 
     document.getElementById('showAllTags').onclick = function () 
    {
        alert('p'); 
    };
    }; 
 
 --%>


<!-- 
<script type="text/javascript">


/*    $('.showAll').click(function() {
       <c:forEach items="${movieList}" var="list" begin="3" end="5">
       
           console.log($(this));
           
       </c:forEach>
   }); */
</script> -->