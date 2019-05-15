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
<title>Insert title here</title>
</head>
<body class="body-background">
	<div class="main-form">
		<tiles:insertAttribute name="side" />
		<div class="main-body main-body__agency">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="body" />
		</div>
	</div>
	<script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
</body>
</html>