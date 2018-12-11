/* 삭제하기 */
function deletePost(id){
  var postId=id;
  $.ajax({
    url: "/app/reviewFeed/delete",
    type: "POST",
    data: { "postId" : postId },
    success: function(){
      location.reload();
    },
    error: function(xhr, status, msg) {
        console.log(xhr);
        console.log(status);
        console.log(msg);
      }
  });
}
/* ========== 피드 무한스크롤 ========== */
var doingLoad = false;
function morePostHtml(data){
    var html = '';

    postList = postList.concat(data.postsResult); 

    for (var i=0;i<data.postsResult.length;i++) {
        if(i == data.postsResult.length-1){
            lstpstno = String(data.postsResult[i].pstno);
        }

        html += '        <div class="wPost reviewPst aos-init" data-aos="fade-up" data-aos-duration="1500">';
        html += '            <div class="media row pr-3 pl-3">';
        html += '                <img src="';
        html += data.postsResult[i].member.profileImagePath;
        html += '"                   class="rprofileImg"/>';
        html += '                <div class="media-body">';
        html += '                    <ul class="memberul">';
        html += '                        <li><span onclick="goToFeed(';
        html += data.postsResult[i].member.mno;
        html += ')" class="text-dark c-pointer">';
        html += data.postsResult[i].member.nickname;
        html += '                            </span>';
        html += '<span class="cmt-date">&nbsp;';
        html +=  new Date(data.postsResult[i].createdDate).toLocaleString();
        html += '</span>'; 
        html += '</li><li>';

        if('null' !=data.postsResult[i].ftags){
            for(var j=0;j<data.postsResult[i].ftags.length;j++){
                html += '<span onclick="goToFeed(';
                html +=  data.postsResult[i].ftags[j].mno;
                html +=')" class="tagName c-pointer">';
                html += data.postsResult[i].ftags[j].nickname; 
                html += '</span>';
            }
        }

        html += '                    </li></ul>';

       
        if(data.postsResult[i].pstTypeNo == 0){
            html += '<p class="dptitle">';
            html += '<b><i>';
            html += data.postsResult[i].title;
            html += '</i></b></p>';
        }

        html += '               </div>';
        html += '           </div>';
        html += '           <div class="clearfix media row m-1">';
        html += '               <div class="media-body">';
        html += '                   <p class="reviewCont scrollbar-light-blue" id="reviewCont-';
        html += data.postsResult[i].pstno;
        html += '">';
        html += makeContHtml(data.postsResult[i].content,data.postsResult[i].pstno);
        html += '</p>';
        html += '               </div>';

        if(data.postsResult[i].photos.length > 0){
            html += '<div class="image">';
            html += '   <img onclick="openDetailModal(';
            html += data.postsResult[i].pstno;
            html += ')" src="/upload/post/';
            html += data.postsResult[i].photos[0];
            html += '" data-title="';
            html += data.postsResult[i].title;
            html += '"   class="pstImgtoDetail"/>';
            html += ' <input type="hidden" data-toggle="modal" id="detailPst"data-target="#detailModal" />';
            if(data.postsResult[i].photos.length>1){
                html += '<div class="text"><p>';
                html += data.postsResult[i].photos.length-1;
                html += '장+</p></div>';
            }

            html += '</div>';
        }
        html += '        </div>';

        html += '       <div class="row">';
        html += '           <div class="col-6 text-left">';

        html += '<i class="fas fa-thumbs-up btmIcon c-pointer likeColor';
        if(!data.postsResult[i].likeCheck){
            html += ' dis-none ';
        }
        html += '"id="btn-like-full-';
        html += data.postsResult[i].pstno;
        html += '" onclick="';
        if(sessionMember.mno == ""){
            html += 'loginError()';
        }else{
            html += 'cancelLike(';
            html += data.postsResult[i].pstno;
            html += ',';
            html += data.postsResult[i].pstTypeNo;
            html += ')';
        }
        html += '"></i>';
        html += '<i class="far fa-thumbs-up btmIcon c-pointer likeColor';
        if(data.postsResult[i].likeCheck){
            html += ' dis-none ';
        }
        html += '"id="btn-like-empty-';
        html += data.postsResult[i].pstno;
        html += '" onclick="';
        if(sessionMember.mno == ""){
            html += 'loginError()';
        }else{
            html += 'addLike(';
            html += data.postsResult[i].pstno;
            html += ',';
            html += data.postsResult[i].pstTypeNo;
            html += ')';
        }
        html += '"></i><span id="lCnt-';
        html += data.postsResult[i].pstno;
        html += '">';
        html += data.postsResult[i].likeCnt;
        html += '</span><i class="far fa-comment btmIcon c-pointer" onclick="showMore(this,';
        html += data.postsResult[i].pstno;
        html += ')"></i>';
        html += '<span id="cCnt-';
        html += data.postsResult[i].pstno;
        html += '">';
        html +=  data.postsResult[i].cmtCnt;
        html += '</span></div>';

        html += '   <div class="col-6 text-right">';
        if(data.postsResult[i].pstTypeNo == 0 && data.postsResult[i].star != 0){

            for(var s = 0;s<5;s++){
                if(s<data.postsResult[i].star){

                    html += '<i class="fas fa-star sStar"></i>';    
                }else{

                    html += '<i class="far fa-star sStar"></i>';
                }
            }
        }

        html += '  </div>'; 
        html += '       </div>';

        html += '   </div>';
    }  

    $('#pstShw').append(html); 

    doingLoad = false;
}

$(window).scroll(function() {

    var $win = $(window);
    var top = $(window).scrollTop(); 
    var endPoint = $(document).height() - $('footer').height() - $('header').height();
    var speed          = 'normal';     
    var easing         = 'linear';
    var $layer         = $('#stv_list'); 
    var layerTopOffset = 0;   
    $layer.css('position', 'absolute');

    if (top > 0 )
        $win.scrollTop(layerTopOffset + top);
    else
        $win.scrollTop(0);

    yPosition = $win.scrollTop();
    if (yPosition < 0)
    {
        yPosition = 0;
    }
    if(endPoint - 600 < top){
        yPosition = endPoint - 600;
    }
    $layer.animate({"top":yPosition }, {duration:speed, easing:easing, queue:false});

    if (($(window).scrollTop() >= ($(document).height() - $(window).height()) * 0.7) && !doingLoad) {
        doingLoad = true;
        console.log("morePost");
        $.ajax({
            type:'POST',
            url:'/app/reviewFeed/moreMyPost',
            headers : {
                'Content-Type': 'application/json'
            },
            data: JSON.stringify({ 
                "pstno" : lstpstno
            }),
            success:function(data){
                console.log(data);
                morePostHtml(data);
            }
        });
    }
})