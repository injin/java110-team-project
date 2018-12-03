$(function() {

    /* ========== 이미지 업로드 관련  ========== */
    var names = [];  

    $('body').on('change', '.picupload', function(event) {
        var files = event.target.files;
        var $mlist = $("#media-list");
        var z = 0;
        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            names.push($(this).get(0).files[i].name);
            if (file.type.match('image')) {

                var picReader = new FileReader();
                picReader.fileName = file.name
                picReader.addEventListener("load", function(event) {

                    var picFile = event.target;
                    var div = document.createElement("li");
                    div.innerHTML = "<img src='" + picFile.result + "'" +
                    "title='" + picFile.name + "'/><div  class='post-thumb'><div class='inner-post-thumb'><a href='#' data-id='" + event.target.fileName + "' class='remove-pic'><i class='fa fa-times' aria-hidden='true'></i></a><div></div>";
                    $mlist.prepend(div);
                });
            } else {
                //이미지외의자료임
            }
            picReader.readAsDataURL(file);
        }
        // return array of file name
        console.log(names);
    });

    $('body').on('click', '.remove-pic', function() {
        $(this).parent().parent().parent().remove();
        var removeItem = $(this).attr('data-id');
        var yet = names.indexOf(removeItem);

        if (yet != -1) {
            names.splice(yet, 1);
        }
        console.log(names);
    });

    /* ========== 일상/영화게시물 구분 관련  ========== */
    $('.starrr').starrr({
        change: function(e, value){
            $("#star").val(value);
        }
    });

    $("#starbtn").click(function () {
        $('#showStar').toggleClass("nostar");
        if($('#showStar').hasClass("nostar")){
            $("#star").val(0);
        }
    });

    $('.open').on('click', function(e) {

        if(this.checked) {
            $('.globe').show();
            $(".lock").hide();
        }else{
            $('.lock').show();
            $(".globe").hide();
        }
    });

    /* ========== 친구태그 관련  ========== */
    var fList = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local: flwList
    });
    fList.initialize();

    elt = $('.example_objects_as_tags > > input');
    elt.tagsinput({
        itemValue: 'value',
        itemText: 'text',
        typeaheadjs: {
            name: 'fList',
            displayKey: 'text',
            source: fList.ttAdapter()
        }
    });

    // 글 작성
    $('#modalSubmit').on('click', function(e) {

        if($("#pstTypeNo").val() == 0){
            if($("#movieId").val().trim() == 0){
                alert("알맞은 영화제목을 작성해주세요.");
                e.preventDefault();
                return;
            }
        }

        if(!document.getElementById("reviewTxtarea").value.replace(/(^\s*)|(\s*$)/gi, "")){
            alert("내용을 작성해주세요.");
            e.preventDefault();
            return;
        }
        if(($("#star").val() == 0) && ($('#showStar').css("display") != "none")){
            alert("별점 0점은 불가능합니다. 버튼을 눌러 비활성화 시켜주세요.");
            e.preventDefault();
            return;
        }

        $("#ftagsForAdd").val($("#flw").val());
    });

    // 영화 자동완성
    $( "#movieSearch" ).autocomplete({
        source: function( request, response ) {
            $.ajax({
                url: "/app/movieInfo/listByKeyword",
                method: "POST",
                headers : {
                    'Content-Type': 'application/json;'
                },
                data: JSON.stringify({ "keyword": request.term }),
                success: function( data ) {
                    response($.map(data.movieList, function (item) {

                        if (item.poster_path != null) {
                            poster_path = data.imgPrefix + item.poster_path;
                        } else {
                            poster_path = '/img/default-movie-img.png';
                        }
                        return {
                            label: item.title,
                            value: item.id,
                            release_date:item.release_date,
                            poster_path:poster_path
                        }
                    }));
                }
            });
        },
        focus: function(event, ui) {
            $('#movieSearch').val(ui.item.label);
            event.preventDefault();
        },
        select: function( event, ui ) {
            $("#movieSearch").val(ui.item.label);
            $("#movieId").val(ui.item.value);

            return false;
        }
    }).data('ui-autocomplete')._renderItem = function( ul, item ) {
        return $( "<li class='media'>" ).data("item.autocomplete", item)
        .append("<img class = 'poster' src='" + item.poster_path + "' alt='"+item.label+"'>" + 
                '<div class="media-body">'+
                '<h5 class="mt-0"><b>'+ item.label +'</b></h5>'+
                '(' + item.release_date + ')'+
        '</div>')
        .appendTo( ul );
    };

    // 창닫을때
    $('#reviewModal').on('hidden.bs.modal', function (e) {           
        location.reload();
        $('#reviewModal').show();
    })
});

/* ========== 피드 무한스크롤 ========== */
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
        html += '                        <li><a href="#" class="text-dark">';
        html += data.postsResult[i].member.nickname;
        html += '                            </a></li><li>';
        
        if('null' !=data.postsResult[i].ftags){
            for(var j=0;j<data.postsResult[i].ftags.length;j++){
                html += '<a href="#" class="tagName">';
                html += data.postsResult[i].ftags[j].nickname; 
                html += '</a>';
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
            html += '   <img onclick="openDetailModal(';
            html += data.postsResult[i].pstno;
            html += ')" src="/upload/post/';
            html += data.postsResult[i].photos[0];
            html += '" data-title="';
            html += data.postsResult[i].title;
            html += '"   class="pstImgtoDetail"/>';
            html += ' <input type="hidden" data-toggle="modal" id="detailPst"data-target="#detailModal" />';
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
            html += '</span><i class="far fa-comment btmIcon c-pointer"></i>';
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

//로그인 에러
function loginError() {
    alert('로그인 후 작성할 수 있습니다.');
}

//일상/영화게시물 올리기
function postShow(id) {
    if (id == 'btnIlsang') {
        $("#pstTypeNo").val(1);
        $('.onlyMovie').hide();
    } else if(id == 'detailPst'){

    } else {
        $("#pstTypeNo").val(0);
        $('.onlyMovie').show();
    }
}

//더보기
function showMore(element,pstno){
    var html = '';

    var $more = $(element).parent().parent().parent();

    for (var j=0; j<postList.length; j++) {
        if(postList[j].pstno == pstno){
            var i = j;
            break;
        }
    }

    html += '            <div class="media row pr-3 pl-3">';
    html += '                <img src="';
    html += postList[i].member.profileImagePath;
    html += '"                   class="rprofileImg"/>';
    html += '                <div class="media-body">';
    html += '                    <ul class="memberul">';
    html += '                        <li><a href="#" class="text-dark">';
    html += postList[i].member.nickname;
    html += '                            </a></li><li>';

    if('null' !=postList[i].ftags){
        for(var j=0;j<postList[i].ftags.length;j++){
            html += '<a href="#" class="tagName">';
            html += postList[i].ftags[j].nickname; 
            html += '</a>';
        }
    }

    html += '                    </li></ul>';

    html += '<span class="cmt-date">&nbsp;';
    html +=  new Date(postList[i].createdDate).toLocaleString();
    html += '</span>'; 
    if(postList[i].pstTypeNo == 0){
        html += '<p class="dptitle">';
        html += '<b><i>';
        html += postList[i].title;
        html += '</i></b></p>';
    }

    html += '               </div>';
    html += '           </div>';
    /*html += '           <div class="clearfix media row m-1">';
    html += '               <div class="media-body">';
    html += '                   <p class="reviewCont" id="reviewCont-';
    html += postList[i].pstno;
    html += '">';
    html += makeContHtml(postList[i].content,postList[i].pstno);
    html += '</p>';
    html += '               </div>';


    if('null' !=postList[i].photos){
        html += '   <img onclick="openDetailModal(';
        html += postList[i].pstno;
        html += ')" src="/upload/post/';
        html += postList[i].photos[0];
        html += '" data-title="';
        html += postList[i].title;
        html += '"   class="pstImgtoDetail"/>';
        html += ' <input type="hidden" data-toggle="modal" id="detailPst"data-target="#detailModal" />';
    }
    html += '        </div>';

    html += '       <div class="row">';
    html += '           <div class="col-6 text-left">';

    html += '<i class="fas fa-thumbs-up btmIcon c-pointer likeColor';
    if(!postList[i].likeCheck){
        html += ' dis-none ';
    }
    html += '"id="btn-like-full-';
    html += postList[i].pstno;
    html += '" onclick="cancelLike(';
    html += postList[i].pstno;
    html += ',';
    html += postList[i].pstTypeNo;
    html += ')"></i>';
    html += '<i class="far fa-thumbs-up btmIcon c-pointer likeColor';
    if(postList[i].likeCheck){
        html += ' dis-none ';
    }
    html += '"id="btn-like-empty-';
    html += postList[i].pstno;
    html += '" onclick="addLike(';
    html += postList[i].pstno;
    html += ',';
    html += postList[i].pstTypeNo;
    html += ')"></i><span id="lCnt-';
    html += postList[i].pstno;
    html += '">';
    html += postList[i].likeCnt;
    html += '</span><i class="far fa-comment btmIcon c-pointer"  onclick="showMore(this,';
    html += postList[i];
    html += ')></i>';
    html += '<span id="cCnt-';
    html += postList[i].pstno;
    html += '">';
    html +=  postList[i].cmtCnt;
    html += '</span></div>';

    html += '   <div class="col-6 text-right">';
    if(postList[i].pstTypeNo == 0 && postList[i].star != 0){

        for(var s = 0;s<5;s++){
            if(s<postList[i].star){

                html += '<i class="fas fa-star sStar"></i>';    
            }else{

                html += '<i class="far fa-star sStar"></i>';
            }
        }
    }

    html += '  </div>'; 
    html += '       </div>';
*/
    
    

    $more.html(html);
}
