//mv_mv_anly에서 영화 한편의 비슷한 영화 리스트 가져오기.
var $randomBaseSection = $('#random-base-section');
var $randomBaseItems = $('#random-base-items');
//$('#popover').popover('click');

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
      if (jQuery.isEmptyObject(data)) {
        print = '<p>잠시 에러가 발생했 습니다. 페이지를 새로고침 해 주세요.</p>';
      }  else {
        print = makeHtml(data);
      }
      $randomBaseItems.html(print);
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

function makeHtml(data) {
  var html = '';
  data.smlrList.forEach(function(obj, idx) {
    html += '<div class="item" onclick="toDetail('+obj.id+')">';
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
    console.log(element)
    var delta = element.scrollLeft() - move;
    console.log(delta)
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

var carousel1 = new Carousel('#carousel1');
carousel1.setLeftScrollOpacity();
carousel1.setRightScrollOpacity();

var carousel2 = new Carousel('#carousel2');
carousel2.setLeftScrollOpacity();
carousel2.setRightScrollOpacity();

var randomBase = new Carousel('#randomBaseCarousel');
randomBase.setLeftScrollOpacity();
randomBase.setRightScrollOpacity();

function click() {
  console.log('clicked');
}

function toDetail(id) {
  console.log(id);
  window.location.href = '/app/sceneReview/review?mvno='+ id;
}