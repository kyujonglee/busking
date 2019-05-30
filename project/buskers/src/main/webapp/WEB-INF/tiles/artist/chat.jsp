<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css'>
<link rel='stylesheet prefetch' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.2/css/font-awesome.min.css'>
	
<aside class="busker-chat">
	<div id="frame">
		<div class="content">
			<div class="contact-profile">
				<img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
				<p>Harvey Specter</p>
				<div class="social-media">
					<i class="fa fa-facebook" aria-hidden="true"></i>
					<i class="fa fa-twitter" aria-hidden="true"></i>
					 <i class="fa fa-instagram" aria-hidden="true"></i>
				</div>
			</div>
			
			<div class="messages">
				<ul>
				</ul>
			</div>
			
			<div class="message-input">
				<div class="wrap">
				<input type="text" placeholder="Write your message..." />
				<button class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
				</div>
			</div>
		</div>
	</div>
</aside>
<script src="http://localhost:10001/socket.io/socket.io.js"></script>
<script>
	
	const socket = io.connect("http://localhost:10001");
	let color = "#" + Math.round(Math.random() * 0xffffff).toString(16);
	
	socket.on("chat", function (data) {
		let html = "";
		
		html += "<li class='received'>";
		html +=		"<span style='color:" + data.color + ";'><i class='fas fa-circle'></i>" + data.sender + "<time>" + data.date + "</time></span>";
		html +=		"<div>";
		html +=			"<p>" + data.content + "</p>";
		html +=		"</div>";
		html += "</li>";
		
        $(".messages > ul").append(html);
        $(".messages").animate({ scrollTop: $(document).height() }, "fast");
    });
	
	$(".submit").click(function () {
		if ($(".message-input input").val() == "") {
			return;
		}
		let date = new Date();
		let hour = date.getHours();
		let minutes = date.getMinutes();
		if (parseInt(minutes) < 10) {
			minutes = "0" + minutes;
		}
		
		let html = "";
		
		html += "<li class='sent'>";
		html +=		"<span><i class='fas fa-circle'></i>" + "${sessionScope.user.nickName}" + "<time>" + hour + " : " + minutes + "</time></span>";
		html +=		"<div>";
		html +=			"<p>" + $(".message-input input").val() + "</p>";
		html +=		"</div>";
		html += "</li>";
		
        $(".messages > ul").append(html);
        
        socket.emit(
   	        "chat", 
   	        {
   	        	/*
   	        	channel: 
   	        	*/
   	            sender: "${sessionScope.user.nickName}",
   	            content: $(".message-input input").val(),
   	            date: hour + " : " + minutes,
   	            color: color
   	        }
   		);
        $(".messages").animate({ scrollTop: $(document).height() }, "fast");
        $(".message-input input").val("");
	});
	
	$(window).on('keydown', function(e) {
		if (e.which == 13) {
			newMessage();
			return false;
		}
	});
</script>