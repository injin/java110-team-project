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

function loginAlert() {
    commonAlert('error', '로그인 후 이용하실 수 있습니다.');
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