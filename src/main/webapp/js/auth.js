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
  }

  if(selecList.length < 5) {
    commonAlert('error', "영화를 5편 이상 선정 해 주세요");
    $inputKeyword.focus();
    return
  }
  $form.submit();
}

//  home으로
function goToHome() {
  location.href = '/app/';
}

//  탈퇴
function bye () {
  var accessToken = Kakao.Auth.getAccessToken();
  console.log(accessToken);
  Kakao.API.request({
    url: '/v1/user/unlink',
  });
}