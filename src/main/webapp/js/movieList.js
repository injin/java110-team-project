//배열의 proto 길이 제한.
Array.prototype.push = function(x) {
  this.unshift(x);
  this.maxLength = 20;
  if (this.maxLength !== undefined && this.length > this.maxLength){
    this.splice(0,1);
    alert('20개 이상 선택 할 수 없습니다.');
    return;
  } 
}

var $inputKeyword = $('#input-srch-keyword');
var $srchMovieList = $('#list-search-movie');
var $chooseMvList = $('#list-choose-movie');
var selecList = [];

//영화 선정 리스트를 위한 배열과 메소드
function addList(id, title) {
  for (var i = 0; i < selecList.length; i++){
    if(selecList[i].mvno === id) {
      commonAlert('error', '이미 선택한 영화 입니다.');
      return;
    }
  }
  selecList.push({mvno:id, title:title});
  makeFavListHtml(id, title);
  console.log(id + ' 등록');
  console.log(selecList);
  return;
}

//삭제
function removeList(id) {
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
  console.log(id + ' 삭제');
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

// FORM TAG 안의 검색창에서 Enter Key 기능
$("#input-srch-keyword").keypress(
  function(event){
    if (event.which == '13') {
      event.preventDefault();
      findMoviesByKeyword();
    }
});

//영화 검색
function findMoviesByKeyword() {
  var keyword = document.getElementById('input-srch-keyword').value;
  if (keyword == '') {
    commonAlert('error', '키워드를 입력해주세요');
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

//검색 결과 html 출력
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
