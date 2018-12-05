// 마우스 오버시 스크롤 효과
$(document.body).on('mouseover', '.boxList', function(){
            $('.scrollbar-light-blue').css('overflow', 'auto');
        }).on('mouseleave', '.boxList', function(){
            $('.scrollbar-light-blue').css('overflow', 'hidden');    
        });

//	============================
function goToFeed(mno){
    location.href = "/app/reviewFeed/Feed?id=" + mno;
}

function goToSceneReview(mvno) {
    location.href = "/app/sceneReview/review?mvno=" + mvno;
}

function goToSceneReviewDetail(mvno, srno) {
    location.href = "/app/sceneReview/review?mvno=" + mvno + "&srno=" + srno;
}

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