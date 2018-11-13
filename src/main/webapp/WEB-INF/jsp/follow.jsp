<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="include/top.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>follow</title>
<style>
    table {
        
        border: 1px solid black;
    }
    
    td {
     border: 1px solid black;
    }

    body{
        padding: 0;
        margin:  0;
    }
    
    .a1{
    
        background: #ffff00;
        position: relative;
    }
    
    .a2 {
       
        background: #999;
    }
    
    //class a1 안에 있는 div 태그에 들어가는 속성들
    .a1 div{
        width:200px; 
        height: 200px;
        background: #ccc;
        position: relative;
        
    }
</style>
</head>
<body>

     <div class ="a1">
         <div class="a1_1">a1_1</div>
         <div class="a1_2">a1_2</div>
         <div class="a1_3">a1_3</div>
     </div>
     <div class ="a2">
         <div class="a2_1">a2_1</div>
         <div class="a2_2">a2_2</div>
         <div class="a2_3">a2_3</div>
     </div>
     
     
    <table>
     <thead><td>나의 피드</td><td>정보수정</td><td>통계</td><td>팔로우</td><td>활동로그</td><td>장면보관함</td></thead>
     <tbody></tbody>
    </table>
     
     
</body>
</html>