<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="paginate row col-lg-12"> 
              <nav style="margin: 0 auto;"aria-label="Page navigation example">
                  <ul class="pagination">
                      <li class="page-item">
                          <a class="page-link" href="javascript:goPage(${param.prevPageNo})" aria-label="Previous"> 
                          <span aria-hidden="true">&laquo;</span>
                           <span class="sr-only">Previous</span>
                          </a>
                      </li>
			        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
			            <c:choose>
			                <c:when test="${i eq param.pageNo}">
			                    <li class="page-item">
			                    <a class="page-link" href="javascript:goPage(${i})" class="choice">${i}</a>
			                    </li>
			                </c:when>
			                <c:otherwise>
			                    <li class="page-item">
			                    <a class="page-link" href="javascript:goPage(${i})">${i}</a>
			                    </li>
			                </c:otherwise>
			            </c:choose>
			        </c:forEach>
			                        
                      <li class="page-item">
                          <a class="page-link" href="javascript:goPage(${param.nextPageNo})" aria-label="Next"> 
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">Next</span>
                          </a>
                      </li>
                  </ul>
              </nav>
</div>
<script>
function goPage(pageNo){
    
    $('#listForm input[name="pageNo"]').val(pageNo);
    $('#listForm').submit();
    
}
</script>