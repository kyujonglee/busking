<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <link rel="stylesheet" href="<c:url value='/resources/css/artist/main/artist.css' />" />
    <script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <link
      rel="stylesheet"
      href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
      integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
      crossorigin="anonymous"
    />
    <title>Buskers</title>
  </head>
  <body>
    <!-- <button>확인</button> -->
    <div class="busker">
      <aside class="busker-side">
        <section class="busker-side__profile">
          <header class="busker-side__header">
            <a href="<c:url value='/artist/main/main.do'/>"class="busker-side__header-title">
              <i class="fas fa-street-view"></i>
              Buskers
            </a>
            <div class="busker-side__info-btn">
              <i class="fas fa-angle-left fa-2x"></i>
            </div>
          </header>
          <article class="busker-side__profile-info">
            <header class="busker-side__profile-header">
              <span class="busker__profile-header-edit">Edit</span>
              <button type="button" class="busker__profile-header-follow">
                팔로우 +
              </button>
            </header>
            <div class="busker-side__profile-photo">
              <img
                src="https://i.pinimg.com/564x/fb/e9/ca/fbe9cac78b4fc2ce0a43d9ac42e6de4c.jpg"
              />
              <span class="busker-side__profile-name">피아노 치는 이정환</span>
              <span class="busker-side__profile-id">piano_good</span>
              <div class="busker-side__profile-social">
                <i class="fab fa-facebook-square fa-lg facebook"></i>
                <img
                  src="https://image.freepik.com/free-vector/instagram-icon_1057-2227.jpg"
                  class="instagram"
                />
                <i class="fab fa-youtube fa-lg youtube"></i>
              </div>
            </div>
          </article>
        </section>
        <ul class="busker-side__menu">
          <li class="busker-side__menu-item">
            <div class="busker-side__menu-icon">
              <i class="fas fa-video fa-lg"></i>
            </div>
            <div class="busker-side__menu-title">
              영상 <span class="busker-side__menu-count">(30)</span>
            </div>
          </li>
          <li class="busker-side__menu-item">
            <div class="busker-side__menu-icon">
              <i class="far fa-images fa-lg"></i>
            </div>
            <div class="busker-side__menu-title">
              사진<span class="busker-side__menu-count">(99)</span>
            </div>
          </li>
          <li class="busker-side__menu-item">
            <div class="busker-side__menu-icon">
              <i class="far fa-clipboard fa-lg"></i>
            </div>
            <div class="busker-side__menu-title">
              팬 게시판
            </div>
          </li>
          <li class="busker-side__menu-item">
            <div class="busker-side__menu-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
              >
                <path
                  d="M22 4h-20c-1.104 0-2 .896-2 2v12c0 1.104.896 2 2 2h20c1.104 0 2-.896 2-2v-12c0-1.104-.896-2-2-2zm0 13.5c0 .276-.224.5-.5.5h-19c-.276 0-.5-.224-.5-.5v-6.5h20v6.5zm0-9.5h-20v-1.5c0-.276.224-.5.5-.5h19c.276 0 .5.224.5.5v1.5zm-9 6h-9v-1h9v1zm-3 2h-6v-1h6v1zm10-2h-3v-1h3v1z"
                />
              </svg>
            </div>
            <div class="busker-side__menu-title">
              후원게시판
            </div>
          </li>
          <li class="busker-side__menu-item">
            <div class="busker-side__menu-icon">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
              >
                <path
                  d="M24 2v22h-24v-22h3v1c0 1.103.897 2 2 2s2-.897 2-2v-1h10v1c0 1.103.897 2 2 2s2-.897 2-2v-1h3zm-2 6h-20v14h20v-14zm-2-7c0-.552-.447-1-1-1s-1 .448-1 1v2c0 .552.447 1 1 1s1-.448 1-1v-2zm-14 2c0 .552-.447 1-1 1s-1-.448-1-1v-2c0-.552.447-1 1-1s1 .448 1 1v2zm6.687 13.482c0-.802-.418-1.429-1.109-1.695.528-.264.836-.807.836-1.503 0-1.346-1.312-2.149-2.581-2.149-1.477 0-2.591.925-2.659 2.763h1.645c-.014-.761.271-1.315 1.025-1.315.449 0 .933.272.933.869 0 .754-.816.862-1.567.797v1.28c1.067 0 1.704.067 1.704.985 0 .724-.548 1.048-1.091 1.048-.822 0-1.159-.614-1.188-1.452h-1.634c-.032 1.892 1.114 2.89 2.842 2.89 1.543 0 2.844-.943 2.844-2.518zm4.313 2.518v-7.718h-1.392c-.173 1.154-.995 1.491-2.171 1.459v1.346h1.852v4.913h1.711z"
                />
              </svg>
            </div>
            <a href="<c:url value='/artist/board/enrollForm.do'/>" class="busker-side__menu-title">
              공연일정 등록
            </a>
          </li>
          <li class="busker-side__menu-item">
            <div class="busker-side__menu-icon">
              <i class="fas fa-music fa-lg"></i>
            </div>
            <div class="busker-side__menu-title">
              버스커 음악 등록
            </div>
          </li>
          <li class="busker-side__menu-item settings">
            <div class="busker-side__menu-icon">
              <i class="fas fa-cog"></i>
            </div>
            <div class="busker-side__menu-title">
              설정
            </div>
          </li>
        </ul>
        <section class="busker-side__buskers">
          <header class="buskers-header">
            <div class="buskers-header__title">관련 버스커</div>
          </header>
          <article class="buskers__recommend">
            <div class="buskers__recommend-item">
              <i class="fas fa-user-friends"></i>
              창현
            </div>
            <div class="buskers__recommend-item">
              <i class="fas fa-user-friends"></i>
              디에이드
            </div>
            <div class="buskers__recommend-item">
              <i class="fas fa-user-friends"></i>권민제
            </div>
          </article>
        </section>
        <section class="busker-side__logout">
          <span>logout</span>
        </section>
      </aside>
      <section class="busker-info">
        <img
          src="https://i.pinimg.com/564x/d4/12/4a/d4124a5565145151eeb2b40a8835155f.jpg"
        />
        <div class="busker-info__main">
          <div class="busker-info__nickname">피아노 치는 이정환</div>
          <div class="busker-info__content">
            1990년생 숭실대학교 화학공학과 학사인 피아노 연주자이자 작곡가.
            그리고 스트리머. Lorem ipsum dolor sit, amet consectetur adipisicing
            elit. Cum possimus modi, laudantium quos nobis temporibus molestiae
            nemo excepturi reprehenderit amet animi odit rem veritatis eaque
            culpa, vel aspernatur dicta illo.
          </div>
          <div class="busker-info__title">대표곡</div>
          <div class="busker-info__content">Witch House, A Busy Airport...</div>
          <div class="busker-info__title">주요 공연장소</div>
          <div class="busker-info__content">신촌 홍익문고 앞</div>
          <div class="busker-info__title">주요 공연시간</div>
          <div class="busker-info__content">토요일 오후 6시</div>
        </div>
      </section>
      <section class="busker-section">
        <header class="busker-header">
          <div class="busker-header__search">
            <svg
              xmlns="http://www.w3.org/2000/svg"
              width="20"
              height="20"
              viewBox="0 0 24 24"
            >
              <path
                d="M21.172 24l-7.387-7.387c-1.388.874-3.024 1.387-4.785 1.387-4.971 0-9-4.029-9-9s4.029-9 9-9 9 4.029 9 9c0 1.761-.514 3.398-1.387 4.785l7.387 7.387-2.828 2.828zm-12.172-8c3.859 0 7-3.14 7-7s-3.141-7-7-7-7 3.14-7 7 3.141 7 7 7z"
              />
            </svg>
            <input class="busker-header__search-input" type="text" />
          </div>
          <div class="busker-header__member">
            <span class="busker-header__id">kyujong93님</span>
            <i class="far fa-bell fa-lg"></i>
            <i class="fas fa-user-circle fa-lg"></i>
            <i class="fas fa-comment-dots fa-lg"></i>
          </div>
        </header>
        <main class="busker-main">
          <section class="busker-content">
            <div class="busker-content__item">
              <img src="<c:url value='/resources/img/piano.png' />" />
            </div>
            <div class="busker-content__item">
              <div class="busker-board">
                <header class="busker-board__header">
                  <div class="busker-board__header-column"></div>
                  <div class="busker-board__header-column">버스커 게시판</div>
                  <div class="busker-board__header-column">
                    <i class="fas fa-ellipsis-h"></i>
                  </div>
                </header>
                <article class="busker-board__row">
                  <div class="board-row__notice">
                    <i class="fas fa-bullhorn"></i>
                    <span class="board-row__content">
                      오늘 공연은 쉽니다.
                      <span class="board-row__cnt">[20]</span>
                    </span>
                    <span class="board-row__date">
                      05-17
                    </span>
                  </div>
                  <div class="board-row__notice">
                    <i class="fas fa-bullhorn"></i>
                    <span class="board-row__content">
                      오늘 공연은 쉽니다.
                      <span class="board-row__cnt">[20]</span>
                    </span>
                    <span class="board-row__date">
                      05-17
                    </span>
                  </div>
                  <div class="board-row__notice">
                    <i class="fas fa-bullhorn"></i>
                    <span class="board-row__content">
                      말씀드릴 사항이 있습니다.
                    </span>
                    <span class="board-row__date">
                      03-17
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">2</span>
                    <span class="board-row__content">
                      저번공연 너무 좋지 않았어요?? ditate! Lorem ipsum dolor
                      sit amet consectetur, adipisicing elit. Aliquid ratione ab
                      sint quaerat ea eaque dolores distinctio facere sequi,
                      ipsam recusandae assumenda, vitae id hic a tempore
                      expedita ipsa non?
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">3</span>
                    <span class="board-row__content">
                      저번공연 너무 좋지 않았어요?? ditate! Lorem ipsum dolor
                      sit amet consectetur, adipisicing elit. Aliquid ratione ab
                      sint quaerat ea eaque dolores distinctio facere sequi,
                      ipsam recusandae assumenda, vitae id hic a tempore
                      expedita ipsa non?
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">15</span>
                    <span class="board-row__content">
                      얼른 다시 뵙고싶어요!!
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">15</span>
                    <span class="board-row__content">
                      얼른 다시 뵙고싶어요!!
                      <span class="board-row__cnt">[122]</span>
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">15</span>
                    <span class="board-row__content">
                      얼른 다시 뵙고싶어요!!
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">15</span>
                    <span class="board-row__content">
                      얼른 다시 뵙고싶어요!!
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">15</span>
                    <span class="board-row__content">
                      얼른 다시 뵙고싶어요!!
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                  <div class="board-row__posts">
                    <span class="board-row__num">15</span>
                    <span class="board-row__content">
                      얼른 다시 뵙고싶어요!!
                    </span>
                    <span class="board-row__date">
                      05-12
                    </span>
                  </div>
                </article>
              </div>
            </div>
            <div class="busker-content__item">
              <div class="busker-content__support-wrapper">
                <div class="busker-content__support">
                  <header class="busker-content__support-header">
                    <div class="support-header__title">
                      후원하기
                    </div>
                    <div class="support-header__bar">
                      <div class="support-header__origin-bar"></div>
                      <div class="support-header__state-bar"></div>
                    </div>
                  </header>
                  <div class="busker-content__support-row">
                    <div class="busker-content__support-user">jin</div>
                    <div class="busker-content__support-title">
                      응원합니다! 이정환님
                    </div>
                    <div class="busker-content__support-date">04-13</div>
                  </div>
                  <div class="busker-content__support-row">
                    <div class="busker-content__support-user">kyu</div>
                    <div class="busker-content__support-title">
                      다음에 또 보러갈게요!
                    </div>
                    <div class="busker-content__support-date">04-13</div>
                  </div>
                  <div class="busker-content__support-row">
                    <div class="busker-content__support-user">kyu</div>
                    <div class="busker-content__support-title">
                      다음에 또 보러갈게요!
                    </div>
                    <div class="busker-content__support-date">04-13</div>
                  </div>
                  <div class="busker-content__support-row">
                    <div class="busker-content__support-user">kyu</div>
                    <div class="busker-content__support-title">
                      다음에 또 보러갈게요!
                    </div>
                    <div class="busker-content__support-date">04-13</div>
                  </div>
                </div>
              </div>
            </div>
            <div>
            	<img src="<c:url value='/resources/img/piano.png' />" />
            </div>
            <div>
            	<img src="<c:url value='/resources/img/piano.png' />" />
            </div>
            <div>
            	<img src="<c:url value='/resources/img/piano.png' />" />
            </div>
            <div>
            	<img src="<c:url value='/resources/img/piano.png' />" />
            </div>
            <div>
            	<img src="<c:url value='/resources/img/piano.png' />" />
            </div>
            <div>
            	<img src="<c:url value='/resources/img/piano.png' />" />
            </div>
          </section>
          <aside class="busker-chat">
            <header class="busker-chat__header">
              <span class="chat-header__title">버스커 채팅 </span>
              <i class="fas fa-cog"></i>
            </header>
            <section class="busker-chat__main">
              <div class="busker-chat__box">
                <span class="busker-chat__user">jin</span>
                <span class="busker-chat__item">: 안녕하세요! </span>
              </div>
              <div class="busker-chat__box">
                <span class="busker-chat__user">kyu</span>
                <span class="busker-chat__item">: 이잉이잉잉잉! </span>
              </div>
              <div class="busker-chat__box">
                <span class="busker-chat__user">jin</span>
                <span class="busker-chat__item">: 안녕하세요! </span>
              </div>
              <div class="busker-chat__box">
                <span class="busker-chat__user">jin</span>
                <span class="busker-chat__item">: 안녕하세요! </span>
              </div>
              <div class="busker-chat__box">
                <span class="busker-chat__user">jin</span>
                <span class="busker-chat__item"
                  >: Lorem ipsum dolor, sit amet consectetur adipisicing elit.
                  Quibusdam numquam nemo, praesentium dolorum incidunt rem est
                  accusamus iste dicta autem, optio quasi molestias architecto
                  nihil amet nostrum labore modi soluta?
                </span>
              </div>
              <div class="busker-chat__box mychat">
                <span class="busker-chat__user">나</span>
                <span class="busker-chat__item">: 안녕하세요! </span>
              </div>
              <div class="busker-chat__box">
                <span class="busker-chat__user">jin</span>
                <span class="busker-chat__item">: 안녕하세요! </span>
              </div>
            </section>
            <footer class="busker-chat__footer">
              <textarea
                class="chat__footer-input"
                cols="40"
                rows="5"
                placeholder="팬만 참여하실 수 있습니다."
              ></textarea>
              <button class="chat__footer-btn">전송</button>
            </footer>
          </aside>
        </main>
      </section>
    </div>
    <script src="<c:url value='/resources/js/artist/main/artist.js' />"></script>
  </body>
</html>
