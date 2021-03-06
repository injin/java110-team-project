$(".cmt-cont").tweetParser({
    urlClass : "tweet_link", //this is default
    userClass : "tweet_user", //this is default
    hashtagClass : "navy",
    target : "_blank", //this is default
    hashtagPath: "/app/searchResult?keyword="
});
/* ========== 모달상세 관련  ========== */         
function openDetailModal(pstno) {

    for (var i=0; i<postList.length; i++) {
        if(postList[i].pstno == pstno){
            var index = i;
            break;
        }
    }
    $('#detailModal #movie-title').text(postList[index].title);
    $('#detailModal #ownerImg').attr('src',postList[index].member.profileImagePath);
    var hForNick = '<span id="ownerNick" class="c-pointer" onclick="goToFeed('+postList[index].member.mno+')">'+postList[index].member.nickname+'</span>';
    $('#detailModal #ownerNick').replaceWith(hForNick);
    $('#detailModal #dCont').html($('#reviewCont-'+postList[index].pstno).html());
    $('#detailModal #dpstno').val(postList[index].pstno);
    $('#detailModal #cdate').text(" "+new Date(postList[index].createdDate).toLocaleDateString('ko-KR')); 


    /* 별 부분*/
    var star = postList[index].star;
    var shtml='';
    if(star != 0){
        for (var i=0; i<5; i++) {
            if (i< star) {
                shtml += '<i class="fas fa-star sStar"></i>';
            } else {
                shtml += '<i class="far fa-star sStar"></i>';
            }
        }
    }
    $('#detail-star').html(shtml);


    /* 이미지 추가부분*/
    if (postList[index].photos.length == 0) {

        $('#leftcol').hide();
        $('#rightcol').removeClass('col-4').addClass('col-12');
        $('#detailModal .modal-dialog').css('maxWidth', '35rem');
    }else{
        $('#leftcol').show();
        $('#detailModal .modal-dialog').css('maxWidth', '70rem');
        $('#rightcol').removeClass('col-12').addClass('col-4');



        var h ='';
        /*h += '<ol class="carousel-indicators">';
        for (var i=0; i<postList[index].photos.length; i++) {
            if(i ==0){
                h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'" class="active"></li>';
            }else{
                h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'"></li>';        
            }
        }
        h += '</ol>';*/
        h += '<div class="carousel-inner">';
        for (var i=0; i<postList[index].photos.length; i++) {
            if(i ==0){
                h += '    <div class="carousel-item active">';}
            else{
                h += '    <div class="carousel-item">';        
            }
            h += '        <img class="d-block w-100 carouselHeight" src="/upload/post/'+ postList[index].photos[i] +'" alt="'+ i +'_slide">';
            h += '    </div>';
            h += '  <div class="carousel-caption"></div>';

        }
        h += '</div>';

        h += '<a class="carousel-control-prev" href="#carouselExampleIndicators"';
        h += '    role="button" data-slide="prev">';
        h += '    <span class="carousel-control-prev-icon" aria-hidden="true"></span>'; 
        h += '    <span class="sr-only">Previous</span>';
        h += '</a> <a class="carousel-control-next"';
        h += '    href="#carouselExampleIndicators" role="button" data-slide="next">';
        h += '    <span class="carousel-control-next-icon" aria-hidden="true"></span>';
        h += '    <span class="sr-only">Next</span>';
        h += '</a>';

    }


    $('#carouselExampleIndicators').html(h); 

    /* 친구태그 부분*/
    html ='';
    for (var i=0; i<postList[index].ftags.length; i++) {

        html+= '<span onclick="goToFeed(';
        html += postList[index].ftags[i].mno;
        html+= ')" class="tagName c-pointer">';
        html += postList[index].ftags[i].nickname;
        html +='</span>';
    }
    $('#dftags').html(html);  

    /* 댓글리스트 */
    listCmt(postList[index].pstno,"dPost");

    $('#detailModal').modal('show');
}

$('#detailModal').on('hidden.bs.modal', function (e) {
    $('#pCmt').val('');
})

function toDetail(id) {
    window.location.href = '/app/sceneReview/review?mvno='+ id;
}


/* ========== 댓글 관련  ========== */
function addCmt(forWhat,pstno) {
    if(forWhat == "dPost"){
        var contVal = $('#pCmt').val();
        pstno = $('#dpstno').val();
    }else{
        var contVal = $('#mCmt-'+pstno).val();
    }

    if (contVal == '') {
        commonAlert('error','댓글을 입력해 주세요');
        return;
    }

    $.ajax({
        type:'POST',
        url:'/app/reviewFeed/addCmt',
        data: { 
            "pstno" : pstno,
            "content" : contVal
        },
        success:function(data){
            listCmt(pstno,forWhat);
            if(forWhat == "dPost"){
                $('#pCmt').val('');
            }else{
                $('#mCmt-'+pstno).val('');
            }
        }
    });
}

function listCmt(pstno,forWhat) {
    $.ajax({
        type:'POST',
        url:'/app/reviewFeed/listCmt',
        headers : {
            'Content-Type': 'application/json'
        },
        data: JSON.stringify({ 
            "pstno" : pstno.toString()
        }),
        success:function(data){
            if(forWhat == "dPost"){
                showCmt(data);
            }else if(forWhat == "mPost"){
                $('#cmt-area-'+pstno).html(makeCmtHtml(data,forWhat));    
            }
            $('#cCnt-'+pstno).text(data.cmtsResult.length);
        }
    });
}

function makeCmtHtml(data,forWhat) {

    var html = '';
    for (var i=0;i<data.cmtsResult.length;i++) {
        var wDate = new Date(data.cmtsResult[i].createdDate).toLocaleString();

        html += '<li>';
        html += '<div class="row comment-box p-1 pt-3 pr-4">';
        html += '    <div class="col-3 user-img text-center c-pointer" onclick="goToFeed(';
        html += data.cmtsResult[i].member.mno;
        html += ')">';
        html += '        <img src="';
        html += data.cmtsResult[i].member.profileImagePath; 
        html += '" class="main-cmt-img">';
        html += '        <p>';
        html += data.cmtsResult[i].member.nickname; 
        html += '        </p>';
        html += '    </div>';
        html += '    <div class="col-9 user-comment bg-light rounded">';
        html += '        <p class="w-100 p-2 m-0 wbw">';
        html += data.cmtsResult[i].content; 
        html += '        </p>';
        html += '        <p class="w-100 p-2 m-0">';
        if(data.cmtsResult[i].member.mno == sessionMember.mno){

            html += '&nbsp;<i class="far fa-edit c-pointer"';
            html += ' onclick="showEditForm(this,';
            html += data.cmtsResult[i].pstno;
            html += ',\'';
            html += wDate;
            html += '\',';
            html += data.cmtsResult[i].pcno;
            html += ',\'';
            html += forWhat;
            html += '\')"></i>';
            html += '&nbsp;<i class="fas fa-times c-pointer"';
            html += ' onclick="deleteComment(';
            html += data.cmtsResult[i].pcno;
            html += ',';
            html += data.cmtsResult[i].pstno;
            html += ',\'';
            html += forWhat;
            html += '\')"></i>';   
        } 
        html += '            <span class="cmt-date float-right">';
        html +=  wDate;
        html += '          </span>';
        html += '        </p>';
        html += '    </div>';

        html += '</div>';
        html += '</li> ';   
    }  
    //.toLocaleDateString() 이건 시간만
    return html;
}

function showCmt(data) {
    $('#cmt-area').html(makeCmtHtml(data,"dPost"));    
}


function deleteComment(pcno,pstno,forWhat) {

    $.ajax({
        type:'POST',
        url:'/app/reviewFeed/deleteCmt',
        headers : {
            'Content-Type': 'application/json'
        },
        data: JSON.stringify({ 
            "pcno" : pcno.toString()
        }),
        success:function(data){
            listCmt(pstno,forWhat);
        }
    });
}

function showEditForm(obj,pstno,wdate,pcno,forWhat) {

    $(obj).hide();
    var $contHtml = $(obj).parent().prev().html();
    var $editCont = $contHtml.replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
    var $editArea = $(obj).parent().parent();

    var editHtml = '        <textarea class="form-control resize-none mt-2" name="content" id="editCmt';
    if(forWhat == "dPost"){
        editHtml += '" placeholder="Write a comment">';    
    }else{
        editHtml += '-';
        editHtml += pstno;
        editHtml += '" placeholder="Write a comment">';
    }
    editHtml += $editCont;
    editHtml += '        </textarea>';
    editHtml += '    <button type="button" class="btn btn-primary mt-2 mb-2 ml-2 float-right" onclick="editComment(' + pstno+","+pcno + ",\'" + forWhat + '\')">';
    editHtml += '        <i class="fas fa-paper-plane"></i> 수정';
    editHtml += '    </button>';
    editHtml += '    <button type="button" class="btn btn-secondary mt-2 mb-2 float-right" onclick="closeEditForm(' + pcno+ ',\''+wdate+'\',\'' + forWhat + '\',\''+ $contHtml +'\','+pstno+',this)">';
    editHtml += '        <i class="fas fa-window-close"></i> 취소';                                         
    editHtml += '    </button>';

    $editArea.html(editHtml); 
}

function editComment(pstno,pcno,forWhat) {
    if(forWhat == "dPost"){
        var contVal = $('#editCmt').val();
    }else{
        var contVal = $('#editCmt-'+pstno).val();
    }

    if (contVal == '') {
        commonAlert('error','댓글을 입력해 주세요');
        return;
    }

    $.ajax({
        type:'POST',
        url:'/app/reviewFeed/editCmt',
        headers : {
            'Content-Type': 'application/json'
        },
        data: JSON.stringify({ 
            "pcno" : pcno.toString(),
            "content" : contVal.toString()
        }),
        success:function(data){
            listCmt(pstno,forWhat);
            $('#pCmt').val('');
        }
    });
} 

function closeEditForm(pcno,wdate,forWhat,content,pstno,element) {

    var $editCloseDiv = $(element).parent();
    var html = '        <p class="w-100 p-2 m-0 wbw">';
    html += content; 
    html += '        </p>';
    html += '        <p class="w-100 p-2 m-0">';

    html += '&nbsp;<i class="far fa-edit c-pointer"';
    html += ' onclick="showEditForm(this,';
    html += pstno;
    html += ',\'';
    html += wdate;
    html += '\',';
    html += pcno;
    html += ',\'';
    html += forWhat;
    html += '\')"></i>';
    html += '&nbsp;<i class="fas fa-times c-pointer"';
    html += ' onclick="deleteComment(';
    html += pcno;
    html += ',';
    html += pstno;
    html += ',\'';
    html += forWhat;
    html += '\')"></i>';   
    html += '            <span class="cmt-date float-right">';
    html +=  wdate;
    html += '          </span>';
    html += '        </p>';

    $editCloseDiv.html(html);
}
