<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ include file="include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>moviestagram</title>
<link rel='stylesheet' href='/css/bootstrap.css'>
<link rel='stylesheet' href='/css/common.css'>

<style>
.col-md-4{
  display: inline-block;
  margin-left:-10px;
}
.col-md-4 img{
  width:100%;
  height:12em;
}
  
body .carousel-control-prev-icon,
body .carousel-indicators li,
body .carousel-control-next-icon{
  background-color:none;
}

span.carousel-control-prev-icon {
 position: relative;
 bottom: 40px;
 right: 40px;
}

span.carousel-control-next-icon {
 position: relative;
 bottom: 40px;
}
.card {
  position: relative;
  display: -ms-flexbox;
  display: flex;
  -ms-flex-direction: column;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #fff;
  background-clip: border-box;
  border: 0px solid rgba(0, 0, 0, 0.125);
  border-radius: 0.25rem;
}
.card-body {
    -ms-flex: 1 1 auto;
    flex: 1 1 auto;
    padding: 0.65rem;
}
.carousel-control-prev-icon {
  background-image: url("/img/left.png");
}

.carousel-control-next-icon {
  background-image: url("/img/right.png");
}
.container {
    width: 100%;
    padding-right: 15px;
    padding-left: 25px;
    margin-right: auto;
    margin-left: auto;
}
span.carousel-control-prev-icon {
    position: relative;
    bottom: 40px;
    right: 100px;
}
span.carousel-control-next-icon {
    position: relative;
    bottom: 40px;
    left: 85px;
}
div.card-img-overlay t_img{
 height:12em;
}

div.card-bottom {
    height: 10em;
}

</style>

</head>
<body>
    <jsp:include page="include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
        <div class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Connect to Moviestagram</h1>
                <h5 class="mb-5">Discover, stream, and share a constantly expanding mix of music
                from emerging and major artists around the world</h5><br>
                <h4>너흰 아직 준비가 안됬따!!!!</h4>
            
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
                
          </div>
        </div>
      </div>
    </div>
    
    <div class="text-center" style="margin-top: 50px">
        <h3 class="mb-5">
            <strong>지금 인기 있는 장면</strong>
        </h3>
    </div>
    <div class="row">
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
    </div>
    
    <div class="row">
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
        <div class="card col-3" style="width: 15rem;">
            <img class="card-img-top" src="/img/ilidan.jpg"
                alt="Card image cap">
            <div class="card-body">
                <h5 class="card-title">영화제목(xx분 장면)</h5>
            </div>
        </div>
    </div>
    
    
    <div style="background-color:#e6e6e6;">
    <div class="text-center" style="margin-top: 50px" >
        <h3 class="mb-5">
            <strong>HOT 영화리뷰</strong>
        </h3>
    </div>

    <div class="container">

        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>


            <!-- 이미지가 있다면 2번 없다면 1번 어케만들지.. -->

            <!-- The slideshow -->
            <div class="carousel-inner no-padding my-5">
                <div class="carousel-item active">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info">
                            <div style="height:11em;">
                                <p>테스트 들어간드아!</p>
                            </div>
                        </a>
                        <div>
                        <p>test</p>
                        </div>

                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top rounded-bottom"
                            src="/img/ilidan.jpg">
                            <div class="card-img-overlay t_img">
                                  <p>테스트 들어간드아!</p>
                            </div>
                        </a>
                        <div class="card-bottom"><p>적은 글씨</p></div>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top rounded-bottom"
                            src="/img/가르강튀아.gif">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <div class="card-bottom">
                            <p>긴글씨긴글씨긴글씨긴글씨긴글씨긴글씨
                            긴글씨긴글씨긴글씨긴글씨긴글씨긴글씨
                            긴글씨긴글씨긴글씨긴글씨긴글씨긴글씨</p>
                        </div>
                    </div>
                </div>
                <!-- <div class="carousel-item">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top"
                            src="/img/deathwing.jpg">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <p>Lorem ipsum dolor sit amet consectetur
                            adipisicing elit. Sequi nesciunt quam
                            obcaecati maiores atque labore fugiat
                            tenetur tempore veritatis temporibus!</p>

                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top"
                            src="/img/deathwing2.jpg">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <p>Lorem ipsum dolor sit amet consectetur
                            adipisicing elit. Sequi nesciunt quam
                            obcaecati maiores atque labore fugiat
                            tenetur tempore veritatis temporibus!</p>

                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top"
                            src="/img/diablo3.jpg">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <p>tset!</p>

                    </div>
                </div> -->
                <!-- <div class="carousel-item">
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top"
                            src="/img/impe.png">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <p>Lorem ipsum dolor sit amet consectetur
                            adipisicing elit. Sequi nesciunt quam
                            obcaecati maiores atque labore fugiat
                            tenetur tempore veritatis temporibus!</p>

                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top"
                            src="/img/imvsdia.jpg">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <p>Lorem ipsum dolor sit amet consectetur
                            adipisicing elit. Sequi nesciunt quam
                            obcaecati maiores atque labore fugiat
                            tenetur tempore veritatis temporibus!</p>

                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4">
                        <a href="#" onclick=abc(this)
                            class="slider_info"> <img
                            class="img-fluid card-img-top"
                            src="/img/arthasildan.png">
                            <div class="card-img-overlay t_img">
                                <span class="float-left text-uppercase">article</span>
                                <span class="float-right text-uppercase">2345
                                    views</span>
                            </div>
                        </a>
                        <p>Lorem ipsum dolor sit amet consectetur
                            adipisicing elit. Sequi nesciunt quam
                            obcaecati maiores atque labore fugiat
                            tenetur tempore veritatis temporibus!</p>

                    </div>
                </div> -->
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo"
                data-slide="prev"> <span
                class="carousel-control-prev-icon sp"></span>
            </a> <a class="carousel-control-next" href="#demo"
                data-slide="next"> <span
                class="carousel-control-next-icon sp"></span>
            </a>
        </div>
    </div>
</div>


    </main>
    <jsp:include page="include/footer.jsp"></jsp:include>
   
    
   
    
    
    
    </script>
</body>
</html>