<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%> <%@ taglib prefix="fmt"
uri="http://java.sun.com/jsp/jstl/fmt"%>
<link
  rel="stylesheet"
  href="<c:url value='/resources/css/main/info/info.css'/>"
/>
<link
  rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css"
/>
<section class="info">
  <article class="info-busker">
    <header class="info__header">
      Buskers
    </header>
    <section class="info-busker__profiles">
      <c:forEach var="busker" items="${map.buskerList}">
	      <article class="info-busker__profile">
	        <div class="info-busker__profile-wrapper">
	          <img
	            class="info-busker__profile-img"
	            src="<c:url value='/file/download.do?path=${busker.member.profileImgPath}${busker.member.profileImg}'/>"
	          />
	          <div class="info-busker__profile-content">
	            <div class="info-busker__profile-content-column">
	            <a href="<c:url value='/artist/main/main.do?buskerNo='/>${busker.buskerNo}">
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
      </div>
      <c:forEach var="song" items="${map.musicList}" varStatus="status">
	      <div class="info-song__item">
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
	          <a href="<c:url value='/artist/main/main.do?buskerNo=${song.buskerNo}'/>">
		          <span class="info-song__item-content-title">${song.title}</span>
	          </a>
	        </div>
	        <div class="info-song__item-content">
	          <a href="<c:url value='/artist/main/main.do?buskerNo=${song.buskerNo}'/>">
	          	<span class="info-song__item-content-artist">${song.writer}</span>
	          </a>
	        </div>
	        <div class="info-song__item-content">
	          <span class="info-song__item-content-time">${song.time}</span>
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
          <div class="swiper-slide">
            <iframe
              width="100%"
              height="100%"
              src="https://www.youtube.com/embed/XZwfiF04Orc"
              frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
            ></iframe>
          </div>
          <div class="swiper-slide">
            <iframe
              width="100%"
              height="100%"
              src="https://www.youtube.com/embed/XZwfiF04Orc"
              frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
            ></iframe>
          </div>
          <div class="swiper-slide">
            <iframe
              width="100%"
              height="100%"
              src="https://www.youtube.com/embed/XZwfiF04Orc"
              frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
            ></iframe>
          </div>
          <div class="swiper-slide shit">
            <iframe
              width="100%"
              height="100%"
              src="https://www.youtube.com/embed/XZwfiF04Orc"
              frameborder="0"
              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
              allowfullscreen
            ></iframe>
          </div>
          <div class="swiper-slide">Slide 2</div>
          <div class="swiper-slide">Slide 3</div>
          <div class="swiper-slide">Slide 4</div>
          <div class="swiper-slide">Slide 5</div>
          <div class="swiper-slide">Slide 6</div>
          <div class="swiper-slide">Slide 7</div>
          <div class="swiper-slide">Slide 8</div>
          <div class="swiper-slide">Slide 9</div>
          <div class="swiper-slide">Slide 10</div>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Arrows -->
        <div class="swiper-button-next swiper-button-white"></div>
        <div class="swiper-button-prev swiper-button-white"></div>
      </div>
    </section>
  </article>
</section>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script>
<script>
  const swiper = new Swiper(".swiper-container", {
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
</script>
