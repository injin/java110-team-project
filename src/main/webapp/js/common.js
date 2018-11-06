// LOGIN ========================
Kakao.init('6295fa2342cde6565c7cbf2e4d4e5428');
function loginWithKakao() {
  // 로그인 창을 띄웁니다.
  Kakao.Auth.login({
    success: function(authObj) {
        console.log(authObj.access_token);
        alert(JSON.stringify(authObj));
        console.log(JSON.stringify(authObj));
        autoLogin(authObj.access_token);
    },
    fail: function(err) {
      alert(JSON.stringify(err));
    }
  });
};

/*{"access_token":"er280QjnhJaDZ1jd9zcd3-UpR5uZ_GZvOQvpzgopdgcAAAFm6K347w",
    "token_type":"bearer",
    "refresh_token":"C1-cK6YzB_SIzpqzzO8Mu5hVibrHAwjBy8oVaAopdgcAAAFm6K347A",
    "expires_in":7199,"scope":"age_range birthday account_email gender profile",
    "refresh_token_expires_in":2591999}
*/

function autoLogin(accessToken) {
    
    location.href = "/app/auth2/kakaologin?accessToken=" + accessToken;
    
    
}

//==============================





