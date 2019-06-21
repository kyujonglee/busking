<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/header/header.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/message.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Noto+Sans+KR&display=swap" rel="stylesheet">
<title>쪽지 쓰기</title>
</head>
<body>
	<div class="message_title">
		<i class="fas fa-comments"></i> <a>쪽지 쓰기</a>
	</div>
	<form class="write_form_submit_wrapper" action="write.do">
		<div>받는 사람</div>
		<input type="hidden" class="form-control" name="senderMemberNo" value="${sessionScope.user.memberNo}" placeholder="닉네임을 입력하세요">
		<div class="message__nickname">
			<input type="text" id="nickName" class="form-control" name="nickName" placeholder="닉네임을 입력하세요"></input>
			<i class="fas fa-times confirm-nickname-icon-x"></i>
			<i class="fas fa-check confirm-nickname-icon-o"></i>
		</div>
		<br>
		<div>제목</div>
		<input type="text" class="form-control" name="title" id="message_title" placeholder="제목을 입력하세요">
		<br>
		<div>내용</div>
		<textarea class="form-control" rows="10" name="content" id="message_content" placeholder="내용을 입력하세요"></textarea>
		
		<div class="post_bottom_button">
			<div>
				<a href="list.do">취소</a>
				<a class="write_form_submit">작성완료</a>
			</div>
		</div>
	</form>
	

<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/main/header/bootstrap.js'/>"></script> 
<script src="http://${serverip}:10001/socket.io/socket.io.js"></script>

<script>
	
// 	$("#nickName").val("${param.nickName}");

	let confirm = 0;
	$("#nickName").blur(function(){
		let nickName = $("#nickName").val();
		let input = $("#nickName");					//input 변수로설정
		$.ajax({
			type:"POST",
			data: {nickName:nickName},
			url:"receive-member-ajax.do",
		}).done(function (result) {
			if(result == 1) {
				$(input).removeClass("input-nickName");
				$(".confirm-nickname-icon-x").hide();
				$(".confirm-nickname-icon-o").show();
				confirm = 1;
			}else{
				$(input).addClass("input-nickName");
				$(".confirm-nickname-icon-o").hide();
				$(".confirm-nickname-icon-x").show();
				confirm = 0;
			}
			if(nickName==""){
				$(".confirm-nickname-icon-x").hide();
			}
		})
	})

	
	
	
	
	$(".write_form_submit").click(function () {
		if(confirm == '0'){
			alert("받는 사람의 닉네임을 확인해주세요.");
			return;
		}
		let title = $("#message_title").val();
		let content = $("#message_content").val();
		if(title == "" || content == ""){
			alert("제목 또는 내용을 입력해주세요");
			return;
		}
		if(title.length > 40){
			alert("제목은 40자 미만으로 입력해주세요.");
			return;
		}
		if(content.length> 1000){
			alert("내용은 1000자 미만으로 입력해주세요.");
			return;
		}
		
		
		$('textarea').val().replace(/\n/g, "<br>")

		$(".write_form_submit_wrapper").submit();
		
		const socket = io.connect("http://${serverip}:10001");
		
		socket.emit(
	        "msg", 
	        {
	        	receiver: $("input[name=nickName]").val(),
	            sender: "${sessionScope.user.nickName}",
	            title: $("input[name=title]").val()
	        }
		);
	});
	
	
	
	

</script>

</body>
</html>