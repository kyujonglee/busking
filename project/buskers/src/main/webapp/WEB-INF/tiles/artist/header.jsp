<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value='/resources/css/main/miniprofile.css'/>" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main/toastr.min.css'/>" />
<header class="busker-header">
	<div class="busker-header__search">
		<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
			viewBox="0 0 24 24">
              <path
				d="M21.172 24l-7.387-7.387c-1.388.874-3.024 1.387-4.785 1.387-4.971 0-9-4.029-9-9s4.029-9 9-9 9 4.029 9 9c0 1.761-.514 3.398-1.387 4.785l7.387 7.387-2.828 2.828zm-12.172-8c3.859 0 7-3.14 7-7s-3.141-7-7-7-7 3.14-7 7 3.141 7 7 7z" />
            </svg>
		<input class="busker-header__search-input" type="text" />
	</div>
	<div class="busker-header__title">
		<a href="<c:url value='/main/main.do'/>">
		<i class="fas fa-home"></i> Buskers
		</a>
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
				<i class="far fa-bell fa-lg"></i>
				<i class="far fa-envelope fa-lg"><span class="message_count"></span></i>
				<i class="far fa-comment-dots fa-lg" id="chat-icon"></i>
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
								<a class="header-i2" aria-label="프로필 사진 변경" href="#">
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
									<a class="header-i10" href="<c:url value='/main/member/profile.do'/>">프로필 설정</a>
								</div>
							</div>
							<div class="header-j">
								<div>
									<a class="header-j2" href="#">나의 페이지</a>
								</div>
								<div>
									<a class="header-j3" id="logout" target="_top">로그아웃</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</span>
		</c:if>
		
	</div>
</header>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="<c:url value='/resources/js/toastr.min.js'/>"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src="<c:url value='/resources/js/toastr.min.js'/>"></script>
<script src="http://localhost:10001/socket.io/socket.io.js"></script>
<script>

	toastr.options.positionClass = 'toast-bottom-right';
	toastr.options.closeButton = true;
	
	/** 실시간 알림 */
	const socket = io.connect("http://localhost:10001");
	
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
	});

	$(".header-c").click(function() {
	    $(".h-toggle").toggle();
	});
	 
	$("#logout").click(function() {
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
	});
	
	let popupX = (window.screen.width / 2) - (500 / 2);
	let popupY = (window.screen.height / 2) - (500 / 2);
	
	$(".fa-envelope").click(function () {
		window.open('<c:url value="/main/header/message/list.do"/>', '', 'top=' + popupY + ', left=' + popupX + ', scrollbars=no, resizable=no, width=500, height=500');
	});
</script>