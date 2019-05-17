<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<main class="main-agency">
<div class="container">
	<div class="agency">
	<div class="board">
		<header class="agency-header agency-insert__title">
			<a href="<c:url value='/main/board/agency/list.do'/>"><i
				class="fas fa-home fa-lg"></i></a> <span class="agency-title ">업체
				수정</span>
		</header>
		<form id="insertForm" method="post"
			action="<c:url value='/main/board/agency/update.do'/>">
			<section class="agency-insert">
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">업체명</span>
					</div>
					<div class="agency-insert__item-column">
						<input class="agency-insert__item-input" type="text"
							name="agencyName" id="agencyName"
							value="${agencyInfo.agencyName}" />
					</div>
				</div>
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">목적</span>
					</div>
					<div class="agency-insert__item-column">
						<textarea class="agency-insert__item-textarea" cols="70" rows="7"
							name="purpose" id="purpose">${agencyInfo.purpose}</textarea>
					</div>
				</div>
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">Email</span>
					</div>
					<div class="agency-insert__item-column">
						<input
							class="agency-insert__item-input agency-insert__input-email"
							type="text" name="email1" id="email1"
							value="${fn:split(agencyInfo.email,'@')[0]}" /> <span
							style="color: inherit;">@</span> <input
							class="agency-insert__item-input agency-insert__input-email"
							type="text" name="email2" id="email2"
							value="${fn:split(agencyInfo.email,'@')[1]}" /> <input
							type="hidden" name="email" id="email" value="${agencyInfo.email}" />
					</div>
				</div>
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">연락처</span>
					</div>
					<div class="agency-insert__item-column">
						<input class="agency-insert__item-input " type="text"
							placeholder="ex) 010-xxxx-xxxx" name="phone" id="phone"
							value="${agencyInfo.phone}" />
					</div>
				</div>
				<div class="agency-insert__item addr-search">
					<div class="agency-insert__item-column"></div>
					<div class="agency-insert__item-column">
						<button type="button" class="agency-insert__item-addr-search"
							onclick="goPopup();">주소검색</button>
					</div>
				</div>
				<div class="agency-insert__item addr-search">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">기본주소</span>
					</div>
					<div class="agency-insert__item-column">
						<input class="agency-insert__item-input agency-insert__item-addr"
							type="text" id="roadAddrPart1" name="basicAddr"
							value="${agencyInfo.basicAddr}" />
					</div>
				</div>
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">상세주소</span>
					</div>
					<div class="agency-insert__item-column">
						<input
							class="agency-insert__item-input agency-insert__item-addr-detail"
							type="text" id="addrDetail" name="detailAddr"
							value="${agencyInfo.detailAddr}" />
					</div>
				</div>
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">관심분야</span>
					</div>
					<div class="agency-insert__item-column">
						<!-- 모든 장르도 가져오기 -->
						<c:forEach var="genreItem" items="${genre}" varStatus="status">
							<c:set var="flag" value="n" />
							<c:forEach var="agencyGenre"
								items="${agencyInfo.agencyGenreList}">
								<c:if test="${genreItem.genreNo eq agencyGenre.genreNo }">
									<c:set var="flag" value="y" />
								</c:if>
							</c:forEach>
							<div class="agency-insert__checkbox-item">
								<label for="agencyCheckbox${status.count}" style="cursor:pointer">
								<c:choose>
									<c:when test="${flag eq 'y'}">
										<input class="agency-insert__checkbox" type="checkbox"
											name="agencyCheckbox" id="agencyCheckbox${status.count}"
											value="${genreItem.genreNo}" checked />
									</c:when>
									<c:otherwise>
										<input class="agency-insert__checkbox" type="checkbox"
											name="agencyCheckbox" id="agencyCheckbox${status.count}"
											value="${genreItem.genreNo}" />
									</c:otherwise>
								</c:choose>
								<span class="agency-insert__checkbox-title">${genreItem.name}</span>
								</label>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="agency-insert__item">
					<div class="agency-insert__item-column">
						<span class="agency-insert__item-name">등록 상태</span>
					</div>
					<div class="agency-insert__item-column">
						<c:choose>
							<c:when test="${agencyInfo.permission eq 'n'}">
								<td>신청중</td>
							</c:when>
							<c:otherwise>
								<td>등록완료</td>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="agency-insert__btn-content">
					<input type="hidden" name="pageNo" value="${pageNo}" /> <input
						type="hidden" name="agencyInfoNo"
						value="${agencyInfo.agencyInfoNo}" />
					<button type="button" onclick="updateAgency();"
						class="agency-insert__btn">확인</button>
					<a
						href="<c:url value='/main/board/agency/list.do?pageNo=${pageNo}'/>">
						<button type="button" class="agency-insert__btn">목록</button>
					</a>
				</div>
			</section>
		</form>
	</div>
</div>
</main>
<script src="<c:url value='/resources/js/main/board/agency/update.js'/>"></script>
