$(function() {

    $( "#Search" ).autocomplete({
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
            $('#Search').val(ui.item.label);
            return false;
        },
//      minLength: 3,
        select: function( event, ui ) {
            $("#Search").val(ui.item.label);
            $("#hs_movieId").val(ui.item.value);
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
