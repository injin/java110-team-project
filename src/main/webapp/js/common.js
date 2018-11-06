/*============ 로그인============*/
Kakao.init('6295fa2342cde6565c7cbf2e4d4e5428');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
      alert(JSON.stringify(authObj));
    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
};


/*==============================*/