<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
    />
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
    <link rel="stylesheet" href="<c:url value='/resources/css/common/sweetalert2.min.css'/>" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <title>buskers</title>
  </head>
  <body class="body-background">
    <div class="main-form">
      <aside class="side-bar">
        <a class="side-bar__tag">
          <div class="side-bar__icon">
            <i class="fas fa-bars fa-lg"></i>
            <span class="side-bar__icon-content">메뉴바</span>
          </div>
        </a>
        <a
          class="side-bar__tag"
          href="<c:url value='/main/board/free/list.do'/>"
        >
          <div class="side-bar__icon">
            <i class="fas fa-comments fa-lg"></i>
            <span class="side-bar__icon-content">자유게시판</span>
          </div>
        </a>
        <a
          class="side-bar__tag"
          href="<c:url value='/main/board/qna/list.do'/>"
        >
          <div class="side-bar__icon">
            <i class="far fa-clipboard fa-lg"></i>
            <span class="side-bar__icon-content">질문게시판</span>
          </div>
        </a>
        <a class="side-bar__tag">
          <div class="side-bar__icon">
            <i class="fas fa-music fa-lg"></i>
            <span class="side-bar__icon-content">버스커소개</span>
          </div>
        </a>
        <a
          class="side-bar__tag"
          href="<c:url value='/main/board/agency/list.do'/>"
        >
          <div class="side-bar__icon">
            <i class="fas fa-pen-nib fa-lg"></i>
            <span class="side-bar__icon-content">업체 등록</span>
          </div>
        </a>
        <div class="side-bar__icon">
          ...
        </div>
      </aside>
      <div class="main-body">
        <header class="header">
          <div class="container">
            <div class="header-columns">
              <i class="fas fa-search fa-lg"></i>
              <input type="text" placeholder="search" />
            </div>
            <div class="header-columns">
              <span class="header__title">Buskers</span>
            </div>
            <div class="header-columns">
              <span class="header__user">
                <i class="fas fa-crown fa-lg"></i>
                kyujong93 님
              </span>
              <i class="fas fa-angle-down "></i>
              <i class="fas fa-bell fa-lg"></i>
            </div>
          </div>
        </header>
        <main class="main-agency">
          <div class="container">
            <div class="agency">
              <header class="agency-header agency-insert__title">
                <a href="<c:url value='/main/board/agency/list.do'/>"><i class="fas fa-home fa-lg"></i></a>
                <span class="agency-title ">업체 상세보기</span>
              </header>
              <form
                id="insertForm"
                method="post"
                action="<c:url value='/main/board/agency/insert.do'/>"
              >
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
                  	<a href="<c:url value='/main/board/agency/list.do?pageNo=${pageNo}'/>">
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
              </form>
            </div>
          </div>
        </main>
      </div>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.4.1.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
    <script src="<c:url value='/resources/js/main/board/agency/detail.js'/>"></script>
    <script type="text/javascript">
    </script>
  </body>
</html>
