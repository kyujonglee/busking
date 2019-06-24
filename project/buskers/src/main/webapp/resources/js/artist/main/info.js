//로그인해서 일치하는 유저만 클릭해서 수정가능	
if(buskerNo == paramBuskerNo){
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
			url : introUpdate,
		}).done(function(){
		});
	});
	
}else{
	
	$(".side_photo_img").css("cursor","default");
	
}
	
//클릭시에 파일첨부 기능 실행
if(buskerNo == paramBuskerNo){
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
		fileName = fileName.slice(fileName.lastIndexOf(".") + 1).toLowerCase(); 
		
		let pattern = /jpg|png|jpeg/i;
		
		if(fileName != "jpg" && fileName != "png" &&  fileName != "bmp" &&  fileName != "jpeg"){ 
			alert('썸네일은 이미지 파일(jpg, png, jpeg, bmp)만 등록 가능합니다.');
			return;
		}

		formData.append("file", file);
		formData.append("buskerNo",paramBuskerNo);
		
		//파일등록 에이작스
		$.ajax({
			type : "post",
			data: formData,
			processData: false,
			contentType: false,
			cache : false,
			url : artistPhotoProfileUpdate,
		}).done(function(){
			$.ajax({
				url : mainAjax,
				dateType : "json",
				data : "buskerNo="+buskerNo
			}).done(map => {
				const photo = map.busker.photo;
				$(".side_photo_img").attr("src", fileDownload+photo);
			})		
		})
	});
});
