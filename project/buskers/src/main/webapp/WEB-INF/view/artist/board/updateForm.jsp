<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ecd2e05e789f3a1417e2dfe2c1e4f40&libraries=services,clusterer,drawing"></script>
<link rel="stylesheet" type="text/css" href="https://npmcdn.com/flatpickr/dist/themes/material_orange.css" />
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<section class="busker-show-enroll">
	<header class="busker-show__header">
		<div class="busker-show__header-top-menu">
			<a class="header-top-menu__content"
				href="<c:url value='/artist/main/main.do'/>"> <i
				class="fas fa-home fa-lg"></i> 버스커 홈
			</a> &gt <a class="header-top-menu__content"> 공연일정 </a> &gt <a
				class="header-top-menu__content"> 수정 </a>
		</div>
		<div class="busker-show__header-title">
			<a class="busker-show__header-link" href="#">공연일정 수정</a>
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
			<form id="enrollForm" name="enrollForm" action="<c:url value='/artist/board/update.do'/>" onsubmit="return check();" method="post">
				<div class="busker-show-enroll__form">
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							️<span>✔ 날짜</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="far fa-calendar-alt fa-lg content-icon"></i> 
							<input type="text" class="busker-enroll__date" placeholder="날짜를 선택해주세요" value="<fmt:formatDate value="${show.enrollDate}" pattern="yyyy-MM-dd HH:mm" type="both" />"/>
								<input type="hidden" name="enrollDate" id="enrollDate" />
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 날씨 </span>
						</div>
						<input type="hidden" name="showNo" id="showNo" value="${show.showNo}"/> 
						<input type="hidden" name="lat" id="lat" value="${show.lat}"/> 
						<input type="hidden" name="lon" id="lon" value="${show.lon}"/>
						<input type="hidden" name="gu" id="gu" value="${show.gu}"/>
						<input type="hidden" name="doo" id="doo" value="${show.doo}"/>
						<input type="hidden" name="temperature" id="temperature" value="${show.temperature}"/>
						<input type="hidden" name="weather" id="weather" value="${show.weather}"/>
						<input type="hidden" name="weatherIcon" id="weatherIcon" value='${show.weatherIcon}'/>
						<div class="enroll-form-column__content">
							  <c:if test="${show.weatherIcon ne ''}">
					              <span class="enroll-form-column__content-temperature-icon"><i class="fas fa-temperature-high fa-lg"></i></span>
					              <span class="enroll-form-column__content-temperature"> ${show.temperature} °C </span>
								  <span class="enroll-form-column__content-weather-icon">
								  	${show.weatherIcon} 
					              </span>
					              <span class="enroll-form-column__content-weather"> ${show.weather} </span>
							  </c:if>
							  <c:if test="${show.weatherIcon eq ''}">
							  	<span>날씨 정보가 존재하지 않습니다.</span>
							  </c:if>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 장소</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="fas fa-map-marker-alt fa-lg content-icon"></i> 
							<input type="text" class="enroll-form-column__place" name="place" value="${show.place}"/>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 공연제목</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="fas fa-pencil-alt fa-lg content-icon"></i> <input
								type="text" class="enroll-form-column__place" name="title" value="${show.title}"/>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 공연내용</span>
						</div>
						<div class="enroll-form-column__content">
							<textarea name="content" id="" class="enroll-form-column__textarea">${show.content}</textarea>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<button class="busker-show-enroll__btn">확인</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</section>


<script src="<c:url value='/resources/js/artist/board/forecast.js' />"></script>
<script src="<c:url value='/resources/js/artist/board/map.js' />"></script>
<script>
 	  $(document).ready(function(){
        $(".busker-side__info-btn i").trigger("click");
      });
 	 	function init() {
 		  console.log("update 초기실행");
 		  const lat = '<c:out value="${show.lat}"/>';
 		  const lon = '<c:out value="${show.lon}"/>';
 		  mapInit(lat, lon);
 	 	}
 	 	init();
 	  function check(){
 		  $("#enrollDate").val( new Date($(".busker-enroll__date").val()) );
		  if($("#temperature").val() === ""){
			  $("#temperature").val(0);
		  }
 		  return true;
 	  }
 	  
 	  
</script>