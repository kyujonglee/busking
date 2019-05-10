<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
          <div class="board_container">
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
                <span class="agency-title ">업체 수정</span>
              </header>
              <form
                id="insertForm"
                method="post"
                action="<c:url value='/main/board/agency/update.do'/>"
              >
                <section class="agency-insert">
                  <div class="agency-insert__item">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">업체명</span>
                    </div>
                    <div class="agency-insert__item-column">
                      <input class="agency-insert__item-input" type="text" name="agencyName" id="agencyName" value="${agencyInfo.agencyName}"/>
                    </div>
                  </div>
                  <div class="agency-insert__item">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">목적</span>
                    </div>
                    <div class="agency-insert__item-column">
                      <textarea
	                  class="agency-insert__item-textarea"
	                  cols="70"
	                  rows="7"
	                  name="purpose"
	                  id="purpose"
	                >${agencyInfo.purpose}</textarea>
                    </div>
                  </div>
                  <div class="agency-insert__item">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">Email</span>
                    </div>
                    <div class="agency-insert__item-column">
                      <input
		                  class="agency-insert__item-input agency-insert__input-email"
		                  type="text"
		                  name="email1"
		                  id="email1"
		                  value="${fn:split(agencyInfo.email,'@')[0]}"
		                />
		              <span style="color:inherit;">@</span>
		              <input
		                  class="agency-insert__item-input agency-insert__input-email"
		                  type="text"
		                  name="email2"
		                  id="email2"
		                  value="${fn:split(agencyInfo.email,'@')[1]}"
		              />
                      <input type="hidden" name="email" id="email" value="${agencyInfo.email}"/>
                    </div>
                  </div>
                  <div class="agency-insert__item">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">연락처</span>
                    </div>
                    <div class="agency-insert__item-column">
                      <input
		                  class="agency-insert__item-input "
		                  type="text"
		                  placeholder="ex) 010-xxxx-xxxx"
		                  name="phone"
		                  id="phone"
		                  value="${agencyInfo.phone}"
		                />
                    </div>
                  </div>
                  <div class="agency-insert__item addr-search">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">기본주소</span>
                    </div>
                    <div class="agency-insert__item-column">
                      <input
		                  class="agency-insert__item-input agency-insert__item-addr"
		                  type="text"
		                  id="roadAddrPart1"
		                  name="basicAddr"
		                  value="${agencyInfo.basicAddr}"
		                />
                    </div>
                  </div>
                  <div class="agency-insert__item">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">상세주소</span>
                    </div>
                    <div class="agency-insert__item-column">
                      <input
	                  class="agency-insert__item-input agency-insert__item-addr-detail"
	                  type="text"
	                  id="addrDetail"
	                  name="detailAddr"
	                  value="${agencyInfo.detailAddr}"
             		   />
                    </div>
                  </div>
                  <div class="agency-insert__item">
                    <div class="agency-insert__item-column">
                      <span class="agency-insert__item-name">관심분야</span>
                    </div>
                    <div class="agency-insert__item-column">
                    <!-- 모든 장르도 가져오기 -->
	                    <c:forEach var="genreItem" items="${genre}">
	                    	<c:set var="flag" value="n"/>
		                    <c:forEach var="agencyGenre" items="${agencyInfo.agencyGenreList}">
		                    	<c:if test="${genreItem.genreNo eq agencyGenre.genreNo }">
			                    	<c:set var="flag" value="y"/>
		                    	</c:if>
	              	  		</c:forEach>
          	  				<div class="agency-insert__checkbox-item">
	              	  		<c:choose>
	              	  			<c:when test="${flag eq 'y'}">
				                  <input
				                    class="agency-insert__checkbox"
				                    type="checkbox"
				                    name="agencyCheckbox"
				                    id=""
				                    value="${genreItem.genreNo}"
				                    checked
				                  />
	              	  			</c:when>
	              	  			<c:otherwise>
	              	  			  <input
				                    class="agency-insert__checkbox"
				                    type="checkbox"
				                    name="agencyCheckbox"
				                    id=""
				                    value="1"
				                  />
	              	  			</c:otherwise>
	              	  		</c:choose>
               			  		<span class="agency-insert__checkbox-title">${genreItem.name}</span>
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
                    	확인
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
	<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
<%--     <script src="<c:url value='/resources/js/main/board/agency/updateform.js'/>"></script> --%>
  </body>
</html>
