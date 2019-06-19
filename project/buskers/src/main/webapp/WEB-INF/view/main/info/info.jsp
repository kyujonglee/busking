<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css"
/>
<link
  rel="stylesheet"
  href="<c:url value='/resources/css/main/info/info.css'/>"
/>
<section class="info">
  <article class="info-busker">
    <header class="info__header">
      Buskers
    </header>
    <section class="info-busker__profiles">
      <c:forEach var="busker" items="${map.buskerList}">
        <article class="info-busker__profile" value="${busker.buskerNo}">
          <div class="info-busker__profile-wrapper">
            <img
              class="info-busker__profile-img"
              src="<c:url value='/file/download.do?path=${busker.member.profileImgPath}${busker.member.profileImg}'/>"
              onError="this.src='<c:url value='/resources/img/profile.png' />';"
            />
            <div class="info-busker__profile-content">
              <div class="info-busker__profile-content-column">
                <a
                  href="<c:url value='/artist/main/main.do?buskerNo='/>${busker.buskerNo}"
                >
                  <span class="info-busker__profile-title">
                    ${busker.activityName}
                  </span>
                </a>
              </div>
              <div class="info-busker__profile-content-column">
                <i class="fas fa-user-alt"></i>
                <span class="info-busker__follow"> ${busker.followCnt} </span>
              </div>
            </div>
          </div>
        </article>
      </c:forEach>
    </section>
  </article>
  <article class="info-song">
    <header class="info__header">
      Recently
    </header>
    <section class="info-song__list">
      <div class="info-song__item">
        <div class="info-song__item-title"></div>
        <div class="info-song__item-title"></div>
        <div class="info-song__item-title">Title</div>
        <div class="info-song__item-title">Artist</div>
        <div class="info-song__item-title">Time</div>
        <div class="info-song__item-title">Busker</div>
      </div>
      <c:forEach var="song" items="${map.musicList}" varStatus="status">
        <div class="info-song__item" value="${song.fileNo}">
          <div class="info-song__item-content">
            <img
              src="<c:url value='/file/download.do?path='/>${song.imgPath}"
              class="info-song__item-content-img"
              onError="this.src='<c:url value='/resources/img/music-profile.png' />';"
            />
          </div>
          <div class="info-song__item-content">
            <span class="info-song__item-content-num">${status.count}</span>
          </div>
          <div class="info-song__item-content">
            <!-- 뮤직플레이어에 추가하는 기능! -->
            <span class="info-song__item-content-title" onclick="add(this);"
              >${song.title}</span
            >
          </div>
          <div class="info-song__item-content">
            <span class="info-song__item-content-artist">${song.writer}</span>
          </div>
          <div class="info-song__item-content">
            <span class="info-song__item-content-time">${song.time}</span>
          </div>
          <div class="info-song__item-content">
            <a
              href="<c:url value='/artist/main/main.do?buskerNo=${song.buskerNo}'/>"
              class="info-song__item-content-busker"
            >
              <span>${song.busker.activityName}</span>
            </a>
          </div>
        </div>
      </c:forEach>
    </section>
  </article>
  <article class="info-video">
    <header class="info__header">
      Busker Video
    </header>
    <section class="info-video__slider">
      <div class="swiper-container">
        <div class="swiper-wrapper">
        </div>
        <!-- Add Pagination -->
        <!-- <div class="swiper-pagination"></div> -->
        <!-- Add Arrows -->
        <div class="swiper-button-prev">
  		  <svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24"><path d="M0 12c0 6.627 5.373 12 12 12s12-5.373 12-12-5.373-12-12-12-12 5.373-12 12zm7.58 0l5.988-5.995 1.414 1.416-4.574 4.579 4.574 4.59-1.414 1.416-5.988-6.006z"/></svg>
		</div>
        <div class="swiper-button-next">
    		<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" viewBox="0 0 24 24"><path d="M12 0c-6.627 0-12 5.373-12 12s5.373 12 12 12 12-5.373 12-12-5.373-12-12-12zm-1.568 18.005l-1.414-1.415 4.574-4.59-4.574-4.579 1.414-1.416 5.988 5.995-5.988 6.005z"/></svg>
		</div>
      </div>
    </section>
  </article>
</section>

<div class="busker-audio-wrapper">
  <div class="audio-menu">
    <!-- 뮤직플레이어에 제목과 가수가 표시 되지 않는다는 단점!!-->
    <!-- 어떻게 보완할 것인지... 퍼블리싱!-->
    <header class="audio-menu__header">
      <span class="audio-menu__header-title"> 내 재생목록 </span>
      <span class="audio-menu__header-cnt"> ${map.musicList.size()} 곡 </span>
    </header>
    <ul class="audio-menu__content"></ul>
  </div>
  <div class="music-box">
    <div class="music-box__imgbox">
      <img 
          src="
                <c:url value='/file/download.do?path='/>${map.musicList[0].imgPath ? map.musicList[0].imgPath:'' }
          "
      	class="music-box__img"
      	onError="this.src='<c:url value='/resources/img/music-profile.png' />';" 
      />
    </div>
    <div class="music">
      <div class="music-title">${map.musicList[0].title}</div>
      <div class="music-writer">${map.musicList[0].writer}</div>
    </div>
  </div>
  <div class="busker-audio">
<!--             <audio id="myAudio" loop="loop" autoplay="autoplay"> -->
    <audio id="myAudio" loop="loop">
      <!--           <source -->
      <%-- src="<c:url value="/file/download.do?path=${audioList[0].path}" />"
      --%>
      <!--             type="audio/mpeg" -->
      <!--           /> -->
      <source src="${map.musicList[0].path}" type="audio/mpeg" />
    </audio>
    <div class="busker-audio__column">
      <div class="now playing paused" id="music">
        <span class="bar n1"></span>
        <span class="bar n2"></span>
        <span class="bar n3"></span>
        <span class="bar n4"></span>
        <span class="bar n5"></span>
      </div>
    </div>
    <div class="busker-audio__column">
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 24 24"
      >
        <path d="M4 2v20h-2v-20h2zm18 0l-16 10 16 10v-20z" />
      </svg>
      <i class="fas fa-play" id="play"></i>
      <svg
        xmlns="http://www.w3.org/2000/svg"
        width="16"
        height="16"
        viewBox="0 0 24 24"
      >
        <path d="M20 22v-20h2v20h-2zm-18 0l16-10-16-10v20z" />
      </svg>
    </div>
    <div class="busker-audio__column">
      <div>
        <canvas id="myCanvas" height="6px" width="150px"></canvas>
      </div>
      <div id="cTime">
        <span id="currentTime"> 00:00 </span> /
        <span id="duration"> 00:00 </span>
      </div>
    </div>
    <div class="busker-audio__column">
      <i class="fas fa-volume-up" id="mute"></i>
      <input
        id="volumeAudio"
        type="range"
        min="0"
        max="1"
        step="0.005"
        value="0.5"
      />
    </div>
    <div class="busker-audio__column">
      <i class="fas fa-list-ul fa-lg" id="menu-btn"></i>
    </div>
  </div>
  <svg
    class="busker-audio__btn"
    xmlns="http://www.w3.org/2000/svg"
    width="24"
    height="24"
    viewBox="0 0 24 24"
  >
    <path
      d="M24 20.682c-.002 1.555-1.17 2.318-2.24 2.318-.903 0-1.76-.544-1.76-1.616 0-1.104 1.201-2.118 2.515-2.118.161 0 .323.015.485.047v-4.312l-6 1.229v5.45c-.002 1.556-1.18 2.32-2.258 2.32-.906 0-1.742-.542-1.742-1.61 0-1.106 1.201-2.125 2.518-2.125.16 0 .322.015.484.047v-6.52l7.998-1.792v8.682zm-13-6.682c-1.657 0-3-1.343-3-3s1.343-3 3-3 3 1.343 3 3-1.343 3-3 3zm0-1c1.103 0 2-.897 2-2s-.897-2-2-2-2 .897-2 2 .897 2 2 2zm-1.818 2.646c-1.293-.508-2.319-1.534-2.827-2.827l-1.025.128c.6 1.746 1.979 3.125 3.725 3.724l.127-1.025zm-4.869-2.572l-1 .125c.757 2.648 2.84 4.731 5.488 5.488l.125-1c-2.194-.683-3.93-2.418-4.613-4.613zm8.505-6.72c1.293.508 2.319 1.534 2.827 2.828l1.025-.128c-.6-1.746-1.979-3.125-3.725-3.725l-.127 1.025zm-1.771 15.644c.082-.734.378-1.441.878-2.045-.304.03-.613.047-.925.047-4.963 0-9-4.038-9-9s4.037-9 9-9c4.912 0 8.91 3.957 8.992 8.849l1.978-.443c-.311-5.798-5.096-10.406-10.97-10.406-6.075 0-11 4.925-11 11s4.925 11 11 11l.047-.002zm2.151-18.685l-.125 1c2.195.682 3.931 2.418 4.613 4.613l1-.125c-.755-2.648-2.838-4.732-5.488-5.488z"
    />
  </svg>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<script>
  const audioItemList = [];
  <c:forEach var="item" items="${map.musicList}">
  	audioItemList.push({
  		title: "${item.title}",
  		writer : "${item.writer}",
  		path : "${item.path}",
  		duration : "${item.time}",
  		imgPath : "${item.imgPath}"
  	});
  </c:forEach>
  console.log(audioItemList);
</script>
<script src="<c:url value='/resources/js/audio.js'/>"></script>
<script>
	
  <%-- 곡 추가에 대한 function --%>
  function add(obj) {
    const fileNo = obj.parentNode.parentNode.getAttribute("value");
    $.ajax({
      url: "<c:url value='/artist/music/music-item-ajax.do'/>",
      type: "post",
      data: "fileNo=" + fileNo
    }).done(musicFile => {
      console.log(musicFile);
      audioItemList.push(musicFile);
      console.log(audioItemList);
      const index = audioItemList.length - 1;
      $(".audio-menu ul").prepend(
        `
    	<li class="audio-menu__content-column" data-index="` +
          index +
          `">
        <div class="audio-menu__content-colum-sbox">
          <div class="audio-menu__sbox">삭제</div>
        </div>
        <div class="audio-menu__music">
          <span class="audio-menu__title">` +
          musicFile.title +
          `</span>
          <span class="audio-menu__writer">` +
          musicFile.writer +
          `</span>
        </div>
        <div class="audio-menu__submenu">
          <span class="audio-menu__duration">` +
          musicFile.time +
          `</span>
          <i class="fas fa-ellipsis-v"></i>
        </div>
      </li>
  	`
      );
      list = document.querySelectorAll(".audio-menu > ul > li");
      $(".audio-menu > ul > li:first-child .audio-menu__music").click(function(
        e
      ) {
        const index = $(this)
          .parent()
          .data("index");
        const audioItem = audioItemList[index];
        list.forEach(ele => {
          ele.classList.remove("audio-menu__selected");
        });
        $(this)
          .parent()
          .addClass("audio-menu__selected");
        audio.src = audioItem.path;
        $(".music .music-title").text(audioItem.title);
        $(".music .music-writer").text(audioItem.writer);
        $(".music-box .music-box__img").attr({src:"/buskers/file/download.do?path="+audioItem.imgPath});
        $("#play").trigger("click");
      });
      $(".audio-menu__header .audio-menu__header-cnt").text(list.length + "곡");

      $(".audio-menu__content-column:first-child .audio-menu__submenu i").click(
        function() {
          $(this)
            .parent()
            .parent()
            .children(".audio-menu__content-colum-sbox")
            .fadeToggle("ease-in-out");
        }
      );

      $(
        ".audio-menu__content li:first-child .audio-menu__content-colum-sbox .audio-menu__sbox"
      ).on("click", function(e) {
        const li = e.target.parentNode.parentNode;
        audioList.removeChild(li);
        list = audioList.querySelectorAll("li");
        $(".audio-menu__header .audio-menu__header-cnt").text(
          list.length + "곡"
        );
      });
    });
  }
  
  let swiper;
  <%-- video를 가져오는 ajax --%>
  $(document).ready(()=>{
	  swiper = new Swiper(".swiper-container", {
	      slidesPerView: 1.3,
	      spaceBetween: 50,
	      centeredSlides: true,
	      pagination: {
	        el: ".swiper-pagination",
	        clickable: true
	      },
	      navigation: {
	        nextEl: ".swiper-button-next",
	        prevEl: ".swiper-button-prev"
	      }
	  });
	  $.ajax({
		  url : "<c:url value='/main/info/video-list-ajax.do'/>",
		  dataType : "json"
	  }).done((videoList)=>{
		  let html = "";
		  for(let i = 0; i<videoList.length ; i++){
			 	html +=		
		            `
		          <div class="swiper-slide">
		            <iframe
		              width="540px"
		              height="360px"
		              src="`+videoList[i].url+`"
		              frameborder="0"
		              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
		              allowfullscreen
		            ></iframe>
		          </div>
				 `;			  
		  }
		  $(".swiper-wrapper").html(html);
		  swiper.update();
		  /* swiper.updateSlides(); */
	  });
  })
  
  $(".info-busker__profile-img").click(function(){
	  const no = $(this).parent().parent().attr("value");
	  $.ajax({
		  url : "<c:url value='/main/info/video-item-ajax.do'/>",
		  dataType : "json",
		  data : "buskerNo="+no
	  }).done((videoList)=>{
		  
		  let html = "";
		  if(videoList.length !== 0){
			  for(let i = 0; i<videoList.length ; i++){
				 	html +=		
			            `
			          <div class="swiper-slide">
			            <iframe
			              width="540px"
			              height="360px"
			              src="`+videoList[i].url+`"
			              frameborder="0"
			              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
			              allowfullscreen
			            ></iframe>
			          </div>
					 `;			  
			  }
		  } else {
			  console.log("shit");
			  html +=
				  `
				  <div class="info-video__empty">
			  	     버스커가 올린 영상이 존재하지 않습니다.
			  	  </div>
				  `;
		  }
		  $(".swiper-wrapper").html(html);
		  swiper.update();
		  swiper.slideTo(0);
	  })
  });
  
</script>
