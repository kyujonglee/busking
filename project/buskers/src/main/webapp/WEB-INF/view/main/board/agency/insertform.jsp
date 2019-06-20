<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
        <main class="main-agency main-board">
          <div class="board">
            <header class="agency-header agency-insert__title">
              <a href=""><i class="fas fa-home fa-lg"></i></a>
              <span class="agency-title ">업체 등록 </span>
            </header>
            <form name="insertForm" id="insertForm" method="post" action="<c:url value='/main/board/agency/insert.do'/>" onsubmit="return allCheck();">
            <section class="agency-insert">
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">업체명</span>
                </div>
                <input class="agency-insert__item-input" type="text" name="agencyName" id="agencyName" maxlength="40"/>
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">목적</span>
                </div>
                <textarea
                  class="agency-insert__item-textarea"
                  cols="70"
                  rows="7"
                  name="purpose"
                  id="purpose"
                ></textarea>
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">Email</span>
                </div>
                <input
                  class="agency-insert__item-input agency-insert__input-email"
                  type="text"
                  name="email1"
                  id="email1"
                  maxlength="20"
                />
                <span style="color:inherit;">@</span>
                <input
                  class="agency-insert__item-input agency-insert__input-email"
                  type="text"
                  name="email2"
                  id="email2"
                  maxlength="20"
                />
                <input type="hidden" name="email" id="email"/>
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">연락처</span>
                </div>
                <input
                  class="agency-insert__item-input"
                  type="text"
                  placeholder="ex) 010-xxxx-xxxx"
                  name="phone"
                  id="phone"
                  maxlength="13"
                />
              </div>
              <div class="agency-insert__item addr-search">
                <div class="agency-insert__item-column"></div>
                <div class="agency-insert__item-column">
	                <button type="button" id="searchAddr" name="searchAddr" class="agency-insert__item-addr-search" onclick="goPopup();">주소검색</button>
                </div>
              </div>
              <div class="agency-insert__item addr-search">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">기본주소</span>
                </div>
                <input
                  class="agency-insert__item-input agency-insert__item-addr"
                  type="text"
                  id="roadAddrPart1"
                  name="basicAddr"
                  maxlength="100"
                />
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">상세주소</span>
                </div>
                <input
                  class="agency-insert__item-input agency-insert__item-addr-detail"
                  type="text"
                  id="addrDetail"
                  name="detailAddr"
                  maxlength="100"
                />
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">관심분야</span>
                </div>
                <c:forEach var="genre" items="genreList" varStatus="status">
                   <div class="agency-insert__checkbox-item">
                  	<label for="agencyCheckbox${status.count}" style="cursor:pointer">
	                  <input
	                    class="agency-insert__checkbox"
	                    type="checkbox"
	                    name="agencyCheckbox"
	                    value="${status.count}"
	                    id="agencyCheckbox${status.count}"
	                  />
                      <span class="agency-insert__checkbox-title">${genre.title}</span>
                    </label>
                  </div>
                </c:forEach>
              </div>
              <div class="agency-insert__btn-content">
                <button class="agency-insert__btn">등 록</button>
              </div>
            </section>
            </form>
          </div>
        </main>
    <script src="<c:url value='/resources/js/main/board/agency/insert.js'/>"></script>