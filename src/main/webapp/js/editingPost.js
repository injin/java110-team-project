/* ========== 게시물 수정 모달  ========== */
function openEditingModal(pstno, type) {

  //  index
  for (var i = 0; i < postList.length; i++) {
    if (postList[i].pstno == pstno) {
      var index = i;
      break;
    }
  }
  
  //  모달 속성 바꿔 주기
  $('#reviewModal .modal-title').text('리뷰 수정하기');
  $('#reviewModal form').attr('action', 'edit');
  
  //  pstno 넣어주기
  $('#reviewModal .modal-footer').append('<input type="hidden" name="pstno" id="pstno">');
  $('#reviewModal #pstno').val(postList[index].pstno);
  
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
  var cont = $('#reviewCont-' + postList[index].pstno).html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
  cont = cont.replace(/(<([^>]+)>)/ig,"");
  $('#reviewModal #reviewTxtarea').html(cont);
  
  //  별점 숨김 값 주기 
  var star = postList[index].star;
  $('#reviewModal input:hidden[id="star"]').val(star);
  
  //  별 찍기
  $('#reviewModal #showStar').remove('#showStar');
  $('#reviewModal #temp').starrr({
    change: function(e, value){
    	console.log(value);
    	$("#star").val(value);
    },
    rating: star
  })
  $('#reviewModal #temp').attr('id', 'showStar');
  $('#reviewModal #showStar').attr('class', 'starrr onlyMovie photo-star-section');
  
  
  
  
  
  postShow(type);
}