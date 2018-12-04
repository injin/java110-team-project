/* ========== 게시물 수정 모달  ========== */
function openEditingModal(pstno, type) {
  for (var i = 0; i < postList.length; i++) {
    if (postList[i].pstno == pstno) {
      var index = i;
      break;
    }
  }
  console.log(postList[index]);
  
/* ========== data 가져옴  ========== */

  $('#editingModal #movieSearch').val(postList[index].title);
  $('#editingModal #movieId').val(postList[index].mvno);
  
  if(postList[index].open === false){
    console.log(postList[index].open);
    $('#editingModal input:checkbox[class="open"]').prop("checked", false);
    $('#editingModal .l').css("display", "");
    $('#editingModal .g').css("display", "none");
  }  else {
    console.log(postList[index].open);
    $('#editingModal input:checkbox[class="open"]').prop("checked", true);
    $('#editingModal .l').css("display", "none");
    $('#editingModal .g').css("display", "");
  }
  
  /*
  var origin = $('#reviewCont-' + postList[index].pstno).text();
  console.log( origin );
  var txt = origin.replace(/<br\s?\/?>/g,"\n");
  console.log(txt);
  */
  
//    var cont = $('#reviewCont-' + postList[index].pstno).html();
//    cont = cont.replace(/<br>/g, '\n');
//    $('#editingModal #editingTxtarea').text(cont);
    
  
  $('#editingModal #editingTxtarea').html($('#reviewCont-' + postList[index].pstno).text().replace(/<br\s?\/>/g,"\n") );
  
//  $('#editingModal #editingTxtarea').html( $('#reviewCont-' + postList[index].pstno).text() );
//  .replace(/<br\s?\/?>/g,"\n")

  
  
  
/*
//  tag는 뺀다.
  var list = postList[index].ftags;
  
  if (list.length > 0) {
    for (var i = 0; i < list.length; i++){
      console.log(list[i]);
      $('#editingModal #editingFlw').text(list[i]);
    }
  }
*/
  
  
  
//  $('#editingModal input:text[class="editingFlw"]').val(postList[index].ftags.val());
  
//  $('#editingModal #dpstno').val(postList[index].pstno);
//  $('#editingModal #cdate').text(new Date(postList[index].createdDate).toLocaleString()); 
  
   
  // 별 부분
  var star = postList[index].star;
  var shtml='';
  if (star != 0) {
    for (var i = 0; i < 5; i++) {
      if (i < star) {
        shtml += '<i class="fas fa-star sStar"></i>';
        console.log('star');
      } else {
        shtml += '<i class="far fa-star sStar"></i>';
        console.log('unstar');
      }
    }
  }
  $('#starbtn').html(shtml);
  
  
  
  /*
  
  // 이미지 추가부분
  if (postList[index].photos.length == 0) {
    $('#leftcol').hide();
    $('#rightcol').removeClass('col-4').addClass('col-12');
    $('#editingMadal .modal-dialog').css('maxWidth', '35rem');
  } else {
    var h = '';
    h += '<ol class="carousel-indicators">';
    for (var i = 0; i < postList[index].photos.length; i++) {
      if (i == 0) {
        h += '  <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'" class="active"></li>';
      } else {
        h += '  <li data-target="#carouselExampleIndicators" data-slide-to="'+ i +'"></li>';    
      }
    }
    h += '</ol>';
    h += '<div class="carousel-inner">';
    for (var i = 0; i < postList[index].photos.length; i++) {
      if(i == 0){
        h += '  <div class="carousel-item active">';}
      else{
        h += '  <div class="carousel-item">';    
      }
      h += '    <img class="d-block w-100" src="/upload/post/'+ postList[index].photos[i] +'" alt="'+ i +'_slide" style="height: 44rem;">';
      h += '  </div>';
    }
    h += '</div>';

    h += '<a class="carousel-control-prev" href="#carouselExampleIndicators"';
    h += '  role="button" data-slide="prev">';
    h += '  <span class="carousel-control-prev-icon" aria-hidden="true"></span>'; 
    h += '  <span class="sr-only">Previous</span>';
    h += '</a> <a class="carousel-control-next"';
    h += '  href="#carouselExampleIndicators" role="button" data-slide="next">';
    h += '  <span class="carousel-control-next-icon" aria-hidden="true"></span>';
    h += '  <span class="sr-only">Next</span>';
    h += '</a>';
  }


  $('#carouselExampleIndicators').html(h); 

  // 친구태그 부분
  html = '';
  for (var i = 0; i < postList[index].ftags.length; i++) {
    html +='<a href="#" style="color: blue; font-size: 0.2rem; vertical-align: top;">';
    html += postList[index].ftags[i].nickname;
    html +='</a>';
  }
  $('#dftags').html(html);
*/
  postShow(type);
}