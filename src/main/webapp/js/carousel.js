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
