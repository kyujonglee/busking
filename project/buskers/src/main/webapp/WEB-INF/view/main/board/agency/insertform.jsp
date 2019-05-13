<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet"
	href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
	<link rel="stylesheet" href="<c:url value='/resources/css/common/sweetalert2.min.css'/>" />
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
    <title>buskers</title>
  </head>
  <body class="body-background">
    <div class="main-form">
      <%@ include file="../../../include/sidebar.jsp" %>
      <div class="main-body main-body__agency">
        <%@ include file="/WEB-INF/view/include/header.jsp" %>
        <main class="main-agency">
          <div class="agency">
            <header class="agency-header agency-insert__title">
              <a href=""><i class="fas fa-home fa-lg"></i></a>
              <span class="agency-title ">업체 등록 </span>
            </header>
            <form id="insertForm" method="post" action="<c:url value='/main/board/agency/insert.do'/>">
            <section class="agency-insert">
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">업체명</span>
                </div>
                <input class="agency-insert__item-input" type="text" name="agencyName" id="agencyName"/>
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
                />
                <span style="color:inherit;">@</span>
                <input
                  class="agency-insert__item-input agency-insert__input-email"
                  type="text"
                  name="email2"
                  id="email2"
                />
                <input type="hidden" name="email" id="email"/>
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">연락처</span>
                </div>
                <input
                  class="agency-insert__item-input "
                  type="text"
                  placeholder="ex) 010-xxxx-xxxx"
                  name="phone"
                  id="phone"
                />
              </div>
              <div class="agency-insert__item addr-search">
                <div class="agency-insert__item-column"></div>
                <div class="agency-insert__item-column">
	                <button type="button" class="agency-insert__item-addr-search" onclick="goPopup();">주소검색</button>
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
                />
              </div>
              <div class="agency-insert__item">
                <div class="agency-insert__item-column">
                  <span class="agency-insert__item-name">관심분야</span>
                </div>
                <div class="agency-insert__checkbox-item">
                  <input
                    class="agency-insert__checkbox"
                    type="checkbox"
                    name="agencyCheckbox"
                    id=""
                    value="1"
                  />
                  <span class="agency-insert__checkbox-title">스트릿댄스</span>
                </div>
                <div class="agency-insert__checkbox-item">
                  <input
                    class="agency-insert__checkbox"
                    type="checkbox"
                    name="agencyCheckbox"
                    id=""
                    value="2"
                  />
                  <span class="agency-insert__checkbox-title">발라드</span>
                </div>
                <div class="agency-insert__checkbox-item">
                  <input
                    class="agency-insert__checkbox"
                    type="checkbox"
                    name="agencyCheckbox"
                    id=""
                    value="3"
                  />
                  <span class="agency-insert__checkbox-title">개그</span>
                </div>
                <div class="agency-insert__checkbox-item">
                  <input
                    class="agency-insert__checkbox"
                    type="checkbox"
                    name="agencyCheckbox"
                    id=""
                    value="4"
                  />
                  <span class="agency-insert__checkbox-title">악기연주</span>
                </div>
                <div class="agency-insert__checkbox-item">
                  <input
                    class="agency-insert__checkbox"
                    type="checkbox"
                    name="agencyCheckbox"
                    id=""
                    value="5"
                  />
                  <span class="agency-insert__checkbox-title">마술</span>
                </div>
              </div>
              <div class="agency-insert__btn-content">
                <button type="button" class="agency-insert__btn" onclick="insertAgency();">등 록</button>
              </div>
            </section>
            </form>
          </div>
        </main>
      </div>
    </div>
    <script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
    <script src="<c:url value='/resources/js/main/board/agency/insert.js'/>"></script>
  </body>
</html>
