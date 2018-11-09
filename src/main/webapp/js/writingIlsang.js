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
    
    $(".htxtarea").blur(function() {
        
        $(this).html($(this).html().replace(/(#\S+)/, '<span style="color: blue">$1</span>');
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
});

