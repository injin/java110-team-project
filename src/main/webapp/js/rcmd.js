//  mv_mv_anly에서 영화 한편의 비슷한 영화 리스트(smlrList) 가져오기.
var $randomBaseSection = $('#random-base-section');
var $randomBaseTitle = $('#randomBaseTitle');
var $randomBaseItems = $('#random-base-items');
//  mdList
var $mdSection = $('#md-section');
var $mdTitle = $('#mdTitle');
var $mdItems = $('#md-items');
var $loading = $('#loading');
//  TheMovieDb에서 nowPlayingMovieList 가져오기.
var $nowSection = $('#now-section');
var $nowItems = $('#now-items');
//  TheMovieDb에서 UpcommingMovieList 가져오기.
var $upcommingSection = $('#upcomming-section');
var $upcommingItems = $('#upcoming-items');

//  배열 삽입시 중복 확인과 10개까지만 담도록 prototype 설정
Array.prototype.pushObj = function (x) {
  this.unshift(x);
  this.maxLength = 15;
  if (this.maxLength !== undefined && this.length > this.maxLength){
    this.splice(0,1);
    return;
  } 
  for (var i = 0; i < this.length; i++) {
    if(this[i] === x) {
      return;
    }
  }
  this.push(x);
}
var anlyList = new Array;

window.onload = getKey();
window.onload = getSimilarBaseFavList();
window.onload = getUpcommigList();
window.onload = getNowList();
window.onload = getMdList();

function getKey() {
  $.ajax("/app/rcmd/key", {
    method: "POST",
    headers : {
      'Content-Type': 'application/json'
    },
    success: function (keys) {
      console.log(keys);
      anlyTaste(keys);
    }
  });
}

function anlyTaste (keys) {
  var mvnoList = keys.mvnoList;
  var filt = keys.oneGr;
  
  var urlHead = urlHead = "https://api.themoviedb.org/3/movie/";
  var urlBody = "/recommendations?api_key=";
  var k = keys.key;
  var urlTail = "&language=ko-KOR&page=1";
  
  for (var i = 0; i < mvnoList.length; i++) {
    getRcmd(urlHead + mvnoList[i] + urlBody + k + urlTail);
    function getRcmd(URL) {
        $.ajax(URL, {
        method: "GET",
        header: {
          'Content-Type': 'application/json;charset=UTF-8'
        },
        success: function(data){
          var list = data.results;
          anly(list, filt);
        },  // success
        complete: function () {
          console.log(anlyList);
          var source = $("#entry-template").html();
          var template = Handlebars.compile(source);
          var itemList = template(anlyList);
          $('#anly-base-items').append(itemList);
        },
        error: (xhr, status, msg) => {
          $srchMovieList.text('영화 정보를 가져오는데 실패하였습니다.');
          console.log(status);
          console.log(msg);
        }
      });
    }//  ajax
  }
}

function anly(list, filt){
  for (var i = 0; i < list.length; i++) {
    //  평점이 너무 높다면 이미 봤을 수 있으므로 자름.
    if (list[i].vote_average < 6.9) {
      /// filt 값 이 포함된 영화일 경우에만 anlyList에 포함 하는 조건문
      if (list[i].genre_ids.includes(filt)){
        anlyList.pushObj(list[i]);
      }
    }
  }
  //  anlyList의 object에 vote_count 값으로 정렬 
  anlyList.sort(function (a, b) {
    return a.vote_count > b.vote_count ? -1 : a.vote_count < b.vote_count ? 1 : 0;
  });
  return anlyList;
}

function getSimilarBaseFavList() {
  $.ajax("/app/rcmd/smlrList", {
    method: "POST",
    headers : {
      'Content-Type': 'application/json'
    },
    before: function() {
      $randomBaseSection.hide();
    },
    success: function(data) {
      if (data.triggerTitle === undefined) {
        print = '<p>로그인후 이용해 주세요.</p>';
      } else if (jQuery.isEmptyObject(data)) {
        print = '<p>잠시 에러가 발생했습니다. 페이지를 새로고침 해주세요.</p>';
      } else {
        print = makeHtml(data);
      }
      $randomBaseItems.html(print);
      if (data.triggerTitle != undefined) {
        $randomBaseTitle.html('좋아하신 "' + data.triggerTitle + '"의 비슷한 작품들.');
      }
    },
    complete: function() {
      $randomBaseSection.show();
    },
    error: (xhr, status, msg) => {
      $randomBaseItems.text('정보를 가져오는데 실패하였습니다.');
      console.log(status);
      console.log(msg);
    }
  });
}

function getMdList(){
  $.ajax("/app/rcmd/mdList", {
    method: "POST",
    headers : {
      'Content-Type': 'application/json'
    },
    before: function() {
      $mdSection.hide();
    },
    success: function(data) {
      if (jQuery.isEmptyObject(data)) {
        print = '<p>잠시 에러가 발생했습니다. 페이지를 새로고침 해주세요.</p>';
      }  else {
        print = makeHtml(data);
      }
      $mdItems.html(print);
      $mdTitle.html(data.listTitle);
    },
    complete: function() {
      $loading.remove();
      $mdSection.show();
    },
    error: (xhr, status, msg) => {
      $randomBaseItems.text('정보를 가져오는데 실패하였습니다.');
      console.log(status);
      console.log(msg);
    }
  });
}

function getUpcommigList(){
  $.ajax("/app/rcmd/upcommig", {
    method: "POST",
    headers : {
      'Content-Type': 'application/json'
    },
    before: function() {
      $upcommingSection.hide();
    },
    success: function(data) {
      if (jQuery.isEmptyObject(data)) {
        print = '<p>잠시 에러가 발생했습니다. 페이지를 새로고침 해주세요.</p>';
      }  else {
        print = makeHtml(data);
      }
      $upcommingItems.html(print);
    },
    complete: function() {
      $upcommingSection.show();
    },
    error: (xhr, status, msg) => {
      $randomBaseItems.text('정보를 가져오는데 실패하였습니다.');
      console.log(status);
      console.log(msg);
    }
  });
}

function getNowList(){
  $.ajax("/app/rcmd/now", {
    method: "POST",
    headers : {
      'Content-Type': 'application/json'
    },
    before: function() {
      $nowSection.hide();
    },
    success: function(data) {
      if (jQuery.isEmptyObject(data)) {
        print = '<p>잠시 에러가 발생했습니다. 페이지를 새로고침 해주세요.</p>';
      }  else {
        print = makeHtml(data);
      }
      $nowItems.html(print);
    },
    complete: function() {
      $nowSection.show();
    },
    error: (xhr, status, msg) => {
      $randomBaseItems.text('정보를 가져오는데 실패하였습니다.');
      console.log(status);
      console.log(msg);
    }
  });
}

function makeHtml(data) {
  var html = '';
  data.list.forEach(function(obj, idx) {
    html += '<div class="item" onclick="goToSceneReview('+obj.id+')">';
    if (obj.poster_path != null) {
      html += '<img class="item-image" src="https://image.tmdb.org/t/p/w500' + obj.poster_path + '" alt="' + obj.title + '"/>';
    } else {
      html += '<img class="item-image" src="/img/default-movie-img.png" alt="' + obj.title + '"/>';
    }
    html += '<span class="item-title">' + obj.title + '</span>';
    html += '<div class="item-description opacity-none">';
    html += '개봉일 : ' + obj.release_date +'<br>';
    html += '네티즌 평점 : ' + obj.vote_average + '</div>';
    html += '<br>';
    html += '</div>';
  });
  return html;
}