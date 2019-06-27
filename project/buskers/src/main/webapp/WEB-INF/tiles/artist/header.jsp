<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/resources/css/main/miniprofile.css'/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main/toastr.min.css'/>" />
<header class="busker-header" id="busker-header">
	<div class="busker-header__pagetour">
		<button class="pagetour-btn" type="button" id="tourBtn">
			<i class="fas fa-question-circle"></i>
			<span class="busker-header__pagetour-title">도움말</span>
		</button>
	</div>
	<div class="busker-header__title">
		<img src="/buskers/resources/img/logo.png" />
		<a class="busker_header_logo" href="<c:url value='/main/main.do'/>">Buskers</a>
	</div>
	<div class="busker-header__member">
		<c:if test="${sessionScope.user eq null}">
			<a class="busker-header__id" href="<c:url value='/main/member/loginform.do'/>"> 로그인 </a>
			<i class="fas fa-comment-dots fa-lg" id="chat-icon"></i>
		</c:if>
		<c:if test="${sessionScope.user ne null}">
<%-- 			<span class="busker-header__id"> ${sessionScope.user.nickName}님 </span> --%>
<!-- 			<span class="busker-header__id"> Logout </span> -->
<!-- 			<i class="fas fa-user-circle fa-lg"></i> -->
			<span class="header__user">
				<div class="header-a">
				<i class="far fa-bell fa-lg"><span class="badge badge-pill badge-warning notification alarm_count"></span></i>
				<i class="far fa-envelope fa-lg"><span class="badge badge-pill badge-success notification message_count"></span></i>
				<i class="fas fa-comment-dots fa-lg" id="chat-icon"></i>
					<div class="header-b2">${sessionScope.user.nickName}  님</div>
					<div class="header-b3">
						<div class="header-c">
							<a class="header-d" role="button" 
							   tabindex="0" title="계정: ${sessionScope.user.id}  (${sessionScope.user.email})"
							   aria-expanded="true">
							   <span class="header-e" aria-hidden="true"><img class="profile_img" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" onError="this.src='<c:url value='/resources/img/profile.png' />';"	/></span>
							</a>
							<div class="header-f h-toggle"></div>
							<div class="header-g h-toggle"></div>
						</div>
						<div class="header-h h-toggle" aria-label="계정 정보"
							aria-hidden="false" img-loaded="1">
							<div class="header-i">
								<a class="header-i2" aria-label="프로필 사진 변경" href="<c:url value='/main/member/setting.do'/>">
									<div class="header-i3" style="position: relative">
										<div class="header-i4" title="프로필">
											<img class="miniprofile_img" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}"
												 onError="this.src='<c:url value='/resources/img/profile.png' />';"											
											/>
										</div>
										<span class="header-i5">변경</span>
									</div>
								</a>
								<div class="header-i6">
									<div class="header-i7">${sessionScope.user.id}</div>
									<div class="header-i8">
										${sessionScope.user.email}
									</div>
									<div class="header-i9">
										<span>${sessionScope.user.nickName} 님</span><br>
										<span> 안녕하세요!</span>
									</div>
									<a class="header-i10" href="<c:url value='/main/member/setting.do'/>">개인 설정</a>
								</div>
							</div>
							<div class="header-j">
								<div>
									<a class="header-j2" href="<c:url value='/artist/main/main.do?buskerNo=' />${sessionScope.user.busker.buskerNo}" onclick="return buskerPage();">나의 페이지</a>
								</div>
								<div>
									<a class="header-j3" id="logout" target="_top">로그아웃</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</span>
			<div class="busker_alarm_wrapper">
		        <div class="busker_alarm_title">새로운 소식</div>
		        <div class="busker_alarm_list_wrapper">
			        <div class="busker_alarm_list">
			            
			        </div>
		        </div>
		    </div>
		</c:if>
		
	</div>
</header>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="<c:url value='/resources/js/toastr.min.js'/>"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="<c:url value='/resources/js/toastr.min.js'/>"></script>
<script src="http://${serverip}:10001/socket.io/socket.io.js"></script>
<script>

	/* let buskerNo = ${(sessionScope.user eq null) ? 0 : sessionScope.user.buskerNo}; */

	toastr.options.positionClass = 'toast-top-right';
	toastr.options.closeButton = true;
	
	/** 실시간 알림 */
	const socket = io.connect("http://${serverip}:10001");
	
	if ("${sessionScope.user.nickName}" != "") {
		socket.emit("login", "${sessionScope.user.nickName}");
	}
	
	socket.on("msg", function (data) {
		let sender = data.sender;
		let title = data.title;
		if (title.length > 12) {
			title = title.substring(0, 11) + "...";
		}
		let msg = sender + "  :  " + title;
		
   		$.ajax({
   			type: "POST",
   			url: "/buskers/main/header/message/message-count-ajax.do",
   			success: function (count) {
   				if (count != 0) {
   					$(".message_count").text(count);
   					$(".message_count").show();
   				}
   			}
   		});
   		$(".fa-envelope").css({"animation": "alarm 1.5s linear infinite"});
   		toastr.info(msg, '새 쪽지가 도착했습니다.');
    });
	
	$(".fa-envelope").click(function () {
		$(".fa-envelope").css({"animation": "none"});
	});

	$(".header-c").click(function() {
	    $(".h-toggle").toggle();
	});
	 
	const logout = function() {
		var result = confirm("로그아웃 하시겠습니까?");
		if(result) {

			//구글로그아웃
			$.ajax({
			        type : "POST",
			        dataType : 'text',
			        url : 'https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost/application-name/logoutUser',
			        crossDomain : true,
			        xhrFields : {
			           withCredentials : true
			        }
		    })
		     
			var naverLogin = new naver.LoginWithNaverId(	
					{
						clientId: "SPRQERrB_l9ca0FeJSNq",
						callbackUrl: "http://localhost/buskers/main/member/loginform.do",
						isPopup: false,
						callbackHandle: true,
					}
			);
			naverLogin.init();
			// 네이버 세션 로그아웃 처리
			naverLogin.logout();
			// 네이버 로그아웃처리
			$.ajax({
			        type : "POST",
			        dataType : 'text',
			        url : "http://nid.naver.com/nidlogin.logout",
			        crossDomain : true,
			        xhrFields : {
			           withCredentials : true
			        }
		    })
			location.href="<c:url value='/main/member/logout.do'/>";
			alert("로그아웃 되셨습니다!");
		}
	};
	
	$("#logout").click(logout);
	
	let popupX = (window.screen.width / 2) - (500 / 2);
	let popupY = (window.screen.height / 2) - (500 / 2);
	
	$(".fa-envelope").click(function () {
		window.open('<c:url value="/main/header/message/list.do"/>', '', 'top=' + popupY + ', left=' + popupX + ', scrollbars=no, resizable=no, width=500, height=500');
	});
	const buskerPage = function(){
		if( ${(sessionScope.user.busker eq null) ? 0 : sessionScope.user.busker.buskerNo} !== 0){
			return true;
		}
		alert("현재 회원은 버스커가 아닙니다.")
		return false;
	}
	
	$(document).ready(function () {
		$.ajax({
			type: "POST",
			url: "/buskers/main/header/message/message-count-ajax.do",
			success: function (count) {
				if (count != 0) {
					$(".message_count").text(count);
					$(".message_count").show();
				}
			}
		});
		
		$.ajax({
			type: "POST",
			url: "/buskers/main/header/alarm/alarm-count-ajax.do",
			success: function (count) {
				if (count != 0) {
					$(".alarm_count").text(count);
					$(".alarm_count").show();
				}
			}
		});
	});
	
	let flag = false;
	$(".header__user .fa-bell").click(function () {
		if (flag) {
	        $(".busker_alarm_wrapper").fadeOut();
	        $(this).css({"color": "white"});
	        flag = false;
	    } else {
			$(".busker_alarm_wrapper").fadeIn();
			$(this).css({"color": "black"});
	        flag = true;
	    }
	});
	
	socket.on("show-alarm", function (data) {
		$.ajax({
			type: "POST",
			data: {index : index},
			url: "/buskers/main/header/alarm/alarm-ajax.do",
			success: function (result) {
				console.log("====");
				console.log(result);
				console.log("====");
				
				let alarm = result.alarm;
				let html = "";
				for (let i = 0; i < alarm.length; i++) {
					let nowDate = new Date();
					let time = nowDate - new Date(alarm[i].regDate);
					let gapTime = "";
					if ( (time / (1000*60*60*24)) >= 1 ) {
						gapTime = parseInt(time / (1000*60*60*24)) + "일 전";
					} else {
						if ( (time / (1000*60*60)) > 1 ) {
							gapTime = parseInt(time / (1000*60*60)) + "시간 " + Math.floor((time/(1000*60)) % 60) + "분 전";
						} else {
							gapTime = Math.floor((time/(1000*60)) % 60) + "분 전";
						}
					}
					let type = "";
					let link = "";
					if (alarm[i].dataType == "1") {
						type = "채널에 새로운 공연일정이 등록되었습니다.";
						link = '<a href="<c:url value='/artist/board/detail.do?' />' + 'showNo=' + alarm[i].dataNo + '&buskerNo=' + alarm[i].buskerNo + '&alarmNo=' + alarm[i].alarmNo + '&dataType=1' + '&dataNo=' + alarm[i].dataNo + '">';
					} else {
						type = "채널에 새로운 공지사항이 등록되었습니다.";
						link = '<a href="#">';
					}
					
					if (alarm[i].isRead == 'y') {
						html += '<div class="busker_alarm_card">';
					} else {
						html += '<div class="busker_alarm_card is_not_read">';
					}
					html += link;
					html += 	'<div class="busker_alarm_image_wrapper">';
					html += 		'<div class="busker_alarm_image">';
					html += 		'<img src="<c:url value='/file/download.do'/>?path=' + alarm[i].profileImgPath + alarm[i].profileImg + '"/>';
					html += 		'</div>';
					html += 	'</div>';
					html += 	'<div class="busker_alarm_body">';
					html += 		'<div class="busker_alarm_body_header">' + alarm[i].activityName + '<span>&nbsp' + type + '</span></div>';
					html += 		'<div class="busker_alarm_body_title">' + alarm[i].title + '</div>';
					html += 		'<div class="busker_alarm_body_date">' + gapTime + '</div>';
					html += 	'</div>';
					html += '</a>';
					html += '</div>'; 
				}
				$(".busker_alarm_list").html(html);
			
				$(".busker_alarm_list_wrapper").scroll(function () {
					if ( $(".busker_alarm_list").height() - $(".busker_alarm_list_wrapper").scrollTop() - $(".busker_alarm_list_wrapper").height() <= 0 ) {
						index += 10;
						alarm();
					}
				});
				
				$.ajax({
					type: "POST",
					url: "/buskers/main/header/message/message-count-ajax.do",
					success: function (count) {
						if (count != 0) {
							$(".message_count").text(count);
							$(".message_count").show();
						}
					}
				});
				
				$(".fa-bell").css({"animation": "bell 2s infinite linear"});
				$(".fa-bell").css({"color": "tomato"});
		   		toastr.warning('새로운 공연일정 소식이 있습니다.', data + " 채널 알림");
			}
		});
	});
	
	$.ajax({
		type: "POST",
		url: "/buskers/main/header/alarm/alarm-ajax.do",
		success: function (result) {
			let alarm = result.alarm;
			
			if(alarm.length === 0) return;
			
			let html = "";
			for (let i = 0; i < alarm.length; i++) {
				let nowDate = new Date();
				let time = nowDate - new Date(alarm[i].regDate);
				let gapTime = "";
				if ( (time / (1000*60)) >= 3600 ) {
					gapTime = parseInt(time / (1000*60*60*24)) + "일 전";
				} else {
					if ( (time / (1000*60*60)) > 1 ) {
						gapTime = parseInt(time / (1000*60*60)) + "시간 " + parseInt((time/1000*60*60) % 60) + "분 전";
					} else {
						gapTime = parseInt((time/1000*60*60) % 60) + "분 전";
					}
				}
				let type = "";
				if (alarm[i].dataType == "1") {
					type = "채널에 새로운 공연일정이 등록되었습니다.";
				} else {
					type = "채널에 새로운 공지사항이 등록되었습니다.";
				}
				html += '<div class="busker_alarm_card">';
				html += 	'<div class="busker_alarm_image_wrapper">';
				html += 		'<div class="busker_alarm_image">';
				html += 		'<img src="<c:url value='/file/download.do'/>?path=' + alarm[i].profileImgPath + alarm[i].profileImg + '"/>';
				html += 		'</div>';
				html += 	'</div>';
				html += 	'<div class="busker_alarm_body">';
				html += 		'<div class="busker_alarm_body_header">' + alarm[i].activityName + '<span>&nbsp' + type + '</span></div>';
				html += 		'<div class="busker_alarm_body_title">' + alarm[i].title + '</div>';
				html += 		'<div class="busker_alarm_body_date">' + gapTime + '</div>';
				html += 	'</div>';
				html += '</div>';
			}
			$(".busker_alarm_list").append(html);
		}
	});
	
	$(".busker_alarm_list").scroll(function () {
		console.log( "전체 길이 : " + $(".busker_alarm_wrapper").height() );
		console.log( "스크롤의 위치 : " + $(".busker_alarm_list").scrollTop() );
		console.log( "스크롤 있는 곳의 길이 : " + $(".busker_alarm_list").height() );
		
	});
	let index = 0;
	
	function alarm() {
		console.log("인덱스:"+index);
		$.ajax({
			type: "POST",
			url: "/buskers/main/header/alarm/alarm-ajax.do",
			data: {index : index},
			success: function (result) {
				
				let alarm = result.alarm;
				let html = "";
				for (let i = 0; i < alarm.length; i++) {
					let nowDate = new Date();
					let time = nowDate - new Date(alarm[i].regDate);
					let gapTime = "";
					if ( (time / (1000*60*60*24)) >= 1 ) {
						gapTime = parseInt(time / (1000*60*60*24)) + "일 전";
					} else {
						if ( (time / (1000*60*60)) > 1 ) {
							gapTime = parseInt(time / (1000*60*60)) + "시간 " + Math.floor((time/(1000*60)) % 60) + "분 전";
							console.log((time/(1000*60)));
							console.log("시간차이 : " + (time/1000*60) % 60);
							console.log("시간차이 버림 : " + Math.floor((time/1000*60) % 60));
						} else {
							gapTime = Math.floor((time/(1000*60)) % 60) + "분 전";
						}
					}
					let type = "";
					let link = "";
					if (alarm[i].dataType == "1") {
						type = "채널에 새로운 공연일정이 등록되었습니다.";
						link = '<a href="<c:url value='/artist/board/detail.do?' />' + 'showNo=' + alarm[i].dataNo + '&buskerNo=' + alarm[i].buskerNo + '&alarmNo=' + alarm[i].alarmNo + '&dataType=1' + '&dataNo=' + alarm[i].dataNo + '">';
					} else {
						type = "채널에 새로운 공지사항이 등록되었습니다.";
						link = '<a href="#">';
					}
					
					if (alarm[i].isRead == 'y') {
						html += '<div class="busker_alarm_card">';
					} else {
						html += '<div class="busker_alarm_card is_not_read">';
					}
					html += link;
					html += 	'<div class="busker_alarm_image_wrapper">';
					html += 		'<div class="busker_alarm_image">';
					html += 		'<img src="<c:url value='/file/download.do'/>?path=' + alarm[i].profileImgPath + alarm[i].profileImg + '"/>';
					html += 		'</div>';
					html += 	'</div>';
					html += 	'<div class="busker_alarm_body">';
					html += 		'<div class="busker_alarm_body_header">' + alarm[i].activityName + '<span>&nbsp' + type + '</span></div>';
					html += 		'<div class="busker_alarm_body_title">' + alarm[i].title + '</div>';
					html += 		'<div class="busker_alarm_body_date">' + gapTime + '</div>';
					html += 	'</div>';
					html += '</a>';
					html += '</div>'; 
				}
				$(".busker_alarm_list").append(html);
			}
		});
	}
	alarm();
	
	$(".busker_alarm_list_wrapper").scroll(function () {
		if ( $(".busker_alarm_list").height() - $(".busker_alarm_list_wrapper").scrollTop() - $(".busker_alarm_list_wrapper").height() <= 0 ) {
			index += 10;
			alarm();
		}
	});
	
	$(".fa-bell").click(function () {
		$(this).css({"animation": "none"});
	});
</script>