<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<aside class="side-bar__wrapper">
	<div class="side-bar__wrapper-fixed">
		<div class="side-bar">
			<a class="side-bar__tag">
				<div class="side-bar__icon">
					<i class="fas fa-bars fa-lg"></i> <span
						class="side-bar__icon-content">메뉴바</span>
				</div>
			</a> <a class="side-bar__tag"
				href="<c:url value='/main/board/free/list.do'/>">
				<div class="side-bar__icon">
					<i class="fas fa-bullhorn fa-lg"></i> <span
						class="side-bar__icon-content">공지게시판</span>
				</div>
			</a> <a class="side-bar__tag"
				href="<c:url value='/main/board/free/list.do'/>">
				<div class="side-bar__icon">
					<i class="fas fa-comments fa-lg"></i> <span
						class="side-bar__icon-content">자유게시판</span>
				</div>
			</a> <a class="side-bar__tag"
				href="<c:url value='/main/board/qna/list.do'/>">
				<div class="side-bar__icon">
					<i class="fas fa-question fa-lg"></i> <span
						class="side-bar__icon-content">질문게시판</span>
				</div>
			</a> <a class="side-bar__tag">
				<div class="side-bar__icon">
					<i class="fas fa-music fa-lg"></i> <span
						class="side-bar__icon-content">버스커소개</span>
				</div>
			</a> <a class="side-bar__tag"
				href="<c:url value='/main/board/agency/list.do'/>">
				<div class="side-bar__icon">
					<i class="fas fa-building fa-lg"></i> <span
						class="side-bar__icon-content">업체 등록</span>
				</div>
			</a>
			<div class="side-bar__icon">...</div>
		</div>
	</div>
</aside>