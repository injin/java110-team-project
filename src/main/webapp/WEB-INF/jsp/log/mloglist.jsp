<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-lg-2 col-md-4 col-sm-12">
    <div class="input-group mb-3">
        <select class="custom-select" id="logType">
            <option value="mp" selected>영화리뷰</option>
            <option value="dp">일상리뷰</option>
            <option value="sr">장면리뷰</option>
            <option value="pc">게시물 댓글</option>
            <option value="sc">장면리뷰 댓글</option>
            <option value="fr">친구</option>
        </select>
    </div>
</div>


<div class="logList col-lg-12 mb-5" id="list-mp">
    <h4>영화리뷰 로그</h4>
    <ul class="list-group" id="ul-mp">
        <c:forEach var="log" items="${mpList}" varStatus="status">
            <li class="list-group-item aos-init " data-aos="fade-up">
                <span style="float: left; margin-bottom: 0"> <a
                    href="#">${log.nick}</a>님이 <c:if
                        test="${log.act eq 'wr'}">
                        ${log.indirect} 에 대한 <span
                            onclick="getPostForDetail(${log.url},this)"
                            class="c-pointer text-primary">영화 리뷰</span>를 작성했습니다
                        
                    </c:if> <c:if test="${log.act eq 'lk'}">
                        ${log.indirect} 에 대한  <span
                            onclick="getPostForDetail(${log.url},this)"
                            class="c-pointer text-primary">영화 리뷰</span>를 좋아합니다
                    </c:if> <span class="d-none"></span>
            </span> <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
            </li>
            <c:if test="${status.last}">
                <c:set var="mplastno" value="${log.lgno}" />
            </c:if>
        </c:forEach>
    </ul>
</div>
<div class="logList col-lg-12 mb-5" id="list-dp">
    <h4>일상리뷰 로그</h4>
    <ul class="list-group" id="ul-dp">
        <c:forEach var="log" items="${dpList}" varStatus="status">
            <li class="list-group-item"><span
                style="float: left; margin-bottom: 0"> <a
                    href="#">${log.nick}</a>님이 <c:if
                        test="${log.act eq 'wr'}">
                        <span
                            onclick="getPostForDetail(${log.url},this)"
                            class="c-pointer text-primary">일상 리뷰</span>를 작성했습니다
                    </c:if> <c:if test="${log.act eq 'lk'}">
                        <span
                            onclick="getPostForDetail(${log.url},this)"
                            class="c-pointer text-primary">일상 리뷰</span>를 좋아합니다
                    </c:if> <span class="d-none"></span>
            </span> <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
            </li>
            <c:if test="${status.last}">
                <c:set var="dplastno" value="${log.lgno}" />
            </c:if>
        </c:forEach>
    </ul>
</div>
<div class="logList col-lg-12 mb-5" id="list-sr">
    <h4>장면리뷰 로그</h4>
    <ul class="list-group" id="ul-sr">
        <c:forEach var="log" items="${srList}" varStatus="status">
            <li class="list-group-item aos-init " data-aos="fade-up">
                <span style="float: left; margin-bottom: 0"> <a
                    href="#">${log.nick}</a>님이 <c:if
                        test="${log.act eq 'wr'}">
                        <a href="<c:url value="${log.url}"/>">${log.indirect}</a> 에 장면 리뷰를 작성했습니다
                    </c:if> <c:if test="${log.act eq 'lk'}">
                        <a href="${log.url}">${log.indirect}</a> 에 장면 리뷰를 좋아합니다
                    </c:if>
            </span> <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
            </li>
            <c:if test="${status.last}">
                <c:set var="srlastno" value="${log.lgno}" />
            </c:if>
        </c:forEach>
    </ul>
</div>
<div class="logList col-lg-12 mb-5" id="list-pc">
    <h4>게시물 댓글</h4>
    <ul class="list-group" id="ul-pc">
        <c:forEach var="log" items="${pcList}" varStatus="status">
            <li class="list-group-item"><span
                style="float: left; margin-bottom: 0"> <a
                    href="#">${log.nick}</a>님이 <span
                    onclick="getPostForDetail(${log.url},this)"
                    class="c-pointer text-primary">게시물</span>에 댓글을
                    작성했습니다 <span class="d-none"></span>
            </span> <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
            </li>
            <c:if test="${status.last}">
                <c:set var="pclastno" value="${log.lgno}" />
            </c:if>
        </c:forEach>
    </ul>
</div>
<div class="logList col-lg-12 mb-5" id="list-sc">
    <h4>장면리뷰 댓글</h4>
    <ul class="list-group" id="ul-sc">
        <c:forEach var="log" items="${scList}" varStatus="status">
            <li class="list-group-item"><span
                style="float: left; margin-bottom: 0"> <a
                    href="#">${log.nick}</a>님이 <a href="${log.url}">${log.indirect}</a>
                    의 장면 리뷰에 댓글을 작성하였습니다
            </span> <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
            </li>
            <c:if test="${status.last}">
                <c:set var="sclastno" value="${log.lgno}" />
            </c:if>
        </c:forEach>
    </ul>
</div>
<div class="logList col-lg-12 mb-5" id="list-fr">
    <h4>팔로우</h4>
    <ul class="list-group" id="ul-fr">
        <c:forEach var="log" items="${frList}" varStatus="status">
            <li class="list-group-item"><span
                style="float: left; margin-bottom: 0"> <a
                    href="#">${log.nick}</a>님이 <a href="${log.url}">${log.indirect}</a>
                    을/를 팔로우 했습니다
            </span> <span style="float: right; margin-bottom: 0">${log.createdDate}</span>
            </li>
            <c:if test="${status.last}">
                <c:set var="frlastno" value="${log.lgno}" />
            </c:if>
        </c:forEach>
    </ul>
</div>



<a class="return-top" href="#"> <img src="/img/top-btn.png"
    width="50" height="50"></a>

<jsp:include page="/WEB-INF/jsp/reviewFeed/detailPost.jsp"></jsp:include>

<script src="/js/aos.js"></script>
<script src="/js/detailPost.js"></script>
<script>
    var sessionMember = {
            "nickname" : '${sessionScope.loginUser.nickname}',
            "profileImage" : '${sessionScope.loginUser.profileImage}',
            "mno" : '${sessionScope.loginUser.mno}'
    };
    
    
    
    AOS.init();
    
    
        var lastnoMap = new Map();
        lastnoMap.set('mp', '${mplastno}');
        lastnoMap.set('dp', '${dplastno}');
        lastnoMap.set('pc', '${pclastno}');
        lastnoMap.set('sr', '${srlastno}');
        lastnoMap.set('sc', '${sclastno}');
        lastnoMap.set('fr', '${frlastno}');
        
        // 기본으로 게시물 목록만 보여줌
        var initType = $('#logType').val();
        showSelectedLogList(initType);
        
        

        function showSelectedLogList(logType) {
            $('.logList').hide();
            $('#list-' + logType).show();
        }

        $('#logType').on('change', function() {
            var selectedLogType = $('#logType').val();
            showSelectedLogList(selectedLogType);
        });
        
       function makeSrLiHtml(value) {
           var html = '';
           
               html += '<li class="list-group-item">';
               html += '<span style="float: left; margin-bottom: 0">';
               html += '<a href="#">' + value.nick + '</a>님이';
           if(value.act == 'wr'){
               html += '<a href='+value.url+'>'+value.indirect + '</a>에 장면 리뷰를 작성했습니다';
           }
           if(value.act == 'lk'){
               html += '<a href='+value.url+'>'+value.indirect +'</a>에 장면 리뷰를 좋아합니다';
           }
               html += '</span>'
               html += '<span style="float: right; margin-bottom: 0">' + formatDate(value.createdDate);
               html += '</span>'
               html += '</li>'
               
           return html;
       }
       function makeMpLiHtml(value) {
           var html = '';
           
           html += '<li class="list-group-item">';
           html += '<span style="float: left; margin-bottom: 0">';
           html += '<a href="#">' + value.nick + '</a>님이';
       if(value.act == 'wr'){
           html += '<a href='+value.url+'>'+value.indirect +'</a>에 영화 리뷰를 작성했습니다';
           }
       if(value.act == 'lk'){
           html += '<a href='+value.url+'>'+value.indirect +'</a>에 영화 리뷰를 좋아합니다';
           }
           html += '</span>'
           html += '<span style="float: right; margin-bottom: 0">' + formatDate(value.createdDate);
           html += '</span>'
           html += '</li>'
       return html;
       }
       
       
       
       function makeDpLiHtml(value) {
           var html = '';
           
           html += '<li class="list-group-item">';
           html += '<span style="float: left; margin-bottom: 0">';
           html += '<a href="#">' + value.nick + '</a>님이';
       if(value.act == 'wr'){
           html += '<a href='+value.url+'>'+value.indirect +'</a>에 일상 리뷰를 작성했습니다';
           }
       if(value.act == 'lk'){
           html += '<a href='+value.url+'>'+value.indirect +'</a>에 일상 리뷰를 좋아합니다';
           }
           html += '</span>'
           html += '<span style="float: right; margin-bottom: 0">' + formatDate(value.createdDate);
           html += '</span>'
           html += '</li>'
       return html;
       }
       
       function makePcLiHtml(value) {
           var html = '';
           
           html += '<li class="list-group-item">';
           html += '<span style="float: left; margin-bottom: 0">';
           html += '<a href="#">' + value.nick + '</a>님이';
           html += '<a href='+value.url+'>'+value.indirect+'</a>님의 게시물에 댓글을 작성했습니다';
           html += '</span>'
           html += '<span style="float: right; margin-bottom: 0">' + formatDate(value.createdDate);
           html += '</span>'
           html += '</li>'
       return html;
       }
       
       function makeScLiHtml(value) {
           var html = '';
           
           html += '<li class="list-group-item">';
           html += '<span style="float: left; margin-bottom: 0">';
           html += '<a href="#">' + value.nick + '</a>님이';
           html += '<a href='+value.url+'>'+value.indirect +'</a>의 장면 리뷰에 댓글을 작성했습니다';
           html += '</span>'
           html += '<span style="float: right; margin-bottom: 0">' + formatDate(value.createdDate);
           html += '</span>'
           html += '</li>'
       return html;
       }
       function makeFrLiHtml(value) {
           var html = '';
           
           html += '<li class="list-group-item">';
           html += '<span style="float: left; margin-bottom: 0">';
           html += '<a href="#">' + value.nick + '</a>님이';
           html += '<a href='+value.url+'>'+value.indirect +'</a>을/를 팔로우 했습니다';
           html += '</span>'
           html += '<span style="float: right; margin-bottom: 0">' + formatDate(value.createdDate);
           html += '</span>'
           html += '</li>'
           return html;
       }
       
       function formatDate(date) {
           var d = new Date(date),
               month = '' + (d.getMonth() + 1),
               day = '' + d.getDate(),
               year = d.getFullYear();

           if (month.length < 2) month = '0' + month;
           if (day.length < 2) day = '0' + day;

           return [year, month, day].join('-');
       }
       
       var postList=[];
       function getPostForDetail(pstno,element){
           $.ajax({
               url : "/app/log/getPost",
               type: "post",
               headers : {
                   'Content-Type': 'application/json'
               },
               data : JSON.stringify({
                   "pstno" : parseInt(pstno)
                   
               }),
               success : function(data) {
                   postList.push(data);
                   
                   var html = '<p class="d-none" id="reviewCont-';
                   html += data.pstno;
                   html += '"></p>';
                   
                   $(element).next().html(html);
                 showCont(data.content,data.pstno); 
                 openDetailModal(data.pstno);  
               }
           }); 
       }
       
        window.onscroll = function(ev) {
            if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
                var currentType = $('#logType').val();
                var lastno = lastnoMap.get(currentType);
                
                if (lastno == '') return;
                
                $.ajax({
                    url : "/app/log/more",
                    type: "post",
                    headers : {
                        'Content-Type': 'application/json'
                    },
                    data : JSON.stringify({
                        "lastno" : parseInt(lastno),
                        "type" : currentType
                    }),
                    success: function(data) {
                        var html = '';
                        data.forEach(function(value, index, array) {
                            if (value.direct == 'sr') {
                                html += makeSrLiHtml(value);
                            } else if (value.direct == 'dp') {
                                html += makeDpLiHtml(value);
                            } else if (value.direct == 'pc') {
                                html += makePcLiHtml(value);
                            } else if (value.direct == 'sc') {
                                html += makeScLiHtml(value);
                            } else if (value.direct == 'fr') {
                                html += makeFrLiHtml(value);
                            } else if (value.direct == 'mp') {
                                html += makeMpLiHtml(value);
                            }
                            
                            if (index == (array.length-1)) { //마지막이면
                                lastnoMap.set(currentType, value.lgno);
                            }
                        });
                        $('#ul-' + currentType).append(html)
                    }
                });
                
            }
        };
    </script>
