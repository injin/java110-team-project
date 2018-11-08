// LOGIN ========================
Kakao.init('6295fa2342cde6565c7cbf2e4d4e5428');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
        autoLogin(authObj.access_token);
    },
    fail: function(err) {
      alert('로그인에 실패하였습니다.' + err);
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


// MODAL RESET ==============================

$('.modal').on('hidden.bs.modal', function (e) {
  location.reload();
  
});
// ==============================



