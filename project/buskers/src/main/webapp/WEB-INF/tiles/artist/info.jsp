<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="busker-info">
	<img
		src="https://i.pinimg.com/564x/d4/12/4a/d4124a5565145151eeb2b40a8835155f.jpg" />
	<div class="busker-info__main">
		<div class="busker-info__nickname">${busker.activityName }</div>
		<div class="busker-info__content busker_profile"><textarea class='input_form' id="input_form_intro" readonly>${busker.intro }</textarea></div>
		<div class="busker-info__title">장르</div>
		<div class="busker-info__content"><input class='input_form' id="input_form_genre" value="${busker.genre }" readonly></div>
		<div class="busker-info__title">주요 공연장소</div>
		<div class="busker-info__content busker_location"><input class='input_form' id="input_form_location" value="${busker.location }" readonly></div>
		<div class="busker-info__title">주요 공연시간</div>
		<div class="busker-info__content"><input class='input_form' id="input_form_time" value="${busker.time }" readonly></div>
	</div>
</section>
<script>
	
	if("${sessionScope.user.buskerNo}"=="${param.buskerNo}"){
		$(".input_form").click(function(){
			$(this).removeAttr('readonly');
			$(this).addClass('input_form_go');
		})
		
		$(".input_form").blur(function(){
			let intro = $("#input_form_intro").val();
			let location = $("#input_form_location").val(); 
			let time = $("#input_form_time").val(); 
			let genre = $("#input_form_genre").val();
			$(this).attr('readonly',true);
			$(this).removeClass('input_form_go');
			
			$.ajax({
				data:{location:location
					 ,intro:intro
					 ,time:time
					 ,buskerNo:buskerNo
					 ,genre:genre},
				url : "intro-update.do" ,
			}).done(function(){
			
			});
		});
		
	}
</script>