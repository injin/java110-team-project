$(function() {
    var names = [];
    $('body').on('change', '.picupload', function(event) {
        var files = event.target.files;
        if($("#movieModal").hasClass("show")){
            var output = document.getElementById("media-list1");
            var $mlist = $("#media-list1");
        }else{
            var output = document.getElementById("media-list2");
            var $mlist = $("#media-list2");
        }
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
                    "title='" + picFile.name + "'/><div  class='post-thumb'><div class='inner-post-thumb'><a href='javascript:void(0);' data-id='" + event.target.fileName + "' class='remove-pic'><i class='fa fa-times' aria-hidden='true'></i></a><div></div>";

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

        // return array of file name
        console.log(names);

    });

    $('.starrr').starrr({
        change: function(e, value){

            console.log(value);
            if (value) {
                $('.your-choice-was').show();
                $('.choice').text(value);
            } else {
                $('.your-choice-was').hide();
            }
        }
    });

    $("#starbtn").click(function () {
        $('.starrr a').toggleClass("nostar");
    });

    $('.open').on('click', function(e) {
        if(this.checked) {
            $('.globe').show();
            $(".lock").css("display","none");
        }else{
            $('.lock').show();
            $(".globe").css("display","none");
        }
    });


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
            return false;
        },
//      minLength: 3,
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

});
