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
		<input type="text" class="form-control" name="nickName" placeholder="닉네임을 입력하세요">
		<br>
		<div>제목</div>
		<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요">
		<br>
		<div>내용</div>
		<textarea class="form-control" rows="10" name="content" placeholder="내용을 입력하세요"></textarea>
		
		<div class="post_write_form_button">
			<div>
				<a href="write-form.do">취소</a>
			</div>
			<div>
				<a class="write_form_submit">작성완료</a>
			</div>
		</div>
	</form>
	

<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/main/header/bootstrap.js'/>"></script> 

<script>
	$(".write_form_submit").click(function () {
		$(".write_form_submit_wrapper").submit();
	});
</script>

</body>
</html>