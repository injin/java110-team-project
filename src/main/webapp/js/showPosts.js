

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
    if(!$thisDiv.next().is('input')){
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
}

//로그인 에러
function loginError() {
    commonAlert('error','로그인 후 사용할 수 있습니다.');
}
