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
  $('#reviewModal .modal-footer').append('<input type="hidden" name="pstno" id="pstno">');
  $('#reviewModal #pstno').val(postList[index].pstno);
  
  //  친구 태그 숨겨주기
  $('#reviewModal #ftag-input').css("display", "none");
  
  //  submit 버튼 속성 바꿔주기
  $('#reviewModal #modalSubmit').replaceWith('<button type="submit" class="btn btn-primary" id="editSubmit">EDIT</button>');
  
  //  영화 제목, ID 가져오기
  $('#reviewModal #movieSearch').val(postList[index].title);
  $('#reviewModal #movieId').val(postList[index].mvno);
  //  영화 바꾸지 못하게 막기
  $('#reviewModal input[name=title]').attr("disabled",true);
  
  //  공개 비공개 여부 가져오기
  if(postList[index].open === false){
    $('#reviewModal input:checkbox[class="open"]').prop("checked", false);
    $('#reviewModal #globe').hide();
    $("#reviewModal #lock").show();
  }  else {
    $('#reviewModal input:checkbox[class="open"]').prop("checked", true);
  }
  
  //  게시물 내용 가져오기
  var cont = $('#reviewCont-' + postList[index].pstno).html().replace(/(<br>|<br\/>|<br \/>)/g, '\r\n');
  cont = cont.replace(/(<([^>]+)>)/ig,"");
  $('#reviewModal #reviewTxtarea').html(cont);
  
  //  별점 숨김 값 주기 
  var star = postList[index].star;
  $('#reviewModal input:hidden[id="star"]').val(star);
  
  //  별 찍기
  $('#reviewModal #showStar').remove();
  $('#reviewModal #temp').starrr({
    change: function(e, value){
    	$("#star").val(value);
    },
    rating: star
  })
  $('#reviewModal #temp').attr('class', 'starrr onlyMovie photo-star-section');
  $('#reviewModal #temp').attr('id', 'showStar');
  
  if ( $('#reviewModal input:hidden[id="star"]').val() == 0) {
    $('#reviewModal #showStar').attr('class', 'starrr onlyMovie photo-star-section nostar');
  }
  
  /*  시간 관계상 사진 update 기능은 처리 하지 않기로 했음.
  //  사진 처리
  if (postList[index].photos.length != 0){
    
  }
  */
  $('#reviewModal .file').hide();
  $('#reviewModal #media-list').hide();
  
  postShow(type);
  
  // editSubmit
  $('#editSubmit').on('click', function(e) {
    console.log('edit??');

    if(!document.getElementById("reviewTxtarea").value.replace(/(^\s*)|(\s*$)/gi, "")){
      commonAlert('error', "내용을 작성해주세요.");
      e.preventDefault();
      return;
    }
    if(($("#star").val() == 0) && ($('#showStar').css("display") != "none")) {
      commonAlert(error, "별점 0점은 불가능합니다. 버튼을 눌러 비활성화 시켜주세요.");
      e.preventDefault();
      return;
    }

//      $("#photList").val(uploadFileNames);
//      $("#ftagsForAdd").val($("#flw").val());
  });
}