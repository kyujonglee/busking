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
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/common/sweetalert2.min.css'/>" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<title>buskers</title>
</head>
<body class="body-background">
	<div class="main-form">
		<%@ include file="../../../include/sidebar.jsp" %>
		<div class="main-body main-body__agency">
			<%@ include file="/WEB-INF/view/include/header.jsp" %>
			<main class="main-agency">
			<div class="agency">
				<header class="agency-header">
					<a href="<c:url value='/main/board/agency/list.do'/>"><i class="fas fa-home fa-lg"></i></a>
					<span class="agency-title">업체게시판 </span>
				</header>
				<div class="agency-bottom">
					<a class="agency-bottom__button" href='#' onclick="checkUser();" >등록</a>
				</div>
				<table class="agency-table">
					<tr>
						<th>번호</th>
						<th>업체명</th>
						<th>등록날짜</th>
						<th>등록여부</th>
					</tr>
					<c:forEach var="agency" items="${list}">
							<tr>
								<td>${agency.agencyInfoNo}</td>
								<td>
<%-- 									<a href="<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>">${agency.agencyName}</a> --%>
									<a href="#" onclick="agencyDetail(`<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>`,
																		`${agency.memberNo}`,${sessionScope.user.memberNo});">${agency.agencyName}</a>
								<c:if test="${sessionScope.user.memberNo ne agency.memberNo}">
									<i class="fas fa-lock fa-lg"></i>
								</c:if>
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
	<script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
	<script>
		<% Member mem = (Member)session.getAttribute("user"); %>
		const user =
		<%= (mem==null)?null:1 %>
		function checkUser(){
			if(user === null){
				alert('로그인 후 이용가능합니다.');
			}else {
				location.href = "<c:url value='/main/board/agency/checkform.do'/>";
			}
		}
		function agencyDetail(url,agencyMemberNo,memberNo){
			if(memberNo === parseInt(agencyMemberNo)){
				location.href = url;
				return;
			};
			Swal.fire({
			  title:'다른 회원의 게시물을 볼 수 없습니다.',
			  type:'info',
			  timer:2000
			});
		}
	</script>
</body>
</html>
