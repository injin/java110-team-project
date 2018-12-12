//마우스 오버시 스크롤 효과
$(document.body).on('mouseover', '.scrollbar-light-blue', function(){
  $(this).css('overflow', 'overlay');
}).on('mouseleave', '.scrollbar-light-blue', function(){
  $(this).css('overflow', 'hidden');
});
//CONFIRM ==========================
function commonConfirm(no, text){
  var n = new Noty({
    theme: 'sunset',
    text: text,
    buttons: [
      Noty.button('NO', 'btn btn-light buttonNo', function () {
        console.log('button 2 clicked');
        n.close();
      }),
      Noty.button('YES', 'btn btn-primary buttonYes', function () {
        /*$(this).css('float', 'right');*/
        deleteLbm(no);
        n.close();
        console.log('button 1 clicked');
      }, {id: 'button1', 'data-status': 'ok'})
      ]
  });
  n.show();
}

//ALERT ============================
function commonAlert(type, text) {
  new Noty({
    type: type,
    theme: 'sunset',
    layout: 'topRight',
    text: text,
    processBar: true,
    timeout: 3500
  }).show();
}


//LINK ============================
function goToFeed(mno){
  location.href = "/app/reviewFeed/Feed?id=" + mno;
}

function goToSceneReview(mvno) {
  location.href = "/app/sceneReview/review?mvno=" + mvno;
}

function goToSceneReviewDetail(mvno, srno) {
  location.href = "/app/sceneReview/review?mvno=" + mvno + "&srno=" + srno;
}

//LOGIN ========================
Kakao.init('6295fa2342cde6565c7cbf2e4d4e5428');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
      autoLogin(authObj.access_token);
    },
    fail: function(err) {
      commonAlert('error', '로그인에 실패하였습니다.');
    }
  });
};


function autoLogin(accessToken) {
  location.href = "/app/auth/kakaologin?accessToken=" + accessToken;
}


function logoutKakao(){
  Kakao.Auth.logout(
      function(obj) {
        if(obj==true){}else{}
        location.href='/app/auth/kakaologout';
      }
  );
};

$(function () {
  $('#signOut').click(function () {
    var accessToken = Kakao.Auth.getAccessToken();
    location.href='/app/auth/signout';
  });
});

$(function(){
  $(window).scroll(function () {
    var endPoint = $(document).height() - $('footer').height()-$('header').height();

    if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
      $('.return-top').fadeIn();

      if(endPoint-700<$(this).scrollTop()){
        $('.return-top').css('bottom', 40+$('footer').height());
      }else{
        $('.return-top').css('bottom','15px');
      }
    }else {
      $('.return-top').fadeOut();
    }
  });

  $('.return-top').click(function () {
    $('body,html').animate({
      scrollTop: 0  //탑 설정 클수록 덜올라간다
    }, 500);  // 탑 이동 스크롤 속도를 조절할 수 있다.
    return false;
  });
}); 