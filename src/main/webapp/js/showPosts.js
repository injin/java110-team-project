
/* ========== 피드 무한스크롤 ========== */
function morePostHtml(data){
    var html = '';

    postList = postList.concat(data.postsResult); 

    for (var i=0;i<data.postsResult.length;i++) {
        if(i == data.postsResult.length-1){
            lstpstno = String(data.postsResult[i].pstno);
        }

        html += '        <div class="wPost reviewPst">';
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
        html += '                            </span></li><li>';

        if('null' !=data.postsResult[i].ftags){
            for(var j=0;j<data.postsResult[i].ftags.length;j++){
                html += '<span onclick="goToFeed(';
                html +=  data.postsResult[i].ftags.mno;
                html +=')" class="tagName c-pointer">';
                html += data.postsResult[i].ftags[j].nickname; 
                html += '</span>';
            }
        }

        html += '                    </li></ul>';

        html += '<span class="cmt-date">&nbsp;';
        html +=  new Date(data.postsResult[i].createdDate).toLocaleString();
        html += '</span>'; 
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
        html += '                   <p class="reviewCont" id="reviewCont-';
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
        html += '" onclick="cancelLike(';
        html += data.postsResult[i].pstno;
        html += ',';
        html += data.postsResult[i].pstTypeNo;
        html += ')"></i>';
        html += '<i class="far fa-thumbs-up btmIcon c-pointer likeColor';
        if(data.postsResult[i].likeCheck){
            html += ' dis-none ';
        }
        html += '"id="btn-like-empty-';
        html += data.postsResult[i].pstno;
        html += '" onclick="addLike(';
        html += data.postsResult[i].pstno;
        html += ',';
        html += data.postsResult[i].pstTypeNo;
        html += ')"></i><span id="lCnt-';
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
}

$(window).scroll(function() {
    if ($(window).scrollTop() == $(document).height() - $(window).height()) {

        $.ajax({
            type:'POST',
            url:'/app/reviewFeed/morePost',
            headers : {
                'Content-Type': 'application/json'
            },
            data: JSON.stringify({ 
                "pstno" : lstpstno
            }),
            success:function(data){
                morePostHtml(data);
            }
        });
    }
})

/* ========== 좋아요 관련  ========== */
function addLike(pstno,pstTypeNo) {
    $.ajax({
        url : "/app/reviewFeed/addLike",
        type: "post",
        data : { 
            "pstno" : pstno,
            "pstTypeNo":pstTypeNo
        },
        success : function(data) {
            $('#btn-like-full-'+pstno).show();
            $('#btn-like-empty-'+pstno).hide();
            $('#lCnt-'+pstno).text(data);
        }
    }); 
}

function cancelLike(pstno,pstTypeNo) {
    $.ajax({
        url : "/app/reviewFeed/cancelLike",
        type: "post",
        data : { 
            "pstno" : pstno,
            "pstTypeNo":pstTypeNo
        },
        success : function(data) {
            $('#btn-like-empty-'+pstno).show();
            $('#btn-like-full-'+pstno).hide();
            $('#lCnt-'+pstno).text(data);
        }
    });
}


//더보기
function showMore(element,pstno){

    var html = '';

    var $thisDiv = $(element).parent().parent();

    for (var j=0; j<postList.length; j++) {
        if(postList[j].pstno == pstno){
            var index = j;
            var revCont = $('#reviewCont-'+postList[index].pstno).html();
            break;
        }
    }

    var h ='';
    if (postList[index].photos.length != 0) {

        var plength = postList[index].photos.length;
        h+= '<div style="max-height: 32rem" class="w-100">';
        switch(plength){
        case 1 :
            h += '<div class="row">';
            h += '        <img class="d-block w-100 h-100" style="max-height: -webkit-fill-available;"src="/upload/post/'+ postList[index].photos[0] +'" alt="'+ 0 +'_slide">';
            h += '</div>';
            break;
        case 2 :
            h += '<div class="row">';
            h += '        <img class="w-50 h-100 col" src="/upload/post/'+ postList[index].photos[0] +'" alt="'+ 0 +'_slide">';
            h += '        <img class="w-50 h-100 col" src="/upload/post/'+ postList[index].photos[1] +'" alt="'+ 1 +'_slide">';
            h += '</div>';
            break;
        case 3 :
            h += '<div class="row">'
                h += '<div class="col">';
            h += '        <img class="d-block w-100 h-100" style="max-height: -webkit-fill-available;" src="/upload/post/'+ postList[index].photos[0] +'" alt="'+ 0 +'_slide">';
            h += '</div>';
            h += '<div class="col" style="max-height: -webkit-fill-available;">';
            h += '        <img class="w-100 h-50 row" src="/upload/post/'+ postList[index].photos[1] +'" alt="'+ 1 +'_slide">';
            h += '        <img class="w-100 h-50 row" src="/upload/post/'+ postList[index].photos[2] +'" alt="'+ 2 +'_slide">';
            h += '</div>';
            h += '</div>';
            break;
        }
        h+= '</div>';
    }
    $thisDiv.prev().html(h);

    h = '<p class="wbw" id="reviewCont-';
    h += postList[index].pstno;
    h += '">';
    h += revCont;
    h += '</p>';
    $thisDiv.prev().after(h);

    if(sessionMember.mno != ""){
        h = ' <input type="hidden" name="pstno" id="mpstno-';
        h += postList[index].pstno;
        h += '" value="';
        h += postList[index].pstno;
        h += '"/>';
        h += ' <div class="card mb-2 w-100">';
        h += '     <div class="media insideCard">';
        h += '            <div>';
        h += '                <img class="mr-2 profile-medium" src="';
        if (sessionMember.profileImage == "") {
            h +=  "/img/default-profile-img";
        }else if (sessionMember.profileImage.startsWith("http")) {
            h += sessionMember.profileImage;
        } else {
            h += ("/upload/profile/" + sessionMember.profileImage);
        }
        h += '"                alt="login-profileImage">';
        h += '                <div class="text-center">';
        h += sessionMember.nickname;
        h += '                  </div>';
        h += '            </div>';
        h += '            <div class="media-body text-right">';
        h += '                <textarea class="form-control resize-none" name="content" id="mCmt-';
        h += postList[index].pstno;
        h += '"                    placeholder="Write a comment"></textarea>';
        h += '            </div>';
        h += '            <button type="button" class="btn btn-primary mt-2 dSbtn" onclick="addCmt(\'mPost\',';
        h += postList[index].pstno; 
        h += ')">';
        h += '                <i class="fas fa-paper-plane"></i> 등록';
        h += '            </button>';
        h += '    </div>';
        h += ' </div>';
    }else{
        h = '<div class="media-body text-right mb-2"> ';
        h += '<textarea class="form-control resize-none" placeholder="로그인 후 사용가능합니다." disabled></textarea>';
        h += '</div>';
    }

    h += '<div class="comment-main rounded m-0 scrollbar-light-blue w-100">';
    h += '<ul class="p-0" id="cmt-area-';
    h += postList[index].pstno;
    h += '">';
    h += '</ul>';
    h += '</div>';
    listCmt(postList[index].pstno,"mPost");
    $thisDiv.after(h);

}

//로그인 에러
function loginError() {
    alert('로그인 후 작성할 수 있습니다.');
}
