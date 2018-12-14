$(function(){
  $(window).scroll(function () {
    var endPoint = $(document).height() - $('footer').height() - $('header').height();

    if ($(this).scrollTop() >= 100) {
      $('#top').fadeIn();
      
      if(endPoint - 850 < $(this).scrollTop()){
        $('#top').css('bottom', 10 + $('footer').height() );
      } else {
        $('#top').css('bottom','15px');
      }
      
    } else {
      $('#top').fadeOut();
    }
  });
  
  $('#top').click(function() {
    $('body,html').animate({
      scrollTop : 0
    }, 500);
  });
  
}); 