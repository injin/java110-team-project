/**
 * INJIN -> JEAHA 새끼야 
 * 프로필 사진 누르면 그 사람 피드로 넘어가게 js 만들렴!
 */

// 마우스 오버시 스크롤 효과
$('.boxList').on('mouseover', function(){
            $('.scrollbar-light-blue').css('overflow', 'auto');
        }).on('mouseleave', function(){
            $('.scrollbar-light-blue').css('overflow', 'hidden');    
        });


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

$(function () {
	$('#signOut').click(function () {
		var accessToken = Kakao.Auth.getAccessToken();
		console.log(accessToken);
		location.href='/app/auth/signout';
		
	});
});

function bye () {
	var accessToken = Kakao.Auth.getAccessToken();
	console.log(accessToken);
	Kakao.API.request({
        url: '/v1/user/unlink',
});
	
}

$(function(){
    $(".return-top").hide(); // 탑 버튼 숨김 - 이걸 빼면 항상 보인다.
    
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) { // 스크롤 내릴 표시
            $('.return-top').fadeIn();
        } else {
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