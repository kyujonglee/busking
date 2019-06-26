
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="busker-info" id="busker-info">
	<img src="" class="side_photo_img" />
	<input type="file" name="side_photo_button" class="side_photo_button"/>

	<div class="busker-info__main">
		<div class="busker-info__nickname">${busker.activityName }</div>
		<div class="busker-info__content busker_profile"><textarea class='input_form' id="input_form_intro" readonly></textarea></div>
		<div class="busker-info__title">장르</div>
		<div class="busker-info__content"><input class='input_form' id="input_form_genre" readonly></div>
		<div class="busker-info__title">주요 공연장소</div>
		<div class="busker-info__content busker_location"><input class='input_form' id="input_form_location" readonly></div>
		<div class="busker-info__title">주요 공연시간</div>
		<div class="busker-info__content"><input class='input_form' id="input_form_time"readonly></div>
	</div>
</section>


<script>
	buskerNo = "${sesessionScope.user.busker.buskerNo}";
	let introUpdate = "<c:url value='/artist/main/intro-update.do'/>";
	let artistPhotoProfileUpdate = "<c:url value='/file/artist-photo-profile-update.do'/>";
</script>
<script src="<c:url value='/resources/js/artist/main/info.js' />"></script>