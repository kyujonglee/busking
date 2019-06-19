<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				class="header-top-menu__content"> 등록 </a>
		</div>
		<div class="busker-show__header-title">
			<a class="busker-show__header-link" href="#">공연일정 등록</a>
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
			<form id="enrollForm" name="enrollForm" action="<c:url value='/artist/board/enroll.do'/>" onsubmit="return check();" method="post">
				<div class="busker-show-enroll__form">
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							️<span>✔ 날짜</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="far fa-calendar-alt fa-lg content-icon"></i> <input
								type="text" class="busker-enroll__date" placeholder="날짜를 선택해주세요" />
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
						<input type="hidden" name="gu" id="gu" />
						<input type="hidden" name="doo" id="doo" />
						<input type="hidden" name="temperature" id="temperature" />
						<input type="hidden" name="weather" id="weather" />
						<input type="hidden" name="weatherIcon" id="weatherIcon" />
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 장소</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="fas fa-map-marker-alt fa-lg content-icon"></i> <input
								type="text" class="enroll-form-column__place" name="place" id="place"/>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 장르</span>
						</div>
						<div class="enroll-form-column__content">
							<c:forEach var="genre" items="${genres}">
								<input class="busker-enroll-radio" TYPE='radio' id='genre${genre.genreNo}' name='genreNo' value='${genre.genreNo}' /><label for='genre${genre.genreNo}'>${genre.name}</label>
								<%-- <input type="radio" name="genre" value="${genre.genreNo}"/><span>${genre.name}</span> --%>
							</c:forEach>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 공연제목</span>
						</div>
						<div class="enroll-form-column__content">
							<i class="fas fa-pencil-alt fa-lg content-icon"></i> <input
								type="text" class="enroll-form-column__place" name="title" id="title"/>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<div class="enroll-form-column__title">
							<span>✔ 공연내용</span>
						</div>
						<div class="enroll-form-column__content">
							<textarea name="content" id="content" class="enroll-form-column__textarea"></textarea>
						</div>
					</div>
					<div class="busker-show-enroll__form-column">
						<input type="hidden" name="buskerNo" value="${buskerNo}" />
						<button class="busker-show-enroll__btn">등록</button>
					</div>
				</div>
			</form>
		</div>
	</section>
</section>


<script src="<c:url value='/resources/js/artist/board/forecast.js' />"></script>
<script src="<c:url value='/resources/js/artist/board/map.js' />"></script>
<script src="<c:url value='/resources/js/artist/board/enroll.js' />"></script>
<script>
 	  function check(){
 		  const lat = $("#lat").val();
 		  const enrollDate = $(".busker-enroll__date").val();
 		  const place = $("#place").val();
 		  const title = $("#title").val();
 		  const content = $("#content").val();
 		  
 		  if(lat === ""){
 			  alert("공연위치를 지도에서 클릭해주세요!");
 			  return false;
 		  }
 		  
 		  if(enrollDate === "") {
 			  alert("날짜를 선택해주세요.");
 			  return false;
 		  }else {
 			  if(new Date(enrollDate) < new Date()){
 				  alert("현재 날짜 이후로 선택 가능합니다.");
 				  return false;
 			  }
 		  }
 		  if(title === ""){
 			  alert("제목을 입력해주세요.");
 			  $("#title").focus();
 			  return false;
 		  }
 		  if(place === ""){
 			  alert("장소를 입력해주세요.");
 			  $("#place").focus();
 			  return false;
 		  }
 		  if(content === ""){
 			  alert("내용을 입력해주세요.");
 			  $("#content").focus();
 			  return false;
 		  }
 		  
 		  
 		  
 		  $("#enrollDate").val( new Date(enrollDate) );
		  if($("#temperature").val() === ""){
			  $("#temperature").val(0);
		  }
 		  return true;
 	  }
</script>