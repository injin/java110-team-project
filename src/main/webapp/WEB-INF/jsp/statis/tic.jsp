<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


    <canvas id="myChart"></canvas>
		
	
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
     statisticData['${data.gr_nm}'] = parseFloat('${data.pnt}');
 </c:forEach>
 
 var labels =[];
 <c:forEach items="${postData}" var ="data" begin="0" end="4">
 labels.push('${data.gr_nm}')
 </c:forEach>

 var dataz =[];
 <c:forEach items="${postData}" var ="data" begin="0" end="4">
 dataz.push('${data.pnt}')
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