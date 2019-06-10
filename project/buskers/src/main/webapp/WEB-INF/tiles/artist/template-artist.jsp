<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../config.jsp" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
      integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
      crossorigin="anonymous"
    />
    <!-- 부트스트랩,스위트얼럿 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/artist/main/artist.css' />" />
	
    <link rel="stylesheet" href="<c:url value='/resources/css/artist/main/artist.css' />" />
	
	<!-- slide -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/artist/slide/custom.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/artist/slide/slicebox.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/artist/slide/demo.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/artist/slide/photo.css'/>" />
	<script type="text/javascript" src="<c:url value='/resources/js/artist/slide/modernizr.custom.46884.js'/>"></script>
	
    <title>Buskers</title>
  </head>
  <body class="busker-body">
    <!-- <button>확인</button> -->
    <div class="busker">
      <tiles:insertAttribute name="sidebar" />
      <tiles:insertAttribute name="info" />
      <section class="busker-section">
        <tiles:insertAttribute name="header" />
        <main class="busker-main">
          <tiles:insertAttribute name="body" />
          <tiles:insertAttribute name="chat" />
        </main>
      </section>
    </div>
    <script src="<c:url value='/resources/js/artist/main/artist.js' />"></script>
    
  </body>
</html>
