$(function() {

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
        // return array of file name
        console.log(names);
    });

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
    
   /* $('#followGroup').tagsinput({
        itemValue:'id',
        itemText:'follow',
        typehead:{
            source:function(query){
                return $.getJSON('cities.json');
            }
        }
    });*/

    $('#modalSubmit').on('click', function(e) {

        console.log($("#pstTypeNo").val() == 0);
        if($("#pstTypeNo").val() == 0){
            console.log($("#movieId").val().trim()  == 0);    
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
    
    $('#reviewModal').on('hidden.bs.modal', function (e) {           
        /*$(this).find('form')[0].reset();
        $('.globe').show();
        $('.lock').hide();*/
        location.reload();
        $('#reviewModal').show();
    })
    
    // 아래 전부 친구태그
    var fList = new Bloodhound({
        datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
        queryTokenizer: Bloodhound.tokenizers.whitespace,
        local:[ { "value": 1 , "text": "Amsterdam"   },
        { "value": 2 , "text": "London"      },
        { "value": 3 , "text": "Paris"       },
        { "value": 4 , "text": "Washington"  },
        { "value": 5 , "text": "Mexico City" },
        { "value": 6 , "text": "Buenos Aires"},
        { "value": 7 , "text": "Sydney"      },
        { "value": 8 , "text": "Wellington"  },
        { "value": 9 , "text": "Canberra"    },
        { "value": 10, "text": "Beijing"     },
        { "value": 11, "text": "New Delhi"   },
        { "value": 12, "text": "Kathmandu"   },
        { "value": 13, "text": "Cairo"       },
        { "value": 14, "text": "Cape Town"   },
        { "value": 15, "text": "Kinshasa"    }
      ]
      });
      fList.initialize();

      /**
       * Objects as tags
       */
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
});