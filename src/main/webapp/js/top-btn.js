$(function(){
  $(window).scroll(function () {
    if ($(this).scrollTop() >= 50) {
      $('#top').fadeIn("slow");
    } else {
      $('#top').fadeOut("slow");
    }
  });

  $('#top').click(function() {
    $('body,html').animate({
      scrollTop : 0
    }, 500);
  });
}); 