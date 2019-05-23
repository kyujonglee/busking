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
    	<a href="<c:url value="/popup/message.do"/>"></a>
    </div>

	<div role="tabpanel" class="post_box_wrapper">

		<!-- Nav tabs -->
		<ul class="nav nav-tabs" role="tablist" id="post_box">
			<li role="presentation" class="active"><a href="#received_box"
				aria-controls="home" role="tab" data-toggle="tab">받은 쪽지함</a></li>
			<li role="presentation"><a href="#sent_box"
				aria-controls="profile" role="tab" data-toggle="tab">보낸 쪽지함</a></li>
			<li role="presentation"><a href="#saved_box"
				aria-controls="messages" role="tab" data-toggle="tab">쪽지 보관함</a></li>
		</ul>

		<!-- Tab panes -->
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane active" id="received_box">
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
							<td><input type="checkbox"></td>
							<td></td>
							<td>${message.title}</td>
							<td>${message.senderMemberNo}</td>
							<td><fmt:formatDate value="${message.sendDate}" pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</c:forEach>
						
						<tr>
							<td><input type="checkbox"></td>
							<td>2</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>3</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div role="tabpanel" class="tab-pane" id="sent_box">
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
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>보낸 쪽지 1</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>2</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>3</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div role="tabpanel" class="tab-pane" id="saved_box">
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
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>저장한 쪽지 1</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>2</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
						<tr>
							<td><input type="checkbox"></td>
							<td>3</td>
							<td>데이터2</td>
							<td>데이터3</td>
							<td>데이터4</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

		<div class="post_box_button">
			<div>
				<a>보관</a>
				<a>삭제</a>
			</div>
			<div>
				<a href="write-form.do" class="write_post">쪽지 쓰기</a>
			</div>
		</div>
	</div>
	

	<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="<c:url value='/resources/js/main/header/bootstrap.js'/>"></script> 
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
	    
	    let popupX = (window.screen.width / 2) - (500 / 2) + 50;
		let popupY = (window.screen.height / 2) - (500 / 2) + 50;
    	
    </script>
	

</body>
</html>