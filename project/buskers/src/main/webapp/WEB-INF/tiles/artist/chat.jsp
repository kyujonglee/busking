<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Pen+Script&display=swap" rel="stylesheet">
	
<aside class="busker-chat">

	<div id="frame">
		<div id="sidepanel">
			<div id="search">
				<label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
				<input type="text" placeholder="검색할 닉네임을 입력하세요." />
			</div>
			<div id="contacts">
				<ul>
				</ul>
			</div>
			<div class="online_user">
				<img src="<c:url value='/resources/img/online3.png'/>"/>
				<p>접속중인 회원 : 0명</p>
			</div>
			<div id="bottom-bar">
				<button id="addcontact"><i class="fa fa-user-plus fa-fw" aria-hidden="true"></i> <span>친구 추가</span></button>
				<button id="settings"><i class="fa fa-cog fa-fw" aria-hidden="true"></i> <span>설정</span></button>
			</div>
		</div>
		
		<div class="content">
			<div class="chatting_room_info">
				<i class="fas fa-bars"></i>
				<span class="chatting_room_busker_profile_img"></span>
				<p>
					<span class="chatting_room_busker_activity_name"></span> 채널 채팅방
				</p>
				<div class="opacity_slider"></div>
			</div> 
			
			<div class="messages">
				<ul>
				</ul>
			</div>
			
			<div class="message-input">
				<div class="wrap">
				<input type="text" placeholder="메세지를 입력하세요..." />
				<button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</div>
			</div>
		</div>
	</div>
</aside>
<script src="http://${serverip}:10001/socket.io/socket.io.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	
	const chat = io("http://${serverip}:10001/chat");
	
	let color = "#" + Math.round(Math.random() * 0xffffff).toString(16);
	let roomId = "${param.buskerNo}";
	
	if ("${sessionScope.user.nickName}" != "") {
		chat.emit('joinRoom', roomId);
		
		chat.emit(
			"join", 
			{
	            nickName: "${sessionScope.user.nickName}",
	            profile: "${sessionScope.user.profileImgPath}" + "${sessionScope.user.profileImg}",
	            roomId : roomId
        	}
		);
		chat.emit("in", "${sessionScope.user.nickName}");
	}
	
	chat.on("join", function (members) {
		let count = members.length;
		console.log(members);
		let html = "";
		for(let i = 0; i < members.length; i++) {
			if (members[i].roomId == roomId) {
				html += "<li class='contact'>";
				html += 	"<div class='wrap'>";
				html +=			'<img src="<c:url value='/file/download.do'/>?path=' + members[i].profile + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` +'"/>';
				html +=			"<div class='meta'>";
				html +=				"<p class='name'>" + members[i].nickName + "</p>";
				html +=			"</div>";
				html += 	"</div>";
				html += "</li>";
			}
		}
		$("#contacts > ul").html(html);
		$(".online_user p").text("접속중인 회원 : " + count + "명");
		
		$(".contact").click(function () {
			$(".message-input .wrap input").val( "@" + ($(this).children(".wrap").children(".meta").children(".name").text()) + " " );
			$(".message-input .wrap input").focus();
		});
    });
	
	chat.on("out", function (member) {
		let html = "";
		
		html += "<li class='out'>";
		html += "----- " + member + " 님이 퇴장하셨습니다." + " -----";
		html += "</li>";
		
		$(".messages > ul").append(html);
		$(".messages").animate({ scrollTop: $(".messages")[0].scrollHeight }, "fast");
    });
	
	chat.on("chat", function (data) {
		let html = "";
		
		html += "<li class='received'>";
		html +=		"<span style='color:" + data.color + ";'><i class='fas fa-circle'></i>" + data.sender + "<time>" + data.date + "</time></span>";
		html +=		"<div>";
		html +=	'<img src="<c:url value='/file/download.do'/>?path=' + data.image + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` + '"/>';
		html +=			"<p>" + data.content + "</p>";
		html +=		"</div>";
		html += "</li>";
		
        $(".messages > ul").append(html);
        $(".messages").animate({ scrollTop: $(".messages")[0].scrollHeight }, "fast");
    });
	
    chat.on("whisper", function (data) {
		let html = "";
		
		html += "<li class='whisper'>";
		html +=		"<span style='color:" + data.color + ";'><i class='fas fa-circle'></i>" + data.sender + "<b>" + " 님의 귓속말" + "</b>" + "<time>" + data.date + "</time></span>";
		html +=		"<div>";
		html +=			'<img src="<c:url value='/file/download.do'/>?path=' + data.image + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` +'"/>';
		html +=			"<p>" + data.content + "</p>";
		html +=		"</div>";
		html += "</li>";
		
        $(".messages > ul").append(html);
        $(".messages").animate({ scrollTop: $(".messages")[0].scrollHeight }, "fast");
        if ( $(".fa-comment-dots").attr("class") == "fas fa-comment-dots fa-lg" ) {
        	$(".fa-comment-dots").css({"animation": "whisper 1.5s linear infinite"});
        }        
    });
    
   	$(".fa-comment-dots").click(function () {
   		$(".fa-comment-dots").css({"animation": "none"});
   	});
	
    chat.on("in", function (member) {
   		let html = "";
   		
   		html += "<li class='in'>";
   		html += "----- " + member + " 님이 입장하셨습니다." + " -----";
   		html += "</li>";
   		
   		$(".messages > ul").append(html);
   		$(".messages").animate({ scrollTop: $(".messages")[0].scrollHeight }, "fast");
   	});
	
	$(".submit").click(function () {
		if ("${sessionScope.user.nickName}" == "") {
			return;
		}
		if ( $.trim( $(".message-input input").val() ) == "" ) {
			return;
		}
		
		let content = $(".message-input input").val();
		let receiver = "";
		if ( $(".message-input input").val().startsWith("@") ) {
			if ( $(".message-input input").val().indexOf(" ") == -1) {
				return;
			}
			receiver = $(".message-input input").val().substring(1, $(".message-input input").val().indexOf(" "));
			if ( receiver.includes("@") ) {
				return;
			}
			content = $(".message-input input").val().substring( $(".message-input input").val().indexOf(" ") + 1 );
			if ( $.trim(content) == "" ) {
				return;
			}
			console.log($(".message-input input").val().substring($(".message-input input").val().indexOf(" ") + 1));
		}
		
		let date = new Date();
		let hour = "";
		if (date.getHours() >= 12) {
			if (date.getHours() >= 13) {
				hour = "오후 " + (date.getHours() - 12);
			} else {
				hour = "오후 " + (date.getHours());
			}
		} else {
			hour = "오전" + date.getHours();
		}
		let minutes = date.getMinutes();
		if (parseInt(minutes) < 10) {
			minutes = "0" + minutes;
		}
		let html = "";
		
		html += "<li class='sent'>";
		html +=		"<span><i class='fas fa-circle'></i>" + "${sessionScope.user.nickName}" + "<time>" + hour + ":" + minutes + "</time></span>";
		html +=		"<div>";
		html +=			'<img src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}"' + ` onError="this.src='<c:url value='/resources/img/profile.png' />';"` +'"/>';
		if ($(".message-input input").val().startsWith("@")) {
			html +=	"<p>" + "<b>" + "@" + receiver + " </b>" + "<c>" + content + " </c>" + "</p>";
		} else {
			html +=	"<p>" + content + "</p>";
		}
		html +=		"</div>";
		html += "</li>";
		
        $(".messages > ul").append(html);
        
        chat.emit(
   	        "chat", 
   	        {
   	        	/*
   	        	channel: 
   	        	*/
   	        	receiver: receiver,
   	            sender: "${sessionScope.user.nickName}",
   	            content: content,
   	            date: hour + " : " + minutes,
   	            color: color
   	        }
   		);
        $(".messages").animate({ scrollTop: $(".messages")[0].scrollHeight }, "fast");
        if ($(".message-input input").val().startsWith("@")) {
        	$(".message-input input").val( $(".message-input input").val().substring(0, $(".message-input input").val().indexOf(" ")) + " " );
        } else {
	        $(".message-input input").val("");
        }
	});
	
	$(".wrap input").keydown(function (key) {
        if (key.keyCode == 13) {
            $(".submit").click();
        }
    });
	
	$(".fa-bars").click(function () {
		$("#sidepanel").fadeToggle();
	});
	
	$('.opacity_slider').slider ({
		min : 0.2,
		max : 1,
		value : 1,
		step : 0.025,
		orientation: "horizontal",
		range: "min",
		animate: true,
		slide : function ( event, ui ) {
			$('#frame').css( 'opacity', ui.value );
		}
	});
	
	let chatBuskerNo = "${param.buskerNo}";
	
	$.ajax({
		type: "POST",
		url: "/buskers/artist/main/chat-ajax.do",
		data: {buskerNo : chatBuskerNo},
		success: function (result) {
			console.log(result);
			$(".chatting_room_busker_activity_name").text(result.activityName);
			$(".chatting_room_busker_profile_img").html('<img src="<c:url value='/file/download.do'/>?path=' + result.profileImgPath + result.profileImg + '"/>');
		}
	});
	
</script>