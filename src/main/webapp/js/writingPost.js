$(function() {

    $('#globe').show();
    $("#lock").hide();

    /* ========== 이미지 업로드 관련  ========== */
    var uploadFileNames = [];

    $('body').on('change', '.picupload', function(event) {
        var files = event.target.files;

        if(uploadFileNames.length+files.length>3){
            alert("3장 이하의 사진만 업로드 할 수 있습니다.");
        }else{
            fileUploadAjax(files);
        }
    });

    $('body').on('click', '.remove-pic', function() {
        var removeItem = $(this).attr('data-name');
        fileRemoveAjax(removeItem);
    });

    function removeUploadedImg(removeItem) {
        $('#li-' + removeItem).remove();
        var yet = uploadFileNames.indexOf(removeItem);
        if (yet != -1) {
            uploadFileNames.splice(yet, 1);
        }
    }

    function fileRemoveAjax(fileName) {

        $.ajax({
            url : "/app/reviewFeed/fileUpload-remove",
            type: "post",
            data : { 'fileName' : fileName },
            success : function(result) {
                if (result == true) {
                    removeUploadedImg(fileName);
                }
            },
            error : function(error) {
                alert("파일 삭제에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }

    function fileUploadAjax(files) {

        var formData = new FormData();
        for (var i = 0; i < files.length; i++) {
            formData.append('files', files[i]);
        }
        $.ajax({
            url : "/app/reviewFeed/fileUpload-upload",
            contentType: false,
            processData: false,
            type: "post",
            data : formData,
            success : function(data) {

                if (data.length == files.length) {
                    var newFileNames = [];
                    data.forEach(function(value) {
                        uploadFileNames.push(value);
                        newFileNames.push(value);
                    });
                    displayUploadedImgs(files, newFileNames);
                }
            },
            error : function(error) {
                alert("파일 업로드에 실패하였습니다.");
                console.log(error);
                console.log(error.status);
            }
        });
    }

    function displayUploadedImgs(files, newFileNames) {
        var $mlist = $("#media-list");
        for (var i = 0; i < files.length; i++) {
            files[i].realName = newFileNames[i];
        }

        for (var i = 0; i < files.length; i++) {
            var file = files[i];
            if (file.type.match('image')) {

                var picReader = new FileReader();
                picReader.realName = file.realName;
                picReader.fileName = file.name;
                picReader.addEventListener("load", function(event) {

                    var picFile = event.target;
                    var div = document.createElement("li");
                    div.id = 'li-' + picFile.realName;
                    div.innerHTML = "<img src='" + picFile.result + "' title='" + picFile.name + "'/>" 
                    + "<div  class='post-thumb'><div class='inner-post-thumb'>"
                    + "<a data-name='" + picFile.realName + "' class='c-pointer remove-pic'><i class='fa fa-times' aria-hidden='true'>"
                    + "</i></a><div></div>";
                    $mlist.prepend(div);
                });
            } else {
                //이미지외의자료임
            }
            picReader.readAsDataURL(file);
        }
    }

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
            $('#globe').show();
            $("#lock").hide();
        }else{
            $('#lock').show();
            $("#globe").hide();
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

        $("#photList").val(uploadFileNames);
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

//일상/영화게시물 올리기
function postShow(id) {
    if (id == 'btnIlsang') {
        $("#pstTypeNo").val(1);
        $('.onlyMovie').hide();
    } else {
        $("#pstTypeNo").val(0);
        $('.onlyMovie').show();
    }
}
