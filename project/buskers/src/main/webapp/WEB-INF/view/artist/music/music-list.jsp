<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
  rel="stylesheet"
  href="<c:url value='/resources/css/artist/music/music.css' />"
/>
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
                accept=".mp3, .wax"
              />
            </div>
          </div>
<!--           <input type="hidden" name="buskerName" value="" /> -->
<!--           <input type="hidden" name="buskerNo" value="" /> -->
          <div class="busker-music__form-row">
            <button type="button" class="busker-music__btn" onclick="insert(1);">등록</button>
          </div>
        </form>
      </div>
    </div>
  </section>
</section>
<script>
$(document).ready(() => {
    $(".busker-side__info-btn i").trigger("click");
});
</script>
<script>
  // list -> ajax 로 바꿀 것!
  function musicList(buskerNo) {
    $.ajax({
      url: "<c:url value='/artist/music/music-list-ajax.do'/>",
      dataType: "json",
      data: "buskerNo=" + buskerNo
    }).done(list => {
      let html = "";
      for (let song of list) {
        html +=
          `
          <div class="busker-music__list-item">
            <div class="busker-music__list-item-hidden">
              <div class="busker-music__hidden-item" value='`+song.fileNo+`'>
                <a class="busker-music__hidden-link">수정</a>
                <span>l</span>
                <a class="busker-music__hidden-link">삭제</a>
              </div>
            </div>
            <div class="busker-music__list-columns">
	               <div class="busker-music__album-img">
	                 <img
	                   src=""
	                   alt="profile"
	                   onError="this.src='<c:url value='/resources/img/music-profile.png' />';"
	                 />
	               </div>
	               <div class="busker-music__content">
	                 <div class="busker-music__content-title">` +
          song.title +
          `</div>
	                 <div class="busker-music__content-writer">` +
          song.writer +
          `</div>
	                 <div class="busker-music__content-time">
	                   <i class="far fa-clock"></i>
	                   <span class="busker-music__content-time-song">` +
          song.time +
          `</span>
	                 </div>
	               </div>
	               <div class="busker-music__submenu">
	                 <i class="fas fa-ellipsis-v fa-lg"></i>
	               </div>
               </div>
            </div>
			`;
      }
      $(".busker-music__list-items").html(html);
      $(".busker-music__submenu").click(function() {
        console.log("shit");
        $(this)
          .parent()
          .parent()
          .find(".busker-music__list-item-hidden")
          .fadeToggle();
      });
      $(".busker-music__hidden-item a:last-child").click(function(){
        const fileNo = $(this).parent().attr('value');
        console.log("fileNo ",fileNo);
        $.ajax({
          url : "<c:url value='/artist/music/music-delete-ajax.do'/>",
          data : "fileNo="+fileNo 
        })
        .done(()=>{
        	console.log("delete")
	        musicList(buskerNo);
        });
      });
    });
  }

function insert(buskerNo){
  const formData = new FormData(document.getElementById("musicForm"));
  console.log(formData);
  $.ajax({
    url : "<c:url value="/file/music-upload.do" />",
    type : "post",
    data : formData,
    contentType : false,
    processData : false
  }).done(()=>{
  musicList(buskerNo);
  });
}

function init() {
  musicList(1);
}
  init();
</script>
