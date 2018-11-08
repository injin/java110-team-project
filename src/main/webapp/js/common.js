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
    location.href = "/app/auth2/kakaologin?accessToken=" + accessToken;
}

// MODAL RESET ==============================

$('.modal').on('hidden.bs.modal', function (e) {
    console.log('modal close');
  $(this).find('form')[0].reset()
});
// ==============================



