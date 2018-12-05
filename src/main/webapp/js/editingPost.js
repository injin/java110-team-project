/* ========== 게시물 수정 모달  ========== */
function openEditingModal(pstno, type) {

  //  index
  for (var i = 0; i < postList.length; i++) {
    if (postList[i].pstno == pstno) {
      var index = i;
      break;
    }
  }
  console.log(postList[index]);
  
  //  모달 속성 바꿔 주기
  $('#reviewModal .modal-title').text('리뷰 수정하기');
  $('#reviewModal form').attr('action', 'edit');
  
  //  pstno 넣어주기
  $('#reviewModal .modal-header').append('<input type="hidden" id="pstno" val="0">');
  $('#reviewModal #pstno').val(pstno);
  
  //  친구 태그 숨겨주기
  $('#reviewModal #ftag-input').remove('#ftag-input');
  
  
  //  submit 버튼 속성 바꿔주기
  $('#reviewModal #modalSubmit').remove('#modalSubmit');
  $('#reviewModal .modal-footer').append('<button type="submit" class="btn btn-primary" id="editSubmit">EDIT</button>');
  
  //  영화 제목, ID 가져오기
  $('#reviewModal #movieSearch').val(postList[index].title);
  $('#reviewModal #movieId').val(postList[index].mvno);
  
  //  공개 비공개 여부 가져오기
  if(postList[index].open === false){
    console.log(postList[index].open);
    $('#reviewModal input:checkbox[class="open"]').prop("checked", false);
    $('#reviewModal #lock').css("display", "");
    $('#reviewModal #globe').css("display", "none");
  }  else {
    console.log(postList[index].open);
    $('#reviewModal input:checkbox[class="open"]').prop("checked", true);
    $('#reviewModal #lock').css("display", "none");
    $('#reviewModal #globe').css("display", "");
  }
  
  //  게시물 내용 가져오기
  $('#reviewModal #reviewTxtarea').html($('#reviewCont-' + postList[index].pstno).text().replace(/<br\s?\/>/g,"\n") );
  //  줄바꿈이 깨지네?
  /*
  var origin = $('#reviewCont-' + postList[index].pstno).text();
  console.log( origin );
  var txt = origin.replace(/<br\s?\/?>/g,"\n");
  console.log(txt);
  */
  
//    var cont = $('#reviewCont-' + postList[index].pstno).html();
//    cont = cont.replace(/<br>/g, '\n');
//    $('#reviewModal #editingTxtarea').text(cont);
    
  
//  $('#reviewModal #editingTxtarea').html( $('#reviewCont-' + postList[index].pstno).text() );
//  .replace(/<br\s?\/?>/g,"\n")
  
  
  
  
/*
//  tag는 뺀다.
  var list = postList[index].ftags;
  
  if (list.length > 0) {
    for (var i = 0; i < list.length; i++){
      console.log(list[i]);
      $('#reviewModal #editingFlw').text(list[i]);
    }
  }
*/
  
  
//  $('#reviewModal #cdate').text(new Date(postList[index].createdDate).toLocaleString()); 
  
  //  별점 숨김 값 주기 별 먹힘 ㅇㅇ 
  var star = postList[index].star;
  $('#reviewModal input:hidden[id="star"]').val(star);
   
  $('#reviewModal #showStar').remove('#showStar');
  $('#reviewModal #temp').starrr({
	  rating: star
  })
  $('#reviewModal #temp').attr('id', 'showStar');
  $('#reviewModal #showStar').toggleClass('starrr onlyMovie photo-star-section');
  
  
/*
  // 이미지 추가부분
  if (postList[index].photos.length == 0) {
	  console.log("ho");
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
*/
  
/*
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