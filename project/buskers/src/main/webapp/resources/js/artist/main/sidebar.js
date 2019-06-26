
$.ajax({
	url : mainAjax,
	dateType : "json",
	data : "buskerNo="+paramBuskerNo
}).done(map => {
	const showCount = map.showCount;
	const musicCount = map.musicCount;
	const videoCount = map.videoCount;
	const photoCount = map.photoCount;
	const activityName = map.busker.activityName;
	const intro = map.busker.intro;
	const location = map.busker.location;
	const time = map.busker.time;
	const genre = map.busker.genre;
	const profileImg = map.busker.profileImg;
	const profileImgPath = map.busker.profileImgPath;
	const photo = map.busker.photo;

	$("#showCount").text(showCount);
	$("#musicCount").text(musicCount);
	$("#videoCount").text(videoCount);
	$("#photoCount").text(photoCount);
	$("#activityName").text(activityName);
	$(".busker-info__nickname").text(activityName);
	$("#input_form_intro").text(intro);
	$("#input_form_location").val(location);
	$("#input_form_time").val(time);
	$("#input_form_genre").val(genre);
	
	//사진
	if(photo == ""){
		$(".side_photo_img").attr("src" , defaultPhoto);
	}else{
		$(".side_photo_img").attr("src" , fileDownload+photo);
	}
	
	$(".busker-side__profile-photo").prepend(
	`<img src=`+defaultProfile+`>`		
	)
	if(profileImg != null){
		$(".busker-side__profile-photo img:eq(0)").attr("src",
			fileDownload+profileImgPath+profileImg
		)
	}
	
	//팔로우버튼
	if(map.followStatus == 'y'){
		$(".busker__profile-header-follow").css("background-color","red").html("팔로우");		
	}else{
		$(".busker__profile-header-follow").css("background-color","rgb(243,116,32)").html("팔로우+");		
	}
	
	//url
	const youTubeUrl = map.socialUrl.youTubeUrl;
	const instargramUrl = map.socialUrl.instargramUrl;
	const faceBookUrl = map.socialUrl.faceBookUrl;
	$("#faceBookUrl").val(faceBookUrl);
    $("#youTubeUrl").val(youTubeUrl);
    $("#instargramUrl").val(instargramUrl);

    $("#myButtons1").click(function(){
    	let face = $("#faceBookUrl").val(); 
    	let ytube = $("#youTubeUrl").val();
    	let insta = $("#instargramUrl").val();
    	if(face != ""){
	    	if( face.includes("www.facebook.com") == false){
	    		alert("페이스북 url을 확인해주세요.");
	    		$("#faceBookUrl").val("");
	    		return;
	    	};
    	}
    	if(ytube != ""){
	    	if( ytube.includes("www.youtube.com") == false){
	    		alert("유튜브 url을 확인해주세요.");
	    		$("#youTubeUrl").val("");
	    		return;
	    	};	
    	}
    	if(insta != ""){
	    	if( insta.includes("www.instagram.com") == false){
	    		alert("인스타그램 url을 확인해주세요.");
	    		$("#instargramUrl").val("");
	    		return;
	    	};
    	}

    	$.ajax({
			url : socialInsert,
			data : {faceBookUrl:$("#faceBookUrl").val() 
				   ,youTubeUrl:$("#youTubeUrl").val()
				   ,instargramUrl:$("#instargramUrl").val() 
				   ,buskerNo:paramBuskerNo},
		}).done(function(result){
			$("#faceBookUrl").val(result.faceBookUrl);
		    $("#youTubeUrl").val(result.youTubeUrl);
		    $("#instargramUrl").val(result.instargramUrl);
		});
        	$('#myModal').modal('hide');
    });
});

	
	
//	 	팔로우 기능
$(".busker__profile-header-follow").click(function(){

	if(user == ""){
		Swal.fire({
		  title:'로그인이 필요한 기능입니다.',
		  type:'warning',
		  timer:2000	
	});
		
	}else{
		$.ajax({
			url : followAjax ,
			data : {buskerNo: paramBuskerNo,memberNo:memberNo},
		}).done(function(result){
			if(result == 1){
				Swal.fire({
					  title:'팔로우 성공',
					  type:'success',
					  timer:2000	
				});
				$(".busker__profile-header-follow").css("background-color","red").html("팔로우");	
			}else {
				Swal.fire({
					  title:'팔로우 취소',
					  type:'success',
					  timer:2000	
				});
				$(".busker__profile-header-follow").css("background-color","rgb(243,116,32)").html("팔로우+");		
			}
		});
	}
})
	

	
	
// Edit
$("#myButtons1").click(function(){
let faceBookUrl = $("#faceBookUrl").val();
let youTubeUrl = $("#youTubeUrl").val();
let instargramUrl = $("#instargramUrl").val();
	$.ajax({
		url : "social-url.do",
		data : {faceBookUrl:faceBookUrl , youTubeUrl:youTubeUrl, instargramUrl:instargramUrl ,buskerNo:paramBuskerNo},
	}).done(function(result){
		$("#facebookUrl").val(result.faceBookUrl);
	    $("#youtubeUrl").val(result.youTubeUrl);
	    $("#instargramUrl").val(result.instargramUrl);
	});
	$('#myModal').modal('hide');
});
    
/** 관련 버스커 */
$.ajax({
	url : mainRecommend,
	data : "buskerNo=" + paramBuskerNo
}).done((result) => {
	let html = "";
	for (let i = 0; i < result.length; i++) {
		html += '<div class="buskers__recommend-item">';
		html += '<i class="fas fa-user-friends"></i>' + '<a href="'+artistMain+'?buskerNo=' + result[i].buskerNo + '">' + result[i].activityName + '</a>';
//	 			html += '<i class="fas fa-user-friends"></i>' + '<a href="<c:url value='/artist/main/main.do'/>' + '?buskerNo=' + result[i].buskerNo + '">' + result[i].activityName + '</a>';
		html += '</div>';
	}
	$(".buskers__recommend").html(html);
});

//url
$(".facebook").click(function(){
	if($("#faceBookUrl").val() == ""){
		alert("등록된 url이 없습니다.");
	}else{
    	/* window.location.href = 	$("#faceBookUrl").val(); */
    	window.open($("#faceBookUrl").val());
	}
})
 $(".youtube").click(function(){
	if($("#youTubeUrl").val() == ""){
		alert("등록된 url이 없습니다.");
	}else{
    	/* window.location.href = $("#youTubeUrl").val(); */
		window.open($("#youTubeUrl").val());
	}
})
$(".instargram").click(function(){
	if($("#instargramUrl").val() == ""){
		alert("등록된 url이 없습니다.");
	}else{
    	/* window.location.href = $("#instargramUrl").val(); */
		window.open($("#instargramUrl").val());
	}
})
	
