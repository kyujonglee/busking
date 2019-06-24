<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
  rel="stylesheet"
  href="<c:url value='/resources/css/artist/music/music.css' />"
/>
<link rel="stylesheet" href="<c:url value='/resources/css/common/sweetalert2.min.css'/>" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<section class="busker-music">
  <div class="busker-music__wrapper"></div>
  <header class="busker-show__header">
    <div class="busker-show__header-top-menu">
      <a class="header-top-menu__content">
        <i class="fas fa-home fa-lg"></i>
        버스커 홈
      </a>
      &gt <a class="header-top-menu__content"> 버스커 음악 </a>
    </div>
    <div class="busker-show__header-title">
      <a class="busker-show__header-link">버스커 음악</a>
      <!-- <a href="" class="busker-show__header-enroll-btn" id="musicBtn">
        등록하기
      </a> -->
    </div>
  </header>
  <section class="busker-music__main">
    <div class="busker-music__main-column">
      <div class="busker-music__list">
        <header class="busker-music__list-header">
          <div class="busker-music__list-header-column">
            <i class="fas fa-signal"></i>
            <i class="fas fa-wifi"></i>
            <i class="fas fa-battery-full"></i>
          </div>
        </header>
        <main class="busker-music__list-main">
          <div class="busker-music__list-main-title">
            <i class="fas fa-music"></i>
            <span>Music List</span>
          </div>
          <div class="busker-music__list-items">
            <button class="busker-music__list-btn"></button>
          </div>
        </main>
      </div>
    </div>
    <div class="busker-music__main-column">
      <div class="busker-music__form">
        <!-- <c:url value="/file/music-upload.do" /> -->
        <form
          method="post"
          enctype="multipart/form-data"
          id="musicForm"
          action="<c:url value="/file/music-upload.do" />"
        >
          <div class="busker-music__form-row">
            <div class="busker-music__form-row-title">
              노래 제목
            </div>
            <div class="busker-music__form-row-content">
              <input
                type="text"
                name="title"
                id="title"
                placeholder="제목을 입력해주세요"
              />
            </div>
          </div>
          <div class="busker-music__form-row">
            <div class="busker-music__form-row-title">
              아티스트
            </div>
            <div class="busker-music__form-row-content">
              <input
                type="text"
                name="writer"
                id="writer"
                placeholder="아티스트를 입력해주세요"
              />
            </div>
          </div>
          <div class="busker-music__form-row">
            <div class="busker-music__form-row-title">
              연주 시간
            </div>
            <div class="busker-music__form-row-content">
              <input
                type="text"
                name="time"
                id="time"
                placeholder="ex) 03:20"
              />
            </div>
          </div>
          <div class="busker-music__form-row">
            <div class="busker-music__form-row-title">
              노래 첨부
            </div>
            <div class="busker-music__form-row-content">
              <input
                type="file"
                name="attach"
                id="attach"
                placeholder="파일을 선택해주세요."
                accept="audio/*"
                onchange='chk_file_type(this)'
              />
            </div>
          </div>
          <div class="busker-music__form-row">
            <div class="busker-music__form-row-title">
              이미지 첨부
            </div>
            <div class="busker-music__form-row-content">
              <input
                type="file"
                name="attach2"
                id="attach2"
                placeholder="파일을 선택해주세요."
                accept="image/*"
                onchange='chk_file_type2(this)'
              />
            </div>
          </div>
<!--           <input type="hidden" name="buskerName" value="" /> -->
          <input type="hidden" name="buskerNo" value="${buskerNo}" />
          <div class="busker-music__form-row">
            <button type="button" class="busker-music__btn" onclick="insert(${buskerNo});">등록</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</section>
<script>
	const musicListUrl = "<c:url value='/artist/music/music-list-ajax.do'/>";
	const defaultProfileUrl = "<c:url value='/resources/img/music-profile.png' />";
	const musicDeleteUrl = "<c:url value='/artist/music/music-delete-ajax.do'/>";
	const musicItemUrl = "<c:url value='/artist/music/music-item-ajax.do'/>";
// 	const buskerNo = ${param.buskerNo};
	const mainCountUrl = "<c:url value='/artist/main/main-ajax.do'/>";
	const musicUpdateUrl = "<c:url value='/file/music-update-ajax.do'/>";
	const musicInsertUrl = "<c:url value="/file/music-insert.do" />";
	const downloadPath = "<c:url value='/file/download.do?path='/>";
</script>
<script src="<c:url value='/resources/js/artist/music/music.js'/>"></script>