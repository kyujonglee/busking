
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="busker-info">
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

	//로그인해서 일치하는 유저만 클릭해서 수정가능	
	if("${sessionScope.user.busker.buskerNo}"=="${param.buskerNo}"){
		$(".input_form").click(function(){
			$(this).removeAttr('readonly');
			$(this).addClass('input_form_go');
		})
		//블러시에 업데이트
		$(".input_form").blur(function(){
			let intro = $("#input_form_intro").val();
			let location = $("#input_form_location").val(); 
			let time = $("#input_form_time").val(); 
			let genre = $("#input_form_genre").val();
			$(this).attr('readonly',true);
			$(this).removeClass('input_form_go');
			//업데이트
			$.ajax({
				data:{location:location
					 ,intro:intro
					 ,time:time
					 ,buskerNo:buskerNo
					 ,genre:genre},
				url : "<c:url value='/artist/main/intro-update.do'/>",
			}).done(function(){
			});
		});
	}else{
		$(".side_photo_img").css("cursor","default");
	}
	
	//클릭시에 파일;
	if("${sessionScope.user.busker.buskerNo}"=="${param.buskerNo}"){
		$(".side_photo_img").click(function(e){
			e.preventDefault();
			$(".side_photo_button").click();
		})
	}
	
	//파일이 들어왔을시에 변경함
	$(document).ready(function () {
		$(".side_photo_button").on("change", function(){
			let formData = new FormData();
			let file = $(".side_photo_button")[0].files[0]
			//파일 유효성 검사
			let fileName = $(".side_photo_button")[0].files[0].name;	
			fileName = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
			
			let pattern = /jpg|png|jpeg/i;
			
			if(fileName != "jpg" && fileName != "png" &&  fileName != "bmp" &&  fileName != "jpeg"){ //확장자를 확인합니다.
				alert('썸네일은 이미지 파일(jpg, png, jpeg, bmp)만 등록 가능합니다.');
				return;
			}
			
			let buskerNo = "${param.buskerNo}";
			formData.append("file", file);
			formData.append("buskerNo",buskerNo);
			
			
			//파일등록 에이작스
			$.ajax({
				type : "post",
				data: formData,
				processData: false,
				contentType: false,
				cache : false,
				url : '/buskers/file/artist-photo-profile-update.do',
			}).done(function(){
				$.ajax({
					url : "<c:url value='/artist/main/main-ajax.do'/>",
					dateType : "json",
					data : "buskerNo="+buskerNo
				}).done(map => {
					const photo = map.busker.photo;
					$(".side_photo_img").attr("src",
							"<c:url value='/file/download.do'/>?path="+photo);
				})		
			})
		});
	});

</script>