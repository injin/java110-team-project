/*$(function() {

  //검색버튼 클릭
    $("#showAllMovies").click(function(){
        var objParams = {
                searchCd : $("input[name=searchCd]").val() //검색할 코드 (실제로 예제에서는 사용 안함)
        }
     
        //var movieList = ${movieList};
        
        var values = []; //ArrayList 값을 받을 변수를 선언
     
        //검색할 코드를 넘겨서 값을 가져온다.      
        $.ajax("/app/movieInfo/listByKeyword",{
                
                method :"POST",
                headers : {
                    'Content-Type': 'application/json;'
                },
                data: JSON.stringify({ "keyword": keyword }),
           success: function(result) {
                if(result.movieList.length != 0) { //controller에서 넘겨준 성공여부 코드
                     
                    values = result.movieList ; //java에서 정의한 ArrayList명을 적어준다.
                     
                    $.each(values, function( index, value ) {
                       console.log( index + " : " + value.title ); //Book.java 의 변수명을 써주면 된다.
                    });
                     
                    alert("성공");
                }
                else {
                    alert("실패");
                }                   
            }
        });
         
    });
    
    
    $( "#showAllMovies" ).on('click', function(e) {
//        source: function( request, response ) {
            $.ajax({
                url: "/app/movieInfo/listByKeyword",
                method: "POST",
                headers : {
                    'Content-Type': 'application/json;'
                },
                data: JSON.stringify({ "keyword": request.term }),
                success: function( data ) {
                    alert('success');
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
           
        }),
    }).data('ui-autocomplete')._renderItem = function( ul, item ) {
        return $( "<div class='wrap'>"+"<div class='ico-wrap'>")
        .append("<div>" 
                +"<img class = 'img' src='" + item.poster_path + "' alt='"+item.label+"'>"
                +"</div>"
                +"</div>"
                +"<div class='text-wrap vcenter'>"
                +"<p class='mbr-fonts-style text1 mbr-text display-6'>"
                +"<b>"+item.label+"</b></p><br>"
                +"<p>"+item.release_date+"</p>"
                +"</div></div>")
        .appendTo('.movieFrame');
    };
    
    //검색버튼 클릭
    $("#showAllMovies").click(function(){
    });
  
    
    
    
                 count++;


                if (count == 1) {

                    alert('count==1');

                    /*            var movieList = new Array();
                               var j= 3;

                               <c:forEach items="${movieList}" var="movie">
                               movieList.push({
                                   title: '${movie.title}',
                                   popularity: ${movie.popularity},
                                   img: '${imgPrefix}'+'/'+'${movie.posterPath}'
                               });
                               </c:forEach>

                               document.getElementById('showAllMovies').onclick = function () 
                               {
                                   if(j==20) return;
                                   console.log(movieList);
                                   for(var i=j; i=j+3; i++)
                                       {
                                        document.getElementById('')
                                       }
                                   j += 3; 
                               }; 
                     
                } else {
                    alert('count==2')
                    //getMovieList(this);
                } 

            
    var keyword = '${keyword}';
            function getMovieList(input) {
                var values = []; //ArrayList 값을 받을 변수를 선언
                console.log(keyword);
                console.log(totalResults);
                //검색할 코드를 넘겨서 값을 가져온다.      
                $.ajax("/app/movieInfo/listByKeyword", {
                    method : "POST",
                    headers : {
                        'Content-Type' : 'application/json;'
                    },
                    data : JSON.stringify({
                        "keyword" : keyword,
                        "page" : count
                    }),
                    success : function(result) {
                        if (result.movieList.length != 0) { //controller에서 넘겨준 성공여부 코드

                            values = result.movieList; //java에서 정의한 ArrayList명을 적어준다.

                            $.each(values, function(index, value) {
                                console.log(index + " : " + value.title); //MovieInfoController.java 의 변수명을 써주면 된다.
                            });

                            alert("성공");
                        } else {
                            alert("실패");
                        }
                    }
                });
            }
    
     요걸로! 
    <script type="text/javascript">

    var movieList = new Array();
    var j= 3;

    <c:forEach items="${movieList}" var="movie">
    movieList.push({
        title: '${movie.title}',
        popularity: ${movie.popularity},
        img: '${imgPrefix}'+'/'+'${movie.posterPath}'
    });
    </c:forEach>

    document.getElementById('showAllMovies').onclick = function () 
    {
        if(j==20) return;
        console.log(movieList);
        for(var i=j; i=j+3; i++)
            {
             document.getElementById('')
            }
        j += 3; 
    }; 

    </script> 
   
    window.onload= function(){
         document.getElementById('showAllMovies').onclick = function () 
        { 
            alert('h');
            <c:forEach items="${movieList}" var="movie" begin="count" end="count+3">
            console.log(movieList);
                movieList.push({
                    title: '${movie.title}',
                    popularity: ${movie.popularity},
                    posterPath: '${movie.posterPath}'
                });
            </c:forEach>
                
            console.log(movieList);

        }; 
         document.getElementById('showAllTags').onclick = function () 
        {
            alert('p'); 
        };
        }; 
     
    
    
    <script type="text/javascript">


        $('.showAll').click(function() {
           <c:forEach items="${movieList}" var="list" begin="3" end="5">
           
               console.log($(this));
               
           </c:forEach>
       }); 
    </script> 
    
});
*/