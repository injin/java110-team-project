
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
    $('#detailModal #ownerNick').text(postList[index].member.nickname);
    $('#detailModal #dCont').html($('#reviewCont-'+postList[index].pstno).html());
    $('#detailModal #dpstno').val(postList[index].pstno);
    $('#detailModal #cdate').text(new Date(postList[index].createdDate).toLocaleString()); 

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
        var h ='';
        h += '<ol class="carousel-indicators">';
        for (var i=0; i<postList[index].photos.length; i++) {
            if(i ==0){
                h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'" class="active"></li>';
            }else{
                h += '    <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'"></li>';        
            }
        }
        h += '</ol>';
        h += '<div class="carousel-inner">';
        for (var i=0; i<postList[index].photos.length; i++) {
            if(i ==0){
                h += '    <div class="carousel-item active">';}
            else{
                h += '    <div class="carousel-item">';        
            }
            h += '        <img class="d-block w-100" src="/upload/post/'+ postList[index].photos[i] +'" alt="'+ i +'_slide" style="height: 44rem;">';
            h += '    </div>';
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
        html+='<a href="#" style="color: blue; font-size: 0.2rem; vertical-align: top;">';
        html += postList[index].ftags[i].nickname;
        html +='</a>';
    }
    $('#dftags').html(html);  

    /* 댓글리스트 */
    listCmt(postList[index].pstno);

    $('#detailModal').modal('show');
}

$('#detailModal').on('hidden.bs.modal', function (e) {
    $(':input').val('');
})

function toDetail(id) {
    window.location.href = '/app/sceneReview/review?mvno='+ id;
}


/* ========== 댓글 관련  ========== */
function addCmt() {
    var contVal = $('#addCmtForm textarea[name="content"]').val();

    if (contVal == '') {
        alert('내용을 입력해주세요.');
        return;
    }

    $.ajax({
        type:'POST',
        url:'/app/reviewFeed/addCmt',
        data: { 
            "pstno" : $('#dpstno').val(),
            "content" : $('#pCmt').val()
        },
        success:function(data){
            listCmt($('#dpstno').val());
            $('#pCmt').val('');
        }
    });
}

function listCmt(pstno) {
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
            makeCmtHtml(data);
        }
    });
}

function makeCmtHtml(data) {
    var html = '';
    for (var i=0;i<data.cmtsResult.length;i++) {

        html += '<li>';
        html += '<div class="row comment-box p-1 pt-3 pr-4">';
        html += '    <div class="col-3 user-img text-center">';
        html += '        <img src="';
        html += data.cmtsResult[i].member.profileImagePath; 
        html += '" class="main-cmt-img">';
        html += '        <label>';
        html += data.cmtsResult[i].member.nickname; 
        html += '        </label>';
        html += '    </div>';
        html += '    <div class="col-9 user-comment bg-light rounded">';
        html += '        <p class="w-100 p-2 m-0" style="word-break: break-word;">';
        html += data.cmtsResult[i].content; 
        html += '        </p>';
        html += '        <p class="w-100 p-2 m-0">';
        if(data.cmtsResult[i].member.mno == data.session.mno){

            html += '&nbsp;<i class="far fa-edit c-pointer" onclick="showEditForm(this,';
            html += data.cmtsResult[i].pcno;
            html += ',';
          /*  html += data.session.profileImagePath.toString();
            html += ',';*/
            console.log(typeof data.session.profileImagePath);
            console.log(data.session.profileImagePath);
            console.log(typeof data.session.nickname);
            console.log(data.session.nickname);
            html += data.session.nickname;
            html += ')"></i>';
            html += '&nbsp;<i class="fas fa-times c-pointer" onclick="deleteComment(';
            html += data.cmtsResult[i].pcno;
            html += ')"></i>';   
        } 
        html += '            <span class="cmt-date float-right">';
        html +=  new Date(data.cmtsResult[i].createdDate).toLocaleString();
        html += '          </span>';
        html += '        </p>';
        html += '    </div>';

        html += '</div>';
        html += '</li> ';   
    }  
    //.toLocaleDateString() 이건 시간만
    $('#cmt-area').html(html);  
}

function deleteComment(pcno) {
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
            listCmt($('#dpstno').val());
            $('#pCmt').val('');
        }
    });
}

function showEditForm(obj,pcno,nickname) {
    /*,profileImagePath*/
    $(obj).hide();
    var $editCont = $(obj).parent().prev().text();
    var $editArea = $(obj).parent().parent().parent().parent();

    var editHtml = '<div class="card mb-2">';
    editHtml += '<div class="media" style="padding: .5rem;">';
    editHtml += '    <div>';
    editHtml += '        <img class="mr-2 profile-medium" src="';
    /*editHtml += profileImagePath;*/
    editHtml += '" alt="login-profileImage">';
    editHtml += '        <div style="text-align: -webkit-center;">';
    editHtml += nickname;
    editHtml += '</div>';
    editHtml += '    </div>';
    editHtml += '    <div class="media-body text-right">';
    editHtml += '        <textarea class="form-control" name="content" id="editCmt" placeholder="Write a comment">';
    editHtml += $editCont;
    editHtml += '        </textarea>';
    editHtml += '    </div>';
    editHtml += '    <button type="button" class="btn btn-dark mt-2" onclick="editComment(' + pcno + ')" style="height: 3rem; padding: 0 .5rem;">';
    editHtml += '        <i class="fas fa-paper-plane"></i> 수정';
    editHtml += '    </button>';
    editHtml += '</div>';
    editHtml += '</div>';

    $editArea.html(editHtml); 
}

function editComment(pcno) {
    var contVal = $('#editCmt').val();
    if (contVal == '') {
        alert('댓글을 입력해 주세요');
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
            listCmt($('#dpstno').val());
            $('#pCmt').val('');
        }
    });
} 
