<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<title>업체게시판</title>
<main class="main-agency main-board">
<div class="agency">
<div class="board">
	<div class="board_title">
		<div class="board_title_underline">
			<a href="<c:url value='/main/board/qna/list.do'/>">업체게시판</a>
		</div>
	</div>
	<!--  
	<header class="agency-header">
		<a href="<c:url value='/main/board/agency/list.do'/>"> 
			<i class="fas fa-home fa-lg"></i>
		</a>
		<span class="agency-title">업체게시판</span>
	</header>
	-->
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
					<%-- 									<a href="<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>">${agency.agencyName}</a> --%>
					<a href="#"
					onclick="agencyDetail(`<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>`,
																`${agency.memberNo}`,${sessionScope.user.memberNo});">${agency.agencyName}
					<c:if test="${sessionScope.user.memberNo ne agency.memberNo}">
						<i class="fas fa-lock fa-lg"></i>
					</c:if>
					</a>
				</td>
				<td><fmt:formatDate value="${agency.regDate}"
						pattern="yyyy-MM-dd HH:mm" type="both" /></td>
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
					<%-- 									<a href="<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>">${agency.agencyName}</a> --%>
					<a href="#"
					onclick="agencyDetail(`<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>`,
																`${agency.memberNo}`,${sessionScope.user.memberNo});">${agency.agencyName}
					<c:if test="${sessionScope.user.memberNo ne agency.memberNo}">
						<i class="fas fa-lock fa-lg"></i>
					</c:if>
					</a>
				</td>
				<td><fmt:formatDate value="${agency.regDate}"
						pattern="yyyy-MM-dd HH:mm" type="both" /></td>
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
	<div class="agency-bottom">
		<!-- <a class="agency-bottom__button" href='#' onclick="checkUser();" >등록</a> -->
		<a class="agency-bottom__button"
			href='<c:url value='/main/board/agency/checkform.do'/>'>등록</a>
	</div>
	<div class="agency-paging__items">
		<c:set var="link"
			value="${pageContext.request.contextPath}/main/board/agency/list.do" />
		<c:if test="${pageResult.count != 0}">
			<c:if test="${pageResult.prev eq true}">
				<a href="${link}?pageNo=${pageResult.beginPage - 1}"
					class="agency-paging__item">&lt</a>
			</c:if>
			<c:forEach var="i" begin="${pageResult.beginPage}"
				end="${pageResult.endPage}">
				<a href="${link}?pageNo=${i}" class="agency-paging__item">${i}</a>
			</c:forEach>
			<c:if test="${pageResult.next eq true}">
				<a href="${link}?pageNo=${pageResult.endPage + 1}"
					class="agency-paging__item">&gt</a>
			</c:if>
		</c:if>
	</div>
</div>
</main>
<script>
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
