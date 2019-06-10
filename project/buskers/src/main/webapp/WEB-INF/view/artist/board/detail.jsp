<%@page import="kr.co.buskers.repository.domain.ArtistShow"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6ecd2e05e789f3a1417e2dfe2c1e4f40&libraries=services,clusterer,drawing"></script>
<section class="busker-show-detail">
	<header class="busker-show__header">
		<div class="busker-show__header-top-menu">
			<a class="header-top-menu__content"
				href="<c:url value='/artist/main/main.do'/>"> <i
				class="fas fa-home fa-lg"></i> 버스커 홈
			</a> &gt <a href="<c:url value='list.do' />" class="header-top-menu__content"> 공연일정 </a> &gt <a
				class="header-top-menu__content"> 상세조회 </a>
		</div>
		<div class="busker-show__header-title">
			<a class="busker-show__header-link" href="#">공연일정 상세조회</a>
		</div>
	</header>
	<section class="busker-show-detail__main">
		<div class="busker-show-detail__main-columns">
			<div id="map"></div>
		</div>
		<div class="busker-show-detail__main-columns">
			<form class="weather-search">
				<span class="weather-search__title">✔ 장소검색</span> 
				<input type="text" class="weather-search__input" />
			</form>
				<div class="busker-show-detail__items">
					<div class="busker-show-detail__item">
						<div class="detail-item__title">
							️<span>✔ 날짜</span>
						</div>
						<div class="detail-item__content">
							<i class="far fa-calendar-alt fa-lg"></i> 
							<fmt:formatDate value="${show.enrollDate}" pattern="yyyy-MM-dd HH:mm" type="both" />
						</div>
					</div>
					<div class="busker-show-detail__item">
						<div class="detail-item__title">
							<span>✔ 날씨 </span>
						</div>
						<div class="detail-item__content">
							<c:if test="${show.weather ne ''}">
	                    		<span><i class="fas fa-temperature-high fa-lg"></i></span>
	                    		<span>${show.temperature} °C</span>
								<span>${show.weatherIcon}</span>
	                    		<span>${show.weather}</span>
							</c:if>
							<c:if test="${show.weather eq ''}">
								<span>날씨 정보가 존재하지 않습니다.</span>
							</c:if>
						</div>
					</div>
					<div class="busker-show-detail__item">
						<div class="detail-item__title">
							<span>✔ 장소</span>
						</div>
						<div class="detail-item__content">
							<i class="fas fa-map-marker-alt fa-lg content-icon"></i>
					 	    <span>${show.place}</span>								
						</div>
					</div>
					<div class="busker-show-detail__item">
						<div class="detail-item__title">
							<span>✔ 공연제목</span>
						</div>
						<div class="detail-item__content">
							<i class="fas fa-pencil-alt fa-lg content-icon"></i> 
							<span>${show.title}</span>
						</div>
					</div>
					<div class="busker-show-detail__item">
						<div class="detail-item__title">
							<span>✔ 공연내용</span>
						</div>
						<div class="detail-item__content">
							<span>${show.content}</span>
						</div>
					</div>
					<div class="busker-show-detail__item">
						<a onclick="update(${show.showNo},'<fmt:formatDate value="${show.enrollDate}" pattern="yyyy-MM-dd HH:mm" type="both" />' );" >
							<button type="button" class="busker-show-update__btn">수정</button>
						</a>
						<a href="delete.do?showNo=${show.showNo}&buskerNo=${buskerNo}">
							<button type="button" class="busker-show-delete__btn">삭제</button>
						</a>
						<a href="list.do?buskerNo=${buskerNo}">
							<button type="button" class="busker-show-list__btn">목록</button>
						</a>
					</div>
				</div>
		</div>
	</section>
</section>
<script src="<c:url value='/resources/js/artist/board/map.js' />"></script>
<script>
$(document).ready(function(){
    $(".busker-side__info-btn i").trigger("click");
});

function init() {
  console.log("detail 초기실행");
  const lat = '<c:out value="${show.lat}"/>';
  const lon = '<c:out value="${show.lon}"/>';
  mapInit(lat, lon);
}

const update = (showNo, enrollDate) => {
	  if(new Date() > new Date(enrollDate)){
		  alert("현재 날짜 이전의 공연날짜는 수정할 수 없습니다.");
	  }else {
		  location.href = `updateForm.do?showNo=` + showNo+ `&buskerNo=`+${buskerNo};
	  }
};
init();
</script>