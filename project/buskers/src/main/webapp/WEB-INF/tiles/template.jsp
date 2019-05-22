<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/common/common.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/common/sweetalert2.min.css'/>" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<!-- Favicon -->
    <link rel="shortcut icon" href="<c:url value='/resources/img/guitar_icon.png'/>" type="image/x-icon">
<title>Insert title here</title>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div class="header_background">
		<img src="<c:url value='/resources/img/street.jpeg'/>" alt="img">
	</div>
	<div class="main-body">
		<tiles:insertAttribute name="body" />
	</div>
<script src="<c:url value='/resources/js/main/header/bootstrap.js'/>"></script>  
<script src="<c:url value='/resources/js/main/header/custom.js'/>"></script>
<script src="<c:url value='/resources/js/main/header/slick.js'/>"></script>
</body>
</html>