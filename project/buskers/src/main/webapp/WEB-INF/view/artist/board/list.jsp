<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="busker-show-list">
	<header class="busker-show__header">
		<div class="busker-show__header-top-menu">
			<a class="header-top-menu__content"> <i class="fas fa-home fa-lg"></i>
				버스커 홈
			</a> &gt <a class="header-top-menu__content"> 공연일정 </a>
		</div>
		<div class="busker-show__header-title">
			<a class="busker-show__header-link">공연일정</a>
			<a href="<c:url value='enrollForm.do' />" class="busker-show__header-enroll-btn">등록하기</a>
		</div>
	</header>
	<section class="busker-show-list__main">
	</section>
</section>
<script src="<c:url value='/resources/js/artist/board/forecast.js' />"></script>
<script src="<c:url value='/resources/js/artist/board/list.js' />"></script>