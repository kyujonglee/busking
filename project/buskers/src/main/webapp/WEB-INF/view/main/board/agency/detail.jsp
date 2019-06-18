<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
      <main class="main-agency">
        <div class="container">
          <div class="agency">
          <div class="board">
            <header class="agency-header agency-insert__title">
              <a href="<c:url value='/main/board/agency/list.do'/>"><i class="fas fa-home fa-lg"></i></a>
              <span class="agency-title ">업체 상세보기</span>
            </header>
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
                  <c:if test="${sessionScope.user.isAdmin eq 'n'}">
						<c:choose>
							<c:when test="${agencyInfo.permission eq 'n'}">
								<td>신청중</td>
							</c:when>
							<c:otherwise>
								<td>등록완료</td>
							</c:otherwise>
						</c:choose>
					</c:if>
					<c:if test="${sessionScope.user.isAdmin eq 'y'}">
						<c:choose>
							<c:when test="${agencyInfo.permission eq 'n'}">
								<div><button type="button" class="agency-table__admin ing">신청중</button></div>
							</c:when>
							<c:otherwise>
								<div><button type="button" class="agency-table__admin end">등록완료</button></div>
							</c:otherwise>
						</c:choose>
					</c:if>
<%--                     	<c:choose> --%>
<%-- 							<c:when test="${agencyInfo.permission eq 'n'}"> --%>
<!-- 								<td>신청중</td> -->
<%-- 							</c:when> --%>
<%-- 						<c:otherwise> --%>
<!-- 							<td>등록완료</td> -->
<%-- 						</c:otherwise> --%>
<%-- 					</c:choose> --%>
                  </div>
                </div>
                <div class="agency-insert__btn-content">
                	<a href="<c:url value='/main/board/agency/updateform.do?agencyInfoNo=${agencyInfo.agencyInfoNo}&pageNo=${pageNo}'/>">
                 	 <button type="button" class="agency-insert__btn">
                  	수정 
                 	 </button>
                  </a>
                	<a href="#" onclick="deleteAgency('/buskers/main/board/agency/delete.do?agencyInfoNo=',${agencyInfo.agencyInfoNo});">
                 	 <button type="button" class="agency-insert__btn">
                  	삭제 
                 	 </button>
                  </a>
                	<a href="<c:url value='/main/board/agency/list.do?pageNo=${pageNo}'/>">
                 	 <button type="button" class="agency-insert__btn">
                  	목록 
                 	 </button>
                  </a>
                </div>
              </section>
          </div>
        </div>
      </main>
<script>
	const isAdmin = ${(sessionScope.user eq null) ? false : sessionScope.user.isAdmin eq 'y'};
	const agencyInfoNo = ${param.agencyInfoNo};
	const updateUrl = "<c:url value='/main/board/agency/update-agency-permission-ajax.do'/>";
	const memberNo = ${agencyInfo.memberNo};
</script>
<script src="<c:url value='/resources/js/main/board/agency/detail.js'/>"></script>