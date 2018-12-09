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
  var urlHead = urlHead = "//api.themoviedb.org/3/movie/";
  var urlBody = "/recommendations?api_key=";
  var k = keys.key;
  var urlTail = "&language=ko-KOR&page=1";
  
  for (var i = 0; i < mvnoList.length; i++) {
//    console.log(mvnoList[i]);
//    var URL = urlHead + mvnoList[i] + urlBody + urlTail;
    getRcmd(urlHead + mvnoList[i] + urlBody + urlTail);
    function getRcmd(URL) {
//      console.log(URL);
        $.ajax(URL, {
        method: "POST",
        header: {
          'Content-Type': 'application/json'
        },
        success: function(data){
        	console.log(data);
        }
      });
    }
  }
  
  
  
  
  
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