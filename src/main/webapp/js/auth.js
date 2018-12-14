//  커버 & 프로필 이미지 업로드 관련
$("#imageUpload-cover").change(function() {
  coverURL(this);
});

$("#imageUpload-profile").change(function() {
  profileURL(this);
});

function profileURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#profilePreview').css('background-image', 'url('+e.target.result +')');
      $('#profilePreview').hide();
      $('#profilePreview').fadeIn(650);
    }
    reader.readAsDataURL(input.files[0]);
  }
}

function coverURL(input) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();
    reader.onload = function(e) {
      $('#coverPreview').css('background-image', 'url('+e.target.result +')');
      $('#coverPreview').hide();
      $('#coverPreview').fadeIn(650);
    }
    reader.readAsDataURL(input.files[0]);
  }
}


//  가입
function signUpCheck() {
  $form = $('#detailForm');
  $nickname = $('#nickname');
  if($nickname.val() === null || $nickname.val() === '(알수없음)' || $nickname.val() === "") {
    commonAlert('error', "닉네임을 입력해 주세요");
    $nickname.focus();
    return;
  }

  if(selecList.length < 5) {
    commonAlert('error', "영화를 5편 이상 선정 해 주세요");
    $inputKeyword.focus();
    return
  }
  $form.submit();
}

// 회원정보 업데이트
function updateCheck() {
    $form = $('#detailForm');
    $nickname = $('#detailForm #nickname');
    if($nickname.val() == null || $nickname.val() == '(알수없음)' || $nickname.val() == "") {
        commonAlert('error', "닉네임을 입력해 주세요");
        $nickname.focus();
        return;
    }
    $form.submit();
}

//  home으로
function goToHome() {
  text = '회원 상세 정보를 입력하지 않으시면,<br>일부 서비스에 제한이 있을수 있습니다.';
  var n = new Noty({
    theme: 'sunset',
    text: text,
    buttons: [
      Noty.button('입력하기', 'btn btn-light buttonNo', function () {
        $('#input-srch-keyword').focus();
        n.close();
      }),
      Noty.button('홈으로', 'btn btn-primary buttonYes', function () {
        location.href = '/app/';
        n.close();
      })
      ]
  });
  n.show();
}

//  탈퇴
function bye () {
  text = 'SceneCok에서 탈퇴를 하시면,<br> 일부 기록은 삭제되지 않을 수 있습니다';
  var n = new Noty({
    theme: 'sunset',
    text: text,
    buttons: [
      Noty.button('남아있기', 'btn btn-light buttonNo', function () {
        n.close();
      }),
      Noty.button('탈퇴하기', 'btn btn-primary buttonYes', function () {
        signOut();
        n.close();
      })
      ]
  });
  n.show();
}

function signOut() {
  var accessToken = Kakao.Auth.getAccessToken();
  Kakao.API.request({
    url: '/v1/user/unlink',
  });
  $('#signOutForm').submit();
}