<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


    <jsp:include page="../sceneAlbum/sceneAlbumList.jsp"></jsp:include>
    <jsp:include page="../sceneAlbum/albumPopup.jsp"></jsp:include>

    <script>
    function albumDetail(open, lbmno) {
        //alert(lbmTitle);
        console.log(open);
        $('#detailForm input[name="open"]').val(open);
        $('#detailForm input[name="lbmno"]').val(lbmno);
        $('#detailForm').submit();

    }
    </script>
