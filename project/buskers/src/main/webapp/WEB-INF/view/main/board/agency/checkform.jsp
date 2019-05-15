<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
  <main class="main-agency">
    <div class="agency-check">
      <header class="agency-check__header">
        <span class="agency-check__header-title">업체고유번호 등록</span>
      </header>
      <main class="agency-check__main">
        <section class="agency-check__section">
          <div class="agency-check__answer">
            <span class="agency-check__answer-title">
              업체등록번호
            </span>
            <input class="agency-check__answer-input" type="text" />
          </div>
          <button class="agency-check__ok-button">확인</button>
        </section>
        <section class="agency-check__section">
        <span class="agency-check__section-question">업체등록번호를 모르시나요?</span>
          <a href="<c:url value='/main/board/agency/insertform.do'/>">
            <span class="agency-check__insert-link"
              >업체 등록신청하러 가기</span
            >
          </a>
        </section>
      </main>
    </div>
  </main>