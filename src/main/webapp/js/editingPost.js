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
  //  영화 바꾸지 못하게 막기
  $('#reviewModal input[name=title]').attr("disabled",true);
  
  //  공개 비공개 여부 가져오기
  if(postList[index].open === false){
    $('#reviewModal input:checkbox[class="open"]').prop("checked", false);
    $('#reviewModal #lock').css("display", "");
    $('#reviewModal #globe').css("display", "none");
  }  else {
    $('#reviewModal input:checkbox[class="open"]').prop("checked", true);
    $('#reviewModal #lock').css("display", "none");
    $('#reviewModal #globe').css("display", "");
  }
  
  //  게시물 내용 가져오기
  console.log("1 : " + $('#reviewCont-' + postList[index].pstno).text());
  console.log("2 : " + $('#reviewCont-' + postList[index].pstno).html());
  console.log("3 : " + $('#reviewCont-' + postList[index].pstno).html().replace(/<br\s?\/>/g,"\n"));
  
  
  
  
  $('#reviewModal #reviewTxtarea').html($('#reviewCont-' + postList[index].pstno).text().replace(/<br\s?\/>/g,"\n") );
  //  줄바꿈이 깨지네?
  
  
  /*
  var origin = $('#reviewCont-' + postList[index].pstno).text();
  console.log( origin );
  var txt = origin.replace(/<br\s?\/?>/g,"\n");
  console.log(txt);
  */
    
  
//  $('#reviewModal #editingTxtarea').html( $('#reviewCont-' + postList[index].pstno).text() );
//  .replace(/<br\s?\/?>/g,"\n")
  
   
  
  //  별점 숨김 값 주기 
  var star = postList[index].star;
  $('#reviewModal input:hidden[id="star"]').val(star);
  
  //  별 그림
  $('#reviewModal #showStar').remove('#showStar');
  $('#reviewModal #temp').starrr({
	  rating: star
  })
  $('#reviewModal #temp').attr('id', 'showStar');
  $('#reviewModal #showStar').toggleClass('starrr onlyMovie photo-star-section');
  
  
  postShow(type);
}