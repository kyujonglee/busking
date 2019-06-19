<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="busker-support">
	<header class="busker-show__header">
		<div class="busker-show__header-top-menu">
			<a class="header-top-menu__content"
				href="<c:url value='/artist/main/main.do'/>?buskerNo=${param.buskerNo}"> <i
				class="fas fa-home fa-lg"></i> 버스커 홈
			</a> &gt <a class="header-top-menu__content"> 후원게시판 </a>
		</div>
		<div class="busker-show__header-title">
			<a class="busker-show__header-link" href="#">후원게시판</a>
		</div>
	</header>
	<section class="busker-support__main">
		
	</section>
</section>