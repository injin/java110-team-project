  var $inputKeyword = $('#input-srch-keyword');
  var $srchMovieList = $('#list-search-movie');
  var $chooseMvList = $('#list-choose-movie');
  var selecList = [];
  
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
  
  //   FORM TAG 안의 검색창에서 Enter Key 기능
  $("#input-srch-keyword").keypress(
       function(event){
       if (event.which == '13') {
           event.preventDefault();
           findMoviesByKeyword();
       }
  });
  
  //  영화 검색
  function findMoviesByKeyword() {
      var keyword = document.getElementById('input-srch-keyword').value;
      if (keyword == '') {
          alert('키워드를 입력해주세요');
          return;
      }
      
      $.ajax("/app/movieInfo/listByKeyword", {
          method: "POST",
          headers : {
              'Content-Type': 'application/json'
          },
          data: JSON.stringify({ "keyword": keyword }),
          before: function() {
              $srchMovieList.html('').hide();
          },
          success: function(data) {
              
              var liHtml = '';
              if (data.movieList.length == 0) {
                  liHtml = '<li class="list-group-item">조회된 결과가 없습니다.</li>';
              } else {
                  liHtml = makeMovieListHtml(data);
              }
              $srchMovieList.html(liHtml);
          },
          complete: function() {
              $srchMovieList.show();
          },
          error: (xhr, status, msg) => {
              $srchMovieList.text('영화 정보를 가져오는데 실패하였습니다.');
              console.log(status);
              console.log(msg);
          }
      });
  }
  
  // html 출력
  function makeMovieListHtml(data) {
      var html = '';
      data.movieList.forEach(function(obj, idx) {
          console.log('가져온 정보' + obj);
          html += '<li class="list-group-item"><div class="media">';
          html += '<img class="mr-3 w50" src="'
              if (obj.poster_path != null) {
                  html += data.imgPrefix + obj.poster_path;
              } else {
                  html += '/img/default-movie-img.png';
              }
          html += '" alt="' + obj.title + '">';
          html += '<div class="media-body">';
          html += '<h5 class="mt-0"><b>' + obj.title + '</b></h5>';
          html += '(' + obj.release_date + ')';
          html += '<span style="visibility: hidden;">(' + obj.id + ')</span>';
          html += '<br>';
          html += `<button type="button" onclick="addList(` + obj.id + `, '` + obj.title + `')" `;
          html += ' name="mvList" class="badge badge-primary badge-pill" style="cursor: pointer;">등록</button>';
          html += '</div>';
          html += '</li>';
          console.log(idx + ':' + obj.title + ':' + obj.release_date);
          });
      return html;
  }
  
  //배열의 proto 길이 제한.
  Array.prototype.add = function(x) {
      this.unshift(x);
      this.maxLength = 20;
      if (this.maxLength !== undefined && this.length > this.maxLength){
          this.pop();
          alert('20개 이상 선택 할 수 없습니다.');
          return;
      } 
  }
   /* 
    테스트 코드
    
    var a = [];
    for ( var i = 0; i <= 40; i++) {
        a.add(i);
        console.log(a);
    }
    */

  
  //영화 선정 리스트를 위한 배열과 메소드
  function addList(id, title) {
    for (var i in selecList) {
      if (selecList[i].mvno === id){
          alert('이미 선택한 영화 입니다.');
          break;
      } else {
        makeFavListHtml(id, title);
        selecList.add({mvno:id, title:title});
        console.log(id + ' 등록');
      break;
      }
    }
  }
      
  function removeList(id) {
    console.log(id + ' 삭제');
    var idx;
    for (var i in selecList) {
      if (selecList[i].mvno == id){
        idx = i;
      break;
      }
    }
    if (idx > -1) {
      selecList.splice(idx, 1);
      console.log(selecList);
    }
    $('#mv-li-'+id).remove();
  }
  
  function makeFavListHtml(id, title) {
    var print = '';
  
    print += '<li class="list-group-item" id="mv-li-' + id + '"><div class="media">';
    print += '<div class="media-body">';
    print += '<span class="mt-0"><b>' + title + "\t" + '</b></span>';
    print += `<button type="button" onclick="removeList('` + id +`')" style="float:right; cursor: pointer;" `;
    print += ' class="badge badge-primary badge-pill">제거</button>';
    print += '<input type="hidden" name="favMvIdList" value=' + id + '>';
    print += '<input type="hidden" name="favMvTitleList" value="' + title + '">';
    print += '</div>';
    print += '</li>';
  
    $chooseMvList.append(print);
  }
  
  
  function signUpCheck() {
    $form = $('#detailForm');
    $nickname = $('#nickname');
//    var form = document.detailForm;
    if($nickname.val() === null || $nickname.val() === '(알수없음)' || $nickname.val() === "") {
      alert("닉네임을 입력해 주세요");
      $nickname.focus();
    }
    
    if(selecList.length < 5) {
      alert("영화를 5편 이상 선정 해 주세요");
      $inputKeyword.focus();
      return
    }
    $form.submit();
  }
  
  function goToHome() {
    location.href = '/app/';
  }