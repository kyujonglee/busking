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
        <a class="side-bar__tag" href="<c:url value='/main/board/free/list.do'/>">
          <div class="side-bar__icon">
            <i class="fas fa-comments fa-lg"></i>
            <span class="side-bar__icon-content">자유게시판</span>
          </div>
        </a>
        <a class="side-bar__tag" href="<c:url value='/main/board/qna/list.do'/>">
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
        <a class="side-bar__tag" href="<c:url value='/main/board/agency/list.do'/>">
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
              <i class="fas fa-cog fa-lg"></i>
            </div>
          </div>
        </header>
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
                업체등록번호를 모르시나요?
                <a href="<c:url value='/main/board/agency/insertform.do'/>">
                  <span class="agency-check__insert-link"
                    >업체 등록신청하러 가기</span
                  >
                </a>
              </section>
            </main>
          </div>
        </main>
      </div>
    </div>
    <script
      src="https://code.jquery.com/jquery-3.4.1.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
  </body>
</html>
