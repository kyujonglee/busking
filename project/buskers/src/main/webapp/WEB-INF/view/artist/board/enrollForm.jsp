<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ecd2e05e789f3a1417e2dfe2c1e4f40&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css" />
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<section class="busker-show-enroll">
	<header class="busker-show-enroll__header">
		<div class="busker-show-enroll__header-top-menu">
			<a class="header-top-menu__content"
				href="<c:url value='/artist/main/main.do'/>"> <i
				class="fas fa-home fa-lg"></i> 버스커 홈
			</a> &gt <a class="header-top-menu__content"> 공연일정 </a> &gt <a
				class="header-top-menu__content"> 등록 </a>
		</div>
		<div class="busker-show-enroll__header-title">
			<a class="busker-show-enroll__header-link" href="#">공연일정 등록</a>
		</div>
	</header>
	<section class="busker-show-enroll__main">
		<div class="busker-show-enroll__main-columns">
			<div id="map"></div>
		</div>
		<div class="busker-show-enroll__main-columns">
			<form class="weather-search">
				<span class="weather-search__title">✔ 장소검색</span> <input type="text"
					class="weather-search__input" />
			</form>
			<form id="enrollForm" name="enrollForm" action="enroll.do" onsubmit="return check();" method="post">
				<div class="busker-show-enroll__form">
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							️<span>✔ 날짜</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="far fa-calendar-alt fa-lg content-icon"></i> <input
								type="text" class="busker-enroll__date" placeholder="날씨를 입력해주세요" />
								<input type="hidden" name="enrollDate" id="enrollDate" />
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 날씨 </span>
						</div>
						<div class="enroll-form-column__content">
							<span>.</span>
						</div>
						<input type="hidden" name="lat" id="lat" /> 
						<input type="hidden" name="lon" id="lon" />
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 장소</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="fas fa-map-marker-alt fa-lg content-icon"></i> <input
								type="text" class="enroll-form-column__place" name="place"/>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 공연제목</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="fas fa-pencil-alt fa-lg content-icon"></i> <input
								type="text" class="enroll-form-column__place" name="title"/>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 공연내용</span>
						</div>
						<div class="enroll-form-column__content">
							<textarea name="content" id="" class="enroll-form-column__textarea"></textarea>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<button class="busker-show-enroll__btn">등록</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</section>

<script type="module" src="<c:url value='/resources/js/artist/board/forecast.js' />"></script>
<script type="module" src="<c:url value='/resources/js/artist/board/map.js' />"></script>
<script type="module" src="<c:url value='/resources/js/artist/main/artist.js' />"></script>
<script>
 	  $(document).ready(() => {
        $(".busker-side__info-btn i").trigger("click");
      });
 	  function check(){
 		  $("#enrollDate").val( new Date($(".busker-enroll__date").val()) );
 		  return true;
 	  }
</script>