<%@page import="kr.co.buskers.repository.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<title>buskers</title>
</head>
<body class="body-background">
	<div class="main-form">
		<%@ include file="../../../include/sidebar.jsp" %>
		<div class="main-body">
			<header class="header">
				<div class="board_container">
					<div class="header-columns">
						<i class="fas fa-search fa-lg"></i> <input type="text"
							placeholder="search" />
					</div>
					<div class="header-columns">
						<span class="header__title">Buskers</span>
					</div>
					<div class="header-columns">
						<span class="header__user"> <i class="fas fa-crown fa-lg"></i>
							kyujong93 님
						</span> <i class="fas fa-angle-down "></i> <i class="fas fa-bell fa-lg"></i>
						<i class="fas fa-cog fa-lg"></i>
					</div>
				</div>
			</header>
			<main class="main-agency">
			<div class="agency">
				<header class="agency-header">
					<a href="<c:url value='/main/board/agency/list.do'/>"><i class="fas fa-home fa-lg"></i></a>
					<span class="agency-title">업체게시판 </span>
				</header>
				<div class="agency-bottom">
					<a class="agency-bottom__button" href='#' onclick="return checkUser();" >등록</a>
				</div>
				<table class="agency-table">
					<tr>
						<th>번호</th>
						<th>업체명</th>
						<th>등록날짜</th>
						<th>등록여부</th>
					</tr>
					<c:forEach var="agency" items="${list}">
						<c:if test="${sessionScope.user.memberNo eq agency.memberNo}">
							<tr>
								<td>${agency.agencyInfoNo}</td>
								<td>
									<a href="<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>">${agency.agencyName}</a>
								</td>
								<td><fmt:formatDate value="${agency.regDate}"
										pattern="yyyy-MM-dd HH:mm" type="both" />
								</td>
								<c:choose>
									<c:when test="${agency.permission eq 'n'}">
										<td>신청중</td>
									</c:when>
									<c:otherwise>
										<td>등록완료</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:if>
					</c:forEach>
					
					<c:forEach var="agency" items="${list}">
						<c:if test="${sessionScope.user.memberNo ne agency.memberNo}">
							<tr>
								<td>${agency.agencyInfoNo}</td>
								<td>
									<a href="<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>">${agency.agencyName}
										<i class="fas fa-lock fa-lg"></i>
									</a>
								</td>
								<td><fmt:formatDate value="${agency.regDate}"
										pattern="yyyy-MM-dd HH:mm" type="both" />
								</td>
								<c:choose>
									<c:when test="${agency.permission eq 'n'}">
										<td>신청중</td>
									</c:when>
									<c:otherwise>
										<td>등록완료</td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:if>
					</c:forEach>
				</table>
				
				<div class="agency-paging__items">
				<c:set var="link" value="${pageContext.request.contextPath}/main/board/agency/list.do"/>
				<c:if test="${pageResult.count != 0}">
					<c:if test="${pageResult.prev eq true}">
						<a href="${link}?pageNo=${pageResult.beginPage - 1}" class="agency-paging__item">&lt</a> 
					</c:if>
					<c:forEach var="i" begin="${pageResult.beginPage}"
						end="${pageResult.endPage}">
						<a href="${link}?pageNo=${i}" class="agency-paging__item">${i}</a>
					</c:forEach>
					<c:if test="${pageResult.next eq true}">
						<a href="${link}?pageNo=${pageResult.endPage + 1}" class="agency-paging__item">&gt</a>
					</c:if>
				</c:if>
				</div>


			</div>
			</main>
		</div>
	</div>
	<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
	<script>
		const user = 
		<%= 
			(Member)session.getAttribute("user")!=null?1:null
		%>;
		console.log(user);
		function checkUser(){
			if(user === null){
				alert('로그인 후 이용가능합니다.');
			}else {
				location.href = "<c:url value='/main/board/agency/checkform.do'/>";
			}
		}
	</script>
</body>
</html>
