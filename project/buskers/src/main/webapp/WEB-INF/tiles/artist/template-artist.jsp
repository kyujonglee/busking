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
    <link rel="stylesheet" href="<c:url value='/resources/css/fontawesome/css/all.min.css' />" />
    
    <!-- 부트스트랩,스위트얼럿 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/artist/main/artist.css' />" />

	<!-- PageTour -->
	<link rel="stylesheet" href="<c:url value='/resources/css/common/ptjs.min.css' />" />
	<link rel="stylesheet" href="<c:url value='/resources/css/common/classic.min.css' />" />
	
	<script src="<c:url value='/resources/js/jquery-ui.js'/>"></script>
	<script src="<c:url value='/resources/js/ptjs.min.js'/>"></script>
	<script src="<c:url value='/resources/js/artist/main/pagetour.js'/>"></script>

	<!-- Favicon -->
	<link rel="shortcut icon" href="<c:url value='/resources/img/guitar_icon.png'/>" type="image/x-icon">
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
