<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="<c:url value='/resources/css/error/error.css'/>">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<section class="tv-error-404-tm" style="background-image: url(http://movietvtechgeeks.com/wp-content/uploads/2015/05/most-common-server-problems.jpg); background-position:top center; background-size:cover; height:800px;">
		<div class="tv-dark-background-tm"></div>
		<div class="container tv-error-content-tm">
			<div class="col-md-12">
				<h1 class="error_title">Unexpected Error '400'</h1>
				<h3 class="error_detail">요청하신 페이지는 존재하지 않습니다. 관리자에게 문의해주세요.</h3>
				<div class="tv-error-links-tm">
				<a href="<c:url value='/main/main.do'/>" class="btn">Main home</a> 
			</div>
		</div>
		</div>
	</section>
</body>
</html>