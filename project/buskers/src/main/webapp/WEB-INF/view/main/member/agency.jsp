<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<div class="member-agency">
	<section class="agency-insert">
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">업체명</span>
        </div>
        <div class="agency-insert__item-column">
          <span>${agencyInfo.agencyName}</span>
        </div>
      </div>
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">목적</span>
        </div>
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-purpose">
            ${agencyInfo.purpose}
          </span>
        </div>
      </div>
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">Email</span>
        </div>
        <div class="agency-insert__item-column">
          <span>${agencyInfo.email}</span>
          <input type="hidden" name="email" id="email" />
        </div>
      </div>
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">연락처</span>
        </div>
        <div class="agency-insert__item-column">
          <span>${agencyInfo.phone}</span>
        </div>
      </div>
      <div class="agency-insert__item addr-search">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">기본주소</span>
        </div>
        <div class="agency-insert__item-column">
          <span>${agencyInfo.basicAddr}</span>
        </div>
      </div>
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">상세주소</span>
        </div>
        <div class="agency-insert__item-column">
          <span>${agencyInfo.detailAddr}</span>
        </div>
      </div>
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">관심분야</span>
        </div>
        <div class="agency-insert__item-column">
        <c:forEach var="check" items="${agencyInfo.agencyGenreList}">
          <div class="agency-insert__checkbox-item">
            <span class="agency-insert__checkbox-title">
              ${check.genre.name}
            </span>
          </div>
		</c:forEach>
        </div>
      </div>
      <div class="agency-insert__item">
        <div class="agency-insert__item-column">
          <span class="agency-insert__item-name">등록 상태</span>
        </div>
        <div class="agency-insert__item-column" per="${agencyInfo.permission}">
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
      <div class="agency-insert__item">
      	<div class="agency-insert__item-column">
          <span class="agency-insert__item-name">업체번호</span>
        </div>
        <div class="agency-insert__item-column">
          <span>${agencyInfo.agencyCode}</span>
        </div>
      </div>
      <div class="agency-insert__btn-content">
       	<a href="<c:url value='/main/board/agency/delete-agency.do?agencyInfoNo=${agencyInfo.agencyInfoNo}&memberNo=${sessionScope.user.memberNo}'/>">
       	 <button type="button" class="agency-insert__btn agency-delete__btn">
        	업체 삭제 
       	 </button>
        </a>
      </div>
    </section>
</div>