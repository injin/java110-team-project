<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<main role="main" class="container">

	<div class="container">
		<div class="row flex-xl-nowarp"> 
			<div class="col-12 col-md-3 col-xl-3">
				<form action="flwlist" method="post" enctype="multipart/form-data">
				</form>
			</div>
		</div>
	</div>
	<section>
		<div class="row mbr-justify-content-center">
			<div class="col-lg-12 mbr-col-md-12">
				<div class="row border col-lg-9">
					<div class="col-lg-12" style="float: right;">
						  <canvas id="myChart"></canvas>
					</div>
				</div>
			</div>
		</div>
	</section>
	</main>
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="/js/bootstrap.js"></script>
	<script src="/js/common.js"></script>
    <script src="/js/d3-5.4.0.min.js" charset="utf-8"></script>
    <script src="/js/c3.min.js"></script>
    <script src="/js/Chart.bundle.js"></script>
    <script src="/js/Chart.js"></script>
    <script src="/js/Chart.min.js"></script>
    <script src="/js/Chart.bundle.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
    <script src ="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.js"></script>

 <script>
 var statisticData = {};
 <c:forEach items="${postData}" var ="data" begin="0" end="4">
     statisticData['${data.gr_nm}'] = parseFloat('${data.cnt}');
 </c:forEach>
 
 var labels =[];
 <c:forEach items="${postData}" var ="data" begin="0" end="4">
 labels.push('${data.gr_nm}')
 </c:forEach>

 var dataz =[];
 <c:forEach items="${postData}" var ="data" begin="0" end="4">
 dataz.push('${data.cnt}')
 </c:forEach>
 
 var titl =[];
 <c:forEach items ="${mvTitl}" var = "titl">
   titl.push('${titl.gr_nm},${titl.titl}')
 </c:forEach> 
   
    var tooltipMap = new Map();
    <c:forEach items="${postData}" var="genre">
        tooltipMap.set('${genre.gr_nm}', new Array());
    </c:forEach>
    
    <c:forEach items="${mvTitl}" var="mv" >
        tooltipMap.get('${mv.gr_nm}').push('${mv.titl}');
        
    </c:forEach>
    
    var backgroundColors =[
        
        "#2ecc71",
        "#3498db",
        "#95a5a6",
        "#9b59b6",
        "#f1c40f"
        
    ];
    
    var ctx = document.getElementById("myChart").getContext('2d');
    var myChart = new Chart(ctx, {
      type: 'pie',
      data: {
        labels: labels,
        datasets: [{
          backgroundColor: backgroundColors,
          data: dataz 
        }]
      },
    options: {
        tooltips: {
            callbacks: {
               title: function(tooltipItem, data) {
                return data['labels'][tooltipItem[0]['index']];
              }, 
              label: function(tooltipItem, data) {
                  var genre = labels[tooltipItem.index];
                  return tooltipMap.get(genre);
              }
            },
            backgroundColor: '#FFF',
            titleFontSize: 16,
            titleFontColor: '#0066ff',
            bodyFontColor: '#000',
            bodyFontSize: 14,
            displayColors: false
          }
        
      }
    
    }); 
    
 </script>
</body>
</html>