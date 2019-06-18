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
	<table class="agency-table">
		<tr>
			<th>번호</th>
			<th>업체명</th>
			<th>등록날짜</th>
			<th>등록여부</th>
		</tr>
		<c:forEach var="agency" items="${list}">
			<c:if test="${sessionScope.user.memberNo eq agency.memberNo}">
			<tr no="${agency.agencyInfoNo}" per="${agency.permission}" memberNo="${agency.memberNo}">
				<td>${agency.agencyInfoNo}</td>
				<td>
					<a href="#"
					onclick="agencyDetail(`<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>`,
																`${agency.memberNo}`,${sessionScope.user.memberNo});">${agency.agencyName}
					<c:if test="${sessionScope.user.isAdmin ne 'y'}" >
						<c:if test="${sessionScope.user.memberNo ne agency.memberNo}">
							<i class="fas fa-lock fa-lg"></i>
						</c:if>
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
			<tr no="${agency.agencyInfoNo}" per="${agency.permission}" memberNo="${agency.memberNo}">
				<td>${agency.agencyInfoNo}</td>
				<td>
					<%-- 									<a href="<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>">${agency.agencyName}</a> --%>
					<a href="#"
					onclick="agencyDetail(`<c:url value='/main/board/agency/detail.do?agencyInfoNo=${agency.agencyInfoNo}&pageNo=${pageNo}'/>`,
																`${agency.memberNo}`,${sessionScope.user.memberNo});">${agency.agencyName}
					<c:if test="${sessionScope.user.isAdmin ne 'y'}" >
						<c:if test="${sessionScope.user.memberNo ne agency.memberNo}">
							<i class="fas fa-lock fa-lg"></i>
						</c:if>
					</c:if>
					</a>
				</td>
				<td><fmt:formatDate value="${agency.regDate}"
						pattern="yyyy-MM-dd HH:mm" type="both" /></td>
				<c:if test="${sessionScope.user eq null || sessionScope.user.isAdmin eq 'n' }">
					<c:choose>
						<c:when test="${agency.permission eq 'n'}">
							<td>신청중</td>
						</c:when>
						<c:otherwise>
							<td>등록완료</td>
						</c:otherwise>
					</c:choose>
				</c:if>
				<c:if test="${sessionScope.user.isAdmin eq 'y' }">
					<c:choose>
						<c:when test="${agency.permission eq 'n'}">
							<td><button type="button" class="agency-table__admin ing">신청중</button></td>
						</c:when>
						<c:otherwise>
							<td><button type="button" class="agency-table__admin end">등록완료</button></td>
						</c:otherwise>
					</c:choose>
				</c:if>
			</tr>
			</c:if>
		</c:forEach>
	</table>
	<div class="agency-bottom">
		<button type="button" class="agency-bottom__button" onclick="moveCheckForm();">등록</button>
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
	const isAdmin = ${(sessionScope.user eq null) ? false : sessionScope.user.isAdmin eq 'y'};
	const isAgency = ${(sessionScope.user eq null) ? false : sessionScope.user.isAgency eq 'y'};
	const updateUrl = "<c:url value='/main/board/agency/update-agency-permission-ajax.do'/>";
	const memberNo = ${(sessionScope.user eq null)? 0:sessionScope.user.memberNo};
	const checkFormUrl = "<c:url value='/main/board/agency/checkform.do'/>";
</script>
<script src="<c:url value='/resources/js/main/board/agency/list.js'/> " /></script>
