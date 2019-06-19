<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/header/header.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/message.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Pen+Script|Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<title>쪽지 상세</title>
</head>
<body>
	<div class="message_title">
		<i class="fas fa-comments"></i> <a>쪽지 상세</a>
	</div>
	<div class="message_detail">
		<br>
		<span>제목</span><a> ${message.title}</a>
		<br><br>
		<span>보낸 사람 </span>
		<c:if test="${message.isAgency ne 'y'}">
			<a>${message.nickName}</a>
		</c:if>
		<c:if test="${message.isAgency eq 'y'}">
			<a class="message-agency">
				<i class="fas fa-award message-agency__icon"></i>
				${message.nickName}
			</a>
		</c:if>
		<span>날짜 </span><a><fmt:formatDate value="${message.sendDate}" pattern="yy/MM/dd HH:mm" /></a>
		<br>
		<hr>
		<span>내용</span>
		<br>
		<textarea id="message_detail_content" class="form-control" rows="10" readonly="readonly" disabled></textarea>
		
		<div class="post_bottom_button">
			<div>
				<a href="list.do">목록</a>
			</div>
		</div>
	</div>
	

<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/main/header/bootstrap.js'/>"></script> 

<script>
	const isAgency = ${ (message.isAgency eq 'n') ? false : true };
	const content = "${message.content}";
	<c:if test="${message.isAgency eq 'y'}">
		const agencyName = "${message.agencyName}";
		const email = "${message.email}";
		const phone = "${message.phone}";
		const basicAddr = "${message.basicAddr}";
		const detailAddr = "${message.detailAddr}";
	</c:if>
</script>
<script src="<c:url value='/resources/js/main/header/message-detail.js'/>"></script>
</body>
</html>