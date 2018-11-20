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
.card-hot-sr {
height: 24em;
}
.card-hot-sr .img-sr {
    height: 10em;
}

</style>

</head>
<body>
    <jsp:include page="include/header.jsp"></jsp:include>
    <main role="main" class="container borderGray">
        <div class="masthead block-wide text-white text-center">
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
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="row">
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
            <div class="col-3 mb-3">
                <div class="card" >
                    <img class="card-img-top" src="/img/ilidan.jpg"
                        alt="Card image cap">
                    <div class="card-body">
                        <h5 class="card-title">영화제목(xx분 장면)</h5>
                    </div>
                </div>
            </div>
        </div>
    
    
    <div class="block-wide pb-3" style="background-color:#e6e6e6;">
        <div class="text-center" style="margin-top: 50px" >
            <h3 class="mb-5">
                <strong>HOT 영화리뷰</strong>
            </h3>
        </div>
        
        <!-- 슬라이더 START -->
        <div id="demo" class="carousel slide" data-ride="carousel">
        
            <ul class="carousel-indicators mb-0 pb-0">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            
            <div class="carousel-inner no-padding my-5">
                <div class="carousel-item active">
                    <div class="row pl-3 pr-3">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <img class="img-sr" src="/img/가르강튀아.gif">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                <div class="carousel-item ">
                    <div class="row pl-3 pr-3">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <img class="img-sr" src="/img/가르강튀아.gif">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                <div class="carousel-item">
                    <div class="row pl-3 pr-3">
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <img class="img-sr" src="/img/가르강튀아.gif">
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-sm-4 col-md-4">
                            <div class="card card-hot-sr">
                              <div class="card-body">
                                <h5 class="card-title">Card title</h5>
                                <h6 class="card-subtitle mb-2 text-muted">Card subtitle</h6>
                                <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                                <a href="#" class="card-link">Card link</a>
                                <a href="#" class="card-link">Another link</a>
                              </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
                
                
                
            </div>
        
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon sp"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon sp"></span>
            </a>

        </div>
        <!-- 슬라이더 END -->
    </div>

    </main>
    <jsp:include page="include/footer.jsp"></jsp:include>
   
    
   
    
    
    
    </script>
</body>
</html>