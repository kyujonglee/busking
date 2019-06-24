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
<title>쪽지함</title>
</head>
<body>
    <div class="message_title">
    	<i class="fas fa-comments"></i>
    	<a></a>
    </div>

	<div role="tabpanel" class="post_box_wrapper">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist" id="post_box">
			<li role="presentation" <c:if test="${param.active ne 'sent_box'}">class="active"</c:if>>
				<a href="#received_box"	aria-controls="received_box" role="tab" data-toggle="tab" class="received_msg_box">받은 쪽지함</a>
			</li>
			<li role="presentation">
				<a href="#sent_box"	aria-controls="sent_box" role="tab" data-toggle="tab" class="sent_msg_box">보낸 쪽지함</a>
			</li>
<!-- 			<li role="presentation"> -->
<!-- 				<a href="#saved_box" aria-controls="saved_box" role="tab" data-toggle="tab">쪽지 보관함</a> -->
<!-- 			</li> -->
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="received_box">
				<table class="table table-striped .table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" class="post_all"></th>
							<th></th>
							<th>제목</th>
							<th>보낸사람</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<form action="delete-received.do" class="delete_received_post_submit">
					<c:forEach var="message" items="${message}">
						<tr>
							<td><input type="checkbox" name="msgNo" value="${message.msgNo}" class="post_all"></td>
							<td></td>	
							<td>
							<c:if test="${message.readStatus eq 'N'}">
								<c:if test="${message.isAgency eq 'y'}">
									<i class="fas fa-envelope"></i>
									<a href="detail.do?msgNo=${message.msgNo}" class="message-agency">${message.title}</a>
								</c:if>
								<c:if test="${message.isAgency ne 'y'}">
									<i class="fas fa-envelope"></i>
									<a href="detail.do?msgNo=${message.msgNo}">${message.title}</a>
								</c:if>
							</c:if>
							<c:if test="${message.readStatus eq 'Y'}">
							<i class="fas fa-envelope-open"></i>
								<a href="detail.do?msgNo=${message.msgNo}">${message.title}</a>
							</c:if>
							</td>
							<c:if test="${message.isAgency ne 'y'}">
								<td>${message.nickName}</td>
							</c:if>
							<c:if test="${message.isAgency eq 'y'}">
								<td class="message-agency">
									<i class="fas fa-award fa-lg message-agency__icon"></i>
									${message.nickName}
								</td>
							</c:if>
							<td><fmt:formatDate value="${message.sendDate}" pattern="yy/MM/dd HH:mm" /></td>
						</tr>
					</c:forEach>
					</form>
					</tbody>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane" id="sent_box">
				<table class="table table-striped .table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" class="post_sent"></th>
							<th></th>
							<th>제목</th>
							<th>받은사람</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<form action="delete-sent.do" class="delete_sent_post_submit">
					<c:forEach var="sentMessage" items="${sentMessage}">
						<tr>
							<td><input type="checkbox" name="msgNo" value="${sentMessage.msgNo}" class="post_sent"></td>
							<td></td>
							<td>${sentMessage.title}</td>
							<td>${sentMessage.nickName}</td>
							<td><fmt:formatDate value="${sentMessage.sendDate}" pattern="yy/MM/dd HH:mm" /></td>
						</tr>
					</c:forEach>
					</form>
					</tbody>
				</table>
			</div>
			
			<div role="tabpanel" class="tab-pane" id="saved_box">
			<br><br><br><div class="notime">공사중...</div><br><br><br>
			<!-- 
				<table class="table table-striped .table-condensed">
					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll"></th>
							<th></th>
							<th>제목</th>
							<th>보낸사람</th>
							<th>날짜</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="message" items="${message}">
						<tr>
							<td><input type="checkbox" name="${message.msgNo}"></td>
							<td></td>
							<td>${message.title}</td>
							<td>${message.senderMemberNo}</td>
							<td><fmt:formatDate value="${message.sendDate}" pattern="yy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		 -->
		</div>
		 
		<div class="post_box_button">
			<div>
<!-- 				<a>보관</a> -->
				<a class="delete_post">삭제</a>
			</div>
			<div>
				<a href="write-form.do" class="write_post">쪽지 쓰기</a>
			</div>
		</div>
	</div>
	

	<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/js/main/header/bootstrap.js'/>"></script>
    <script src="<c:url value='/resources/js/notify.js'/>"></script>
    <script>
	    $('#post_box a').click(function (e) {
	    	$(this).tab('show');
	    	$(".message_title a").text( $(this).text() );
	    	$('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
	    		  e.target // newly activated tab
	    		  e.relatedTarget // previous active tab
    		});
	    });
	    
	    $(document).ready(function () {
	    	$(".message_title a").text( $("li[class=active]").text() );
	    });
	    
	    $(".delete_post").click(function () {
		    if ( $("#post_box").children(".active").children("a").attr("href") == "#received_box" ) {
		    	if ( $("input:checkbox[class=post_all]:checked").length == 0 ) {
		    		alert("삭제할 메시지를 선택하세요.");
		    		return;
		    	}
		    	$(".delete_received_post_submit").submit();
		    }
		    if ( $("#post_box").children(".active").children("a").attr("href") == "#sent_box" ) {
		    	if ( $("input:checkbox[class=post_sent]:checked").length == 0 ) {
		    		alert("삭제할 메시지를 선택하세요.");
		    		return;
		    	}
		    	$(".delete_sent_post_submit").submit();
		    }
	    });
	    
	    
	    $("thead input").click(function(){
	        let chk = $(this).is(":checked");
	        let cls = $(this).attr("class");
	        if(chk) $("." + cls + "").prop('checked', true);
	        else $("." + cls + "").prop('checked', false);
	    });
	    /*
    	let active = "${param.active}";
	    console.log(active);
	    if (active == "sent_box") {
	    	$("#post_box > li:eq(0)").attr("class", "");
	    	$("#post_box > li:eq(1)").attr("class", "active");
	    }
		*/
    </script>
	

</body>
</html>