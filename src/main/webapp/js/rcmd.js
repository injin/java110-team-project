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
//	TheMovieDb에서 UpcommingMovieList 가져오기.
var $upcommingSection = $('#upcomming-section');
var $upcommingItems = $('#upcoming-items');
//$('#popover').popover('click');


window.onload=getUpcommigList();
window.onload=getNowList();
window.onload=getMdList();
window.onload=getSimilarBaseFavList();

function getSimilarBaseFavList(){
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
//	console.log(data);
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

//시간이 남으면 마우스 휠로도 컨트롤 가능하게 ㄱㄱ
function MouseWheelHandler(e, element) {
  var delta = 0;
  if (typeof e === 'number') {
    delta = e;
  } else {
    if (e.deltaX !== 0) {
      delta = e.deltaX;
    } else {
      delta = e.deltaY;
    }
    e.preventDefault();
  }
  element.scrollLeft -= (delta);
}

function Carousel(carouselId) {
  this.e = document.querySelector(carouselId);
  this.items = document.querySelector(carouselId + ' .items');
  this.leftScroll = document.querySelector(carouselId + ' .left-scroll-btn');
  this.rightScroll = document.querySelector(carouselId + ' .right-scroll-btn');

  var items = this.items;

  $(this.leftScroll).click(function() {
    var smoothScrollDelta = $(items)[0].clientWidth * 0.8;
    smoothScroll(smoothScrollDelta);
  });
  $(this.rightScroll).click(function() {
    var smoothScrollDelta = $(items)[0].clientWidth * 0.8;
    smoothScroll(-smoothScrollDelta);
  });

  function smoothScroll(move) {
    var element = $(items);
    var delta = element.scrollLeft() - move;
    element.animate({
      scrollLeft: delta
    }, 500);
  };
}

Carousel.prototype.handleMouse = function(e) {
  MouseWheelHandler(e, this.items);
};

Carousel.prototype.scrollEvent = function(e) {
  this.setLeftScrollOpacity();
  this.setRightScrollOpacity();
};

Carousel.prototype.setLeftScrollOpacity = function() {
  if (this.isScrolledAllLeft()) {
    this.leftScroll.style.opacity = 0;
  } else {
    this.leftScroll.style.opacity = 1;
  }
};

Carousel.prototype.isScrolledAllLeft = function() {
  if (this.items.scrollLeft === 0) {
    return true;
  } else {
    return false;
  }
};

Carousel.prototype.isScrolledAllRight = function() {
  if (this.items.scrollWidth > this.items.offsetWidth) {
    if (this.items.scrollLeft + this.items.offsetWidth === this.items.scrollWidth) {
      return true;
    } 
  }else {
    return true;
  }
  return false;
};

Carousel.prototype.setRightScrollOpacity = function() {
  if (this.isScrolledAllRight()){
    this.rightScroll.style.opacity = 0;
  } else {
    this.rightScroll.style.opacity = 1;
  }
};

var anlyBase = new Carousel('#anlyBaseCarousel');
anlyBase.setLeftScrollOpacity();
anlyBase.setRightScrollOpacity();


var randomBase = new Carousel('#randomBaseCarousel');
randomBase.setLeftScrollOpacity();
randomBase.setRightScrollOpacity();

var nowBase = new Carousel('#nowCarousel');
nowBase.setLeftScrollOpacity();
nowBase.setRightScrollOpacity();

var upcommingBase = new Carousel('#upcommingCarousel');
upcommingBase.setLeftScrollOpacity();
upcommingBase.setRightScrollOpacity();

var mdList = new Carousel('#mdCarousel');
mdList.setLeftScrollOpacity();
mdList.setRightScrollOpacity();
