$(function() {
    var names = [];
    $('body').on('change', '.picupload', function(event) {
        var getAttr = $(this).attr('click-type');
        var files = event.target.files;
        var output = document.getElementById("media-list2");
        var z = 0
        if (getAttr == 'type1') {

            $('#media-list2').html('');
            $('#media-list2').html('<li class="myupload"><span><i class="fa fa-plus" aria-hidden="true"></i><input type="file" click-type="type2" id="picupload2" class="picupload" multiple></span></li>');
            $('#hint_brand').modal('show');

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

                        $("#media-list2").prepend(div);


                    });
                } else {

                    var picReader = new FileReader();
                    picReader.fileName = file.name
                    picReader.addEventListener("load", function(event) {

                        var picFile = event.target;

                        var div = document.createElement("li");

                        div.innerHTML = "<video src='" + picFile.result + "'" +
                            "title='" + picFile.name + "'></video><div id='" + z + "'  class='post-thumb'><div  class='inner-post-thumb'><a data-id='" + event.target.fileName + "' href='javascript:void(0);' class='remove-pic'><i class='fa fa-times' aria-hidden='true'></i></a><div></div>";
                        $("#media-list2").prepend(div);

                    });

                }
                picReader.readAsDataURL(file);
            }
            console.log(names);
        } else if (getAttr == 'type2') {
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

                        $("#media-list2").prepend(div);

                    });
                } else {
                    var picReader = new FileReader();
                    picReader.fileName = file.name
                    picReader.addEventListener("load", function(event) {

                        var picFile = event.target;

                        var div = document.createElement("li");

                        div.innerHTML = "<video src='" + picFile.result + "'" +
                            "title='" + picFile.name + "'></video><div class='post-thumb'><div  class='inner-post-thumb'><a href='javascript:void(0);' data-id='" + event.target.fileName + "' class='remove-pic'><i class='fa fa-times' aria-hidden='true'></i></a><div></div>";

                        $("#media-list2").prepend(div);

                    });
                }
                picReader.readAsDataURL(file);

            }
            // return array of file name
            console.log(names);
        }

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

    
    $('body').on('click', '#open2',function(e) {
        if(this.checked) {
            $('#globe2').show();
            $("#lock2").css("display","none");
        }else{
            $('#lock2').show();
            $("#globe2").css("display","none");
        }
     });


    $('#hint_brand').on('hidden.bs.modal', function(e) {
        names = [];
        z = 0;
    });
    
    
});