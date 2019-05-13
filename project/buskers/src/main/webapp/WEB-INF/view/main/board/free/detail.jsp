<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/test.css'/>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<title>buskers</title>
</head>
<body class="body-background">
	<div class="main-form">
		<%@ include file="../../../include/sidebar.jsp" %>
		<div class="main-body">
			<header class="header">
				<div class="board_container">
					<div class="header-columns">
						<i class="fas fa-search fa-lg"></i> <input type="text"
							placeholder="search" />
					</div>
					<div class="header-columns">
						<span class="header__title">Buskers</span>
					</div>
					<div class="header-columns">
						<span class="header__user"> <i class="fas fa-crown fa-lg"></i>
							kyujong93 님
						</span> <i class="fas fa-angle-down "></i> <i class="fas fa-bell fa-lg"></i>
						<i class="fas fa-cog fa-lg"></i>
					</div>
				</div>
			</header>
			<main class="main-freeboard">
			<div class="agency">
            <div class="board_title">
                <div class="board_title_underline">
                    <a href="<c:url value='/main/board/free/list.do'/>">자유게시판</a>
                </div>
            </div>

            <div class="board_head_line">
                <span class="board_img_title">
                	<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
                </span>
   				<c:out value="${board.title}" />
            </div>
            
            
            <div class="board_article">
                <div class="board_article_info">
                    <div class="board_article_info_left">
                        <i class="fas fa-user"></i><span id="board_article_info_id"><c:out value="${board.nickName}" /></span>
                        <i class="far fa-eye"></i><span><c:out value="${board.viewCnt}" /></span>
                        <i class="fas fa-heart"></i><span><c:out value="${board.likeCnt}" /></span>
                    </div>

                    <div class="board_article_info_right">
                        <i class="fas fa-clock"></i>
                        <span><fmt:formatDate value="${board.regDate}" pattern="MM-dd HH:mm" /></span>
                    </div>
                </div>
                
                <div class="board_article_content">
                	<div>
	                	${board.content}
                	</div>
                	
                </div>
                
               	<div class="board_article_like">
               		<div class="board_article_like_wrapper">
	               		<i class="far fa-heart fa-2x"></i>
	               		<a>추천</a>
               		</div>
               	</div>
                
                <div class="board_article_comment">
                	<div class="board_article_comment_amount">
	                	<div class="board_article_comment_amount_underline">
	                		<i class="fas fa-comment-dots"></i>
	                		<span><b class="comment_highlight">${fn:length(comment) + fn:length(reply)}</b>개의 댓글</span>
	                	</div>
	                	
                	</div>
                	
                	<div class="board_article_comment_list">
                	
	                	<c:forEach var="comment" items="${comment}">
			                	<div class="comment_list">
			               			<div class="comment_info">
			                			<span class="board_img_title">
						                	<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
						                </span>
			               				<div class="comment_id">${comment.nickName}</div>
			               				<div class="comment_date">
				               				<i class="far fa-clock comment_clock"></i>
				               				<fmt:formatDate value="${comment.regDate}" pattern="MM-dd HH:mm:ss" />
			               				</div>
			               				<div class="comment_update_button"><i class="fas fa-pen-alt"></i></div>
			               				<div class="comment_delete_button"><i class="far fa-trash-alt"></i></div>
			               				<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>
			               			</div>
					                
			               			<div class="bubble"><p>${comment.content}</p></div>
			               			<div class="reply_wrapper">
				               			<div class="reply_content_wrapper">
						           			<textarea class="reply_content" name="content"></textarea>
					           			</div>
					           			<div class="reply_submit_button" name="${comment.commentNo}">
						           			<a class="far fa-edit"> 답글 등록</a>
					           			</div>
				           			</div>
			               		</div>
		                	<c:forEach var="reply" items="${reply}">
		                		<c:if test="${reply.replyNo eq comment.commentNo}">
			                		<div class="reply_list">
				               			<div class="comment_info">
				                			<span class="board_img_title">
							                	<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
							                </span>
				               				<div class="comment_id">${reply.nickName}</div>
				               				<div class="comment_date">
					               				<i class="far fa-clock comment_clock"></i>
					               				<fmt:formatDate value="${reply.regDate}" pattern="MM-dd HH:mm:ss" />
				               				</div>
				               				<div class="comment_update_button"><i class="fas fa-pen-alt"></i></div>
				               				<div class="comment_delete_button"><i class="far fa-trash-alt"></i></div>
				               			</div>
						                
				               			<div class="bubble"><p>${reply.content}</p></div>
				               		</div>
		                		</c:if>
		               		</c:forEach>
						</c:forEach>
					
					</div>
                </div>
                
                <br><br><br>
                
                <div class="comment_write_form">
           			<div class="board_article_comment_amount_underline">
                		<i class="fas fa-feather"></i><span> 댓글 작성</span>
                	</div>
                	
                	<div class="comment_write_info">
                		<c:if test="${sessionScope.user eq null}">
                			<span class="board_img_title">	
                				<img src="<c:url value='/resources/img/profile.png'/>"/>
               				</span>
               				<a class="comment_id" id="go_login_form" href="<c:url value='/main/member/loginform.do'/>">로그인이 필요합니다.</a>
	          			</c:if>
	          			<c:if test="${sessionScope.user ne null}">
		          			<span class="board_img_title">
		              			<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
		           			</span>
		       				<div class="comment_id">${sessionScope.user.nickName}</div>
	           			</c:if>
       				</div>
           			
           			
           			<div class="comment_content_wrapper">
	           			<textarea class="comment_content" name="content"></textarea>
	           			
           			</div>
           			<div class="comment_submit_button">
	           			<a class="far fa-edit"> 댓글 등록</a>
           			</div>
                </div>
                
            </div>
            
            <br><br><br>
        
        	<div class="free_board_detail_bottom">
                <a href="<c:url value='/main/board/free/list.do?pageNo=${param.pageNo}&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}'/>" class="fas fa-list-ul"> 목록</a>
            </div>

            <br><br><br>
				</div>
			</main>
         	   <div class="footer"></div>
		</div>
	</div>
	
	<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
	
	<script>
		let user = "${sessionScope.user}";
		let like = "${like.likeStatus}";
		let nickName = "${sessionScope.user.nickName}";
	
		$(document).ready(function () {
			$(".reply_wrapper").hide();
		});
		
		$(".comment_delete_button").click(function () {
			let commentNo = $(this).parent().siblings(".reply_wrapper").children(".reply_submit_button").attr("name");
			if ( nickName != $(this).siblings(".comment_id").text() ) {
				alert("삭제할 수 없습니다.");
				return;
			}
			
			if ( nickName == $(this).siblings(".comment_id").text() ) {
				$.ajax({
	   				type: "POST",
	   				url: "delete-comment-ajax.do",
	   				data: 
	   					{
	   					commentNo : commentNo
	   					},
	   				success: function (result) {
	   					for (let i = 0; i < $(".bubble").length; i++) {
	   						let width = $(".bubble:eq(" + i + ") > p").width();
	   						if (width < 600) {
	   						$(".bubble:eq(" + i + ")").css({"width": width});
	   						}
	   					}
	   					if (result == "y") {
	   						$(".reply_submit_button[name=" + commentNo + "]").parent().siblings(".bubble").children("p").text("*");
	   						for (let i = 0; i < $(".bubble").length; i++) {
	   							let width = $(".bubble:eq(" + i + ") > p").width();
	   							if (width < 600) {
	   							$(".bubble:eq(" + i + ")").css({"width": width});
	   							}
	   						}
	   						return;
	   					} else {
	   						$(".reply_submit_button[name=" + commentNo + "]").parent().parent().remove();
	   		  				$(".comment_highlight").text( parseInt( $(".comment_highlight").text() ) - 1 );
	   					}
	   				}
				});
				
			}
		});
		
		$(".comment_reply_button").click(function () {
			$(this).parent().siblings(".reply_wrapper").slideToggle();
		});
		
		
	
		
		if (like == 'y') {
			$(".board_article_like_wrapper").children("i").attr("class", "fas fa-heart fa-2x");
			$(".board_article_like_wrapper").css({"border": "2px solid #FC2E5A"});
		}
	
		let sortType = "${param.sortType}";
		let searchType = "${param.searchType}";
		let input = "${param.input}";
		let pageNo = "${param.pageNo}";
		let boardNo = "${param.boardNo}";
		let memberNo = 2;
		
		/** 동적으로 댓글 div의 width 변경 */
		for (let i = 0; i < $(".bubble").length; i++) {
			let width = $(".bubble:eq(" + i + ") > p").width();
			if (width < 600) {
			$(".bubble:eq(" + i + ")").css({"width": width});
			}
		}
		
		$(".comment_submit_button > a").click(function () {
			let content = $(".comment_content").val();
			if ( $(".comment_content").val() == "" ) {
				alert("댓글 내용을 입력해주세요.")
				return;
			}
			$.ajax({
   				type: "POST",
   				url: "comment-ajax.do",
   				data: 
   					{
   					memberNo : memberNo,
   					boardNo : boardNo,
   					content : content
   					},
   				dataType: "json",
   				success: function (commentResult) {
					let commentList = commentResult.comment;
					let replyList = commentResult.reply;					
					let html = "";
   					for (let i = 0; i < commentList.length; i++) {
   						let comment = commentList[i];
   						let date = moment(comment.regDate).format("MM-DD HH:mm");
   						
                		html += '<div class="comment_list">';
                		html += 	'<div class="comment_info">';
                		html += 		'<span class="board_img_title">';
                		html +=     		'<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>';
               			html +=     	'</span>';
               			html += 		'<div class="comment_id">' + comment.nickName + '</div>';
               			html += 		'<div class="comment_date">';
               			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
           				html += 		'</div>';
           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt"></i></div>';
           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt"></i></div>';
           				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
       					html += 	'</div>';
          				html += 	'<div class="bubble"><p>' + comment.content + '</p></div>';
          				html +=		'<div class="reply_wrapper">';
          				html +=			'<div class="reply_content_wrapper">';
          				html +=				'<textarea class="reply_content" name="content"></textarea>';
          				html +=			'</div>';
          				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '">';
          				html +=				'<a class="far fa-edit"> 답글 등록</a>';
          				html +=			'</div>';
          				html +=		'</div>';
          				html += '</div>';
   						
          				for (let i = 0; i < replyList.length; i++) {
       						let reply = replyList[i];
       						let date = moment(reply.regDate).format("MM-DD HH:mm");
       						
       						if (reply.replyNo == comment.commentNo) {
       							html += '<div class="reply_list">';
                        		html += 	'<div class="comment_info">';
                        		html += 		'<span class="board_img_title">';
                        		html +=     		'<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>';
                       			html +=     	'</span>';
                       			html += 		'<div class="comment_id">' + reply.nickName + '</div>';
                       			html += 		'<div class="comment_date">';
                       			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
                   				html += 		'</div>';
                   				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt"></i></div>';
                   				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt"></i></div>';
               					html += 	'</div>';
                  				html += 	'<div class="bubble"><p>' + reply.content + '</p></div>';
                  				html += '</div>';
       						}
          				}
   					}
   					
   					$(".board_article_comment_list").html(html);
   					
   					/** 동적으로 댓글 div의 width 변경 */
   					for (let i = 0; i < $(".bubble").length; i++) {
   						let width = $(".bubble:eq(" + i + ") > p").width();
   						if (width < 600) {
   						$(".bubble:eq(" + i + ")").css({"width": width});
   						}
   					}
   					
   					$(".reply_wrapper").hide();
   					
   					$(".comment_reply_button").click(function () {
   						$(this).parent().siblings(".reply_wrapper").slideToggle();
   					});
   					
   					$(".comment_highlight").text( parseInt( $(".comment_highlight").text() ) + 1 );
   				}
			});
		});
		
		$(".reply_submit_button").click(function () {
			let content = $(this).siblings().children().val();
			let memberNo = "${sessionScope.user.memberNo}";
			let replyNo = $(this).attr("name");
			
			if ( content == "" ) {
				alert("답글 내용을 입력해주세요.")
				return;
			}
			$.ajax({
   				type: "POST",
   				url: "reply-ajax.do",
   				data: 
   					{
   					replyNo : replyNo,
   					memberNo : memberNo,
   					boardNo : boardNo,
   					content : content
   					},
   				dataType: "json",
   				success: function (replyResult) {
   					console.log(replyResult);
   					let commentList = replyResult.comment;
					let replyList = replyResult.reply;					
					let html = "";
   					for (let i = 0; i < commentList.length; i++) {
   						let comment = commentList[i];
   						let date = moment(comment.regDate).format("MM-DD HH:mm");
   						
                		html += '<div class="comment_list">';
                		html += 	'<div class="comment_info">';
                		html += 		'<span class="board_img_title">';
                		html +=     		'<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>';
               			html +=     	'</span>';
               			html += 		'<div class="comment_id">' + comment.nickName + '</div>';
               			html += 		'<div class="comment_date">';
               			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
           				html += 		'</div>';
           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt"></i></div>';
           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt"></i></div>';
           				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
       					html += 	'</div>';
          				html += 	'<div class="bubble"><p>' + comment.content + '</p></div>';
          				html +=		'<div class="reply_wrapper">';
          				html +=			'<div class="reply_content_wrapper">';
          				html +=				'<textarea class="reply_content" name="content"></textarea>';
          				html +=			'</div>';
          				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '">';
          				html +=				'<a class="far fa-edit"> 답글 등록</a>';
          				html +=			'</div>';
          				html +=		'</div>';
          				html += '</div>';
   						
          				for (let i = 0; i < replyList.length; i++) {
       						let reply = replyList[i];
       						let date = moment(reply.regDate).format("MM-DD HH:mm");
       						
       						if (reply.replyNo == comment.commentNo) {
       							html += '<div class="reply_list">';
                        		html += 	'<div class="comment_info">';
                        		html += 		'<span class="board_img_title">';
                        		html +=     		'<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>';
                       			html +=     	'</span>';
                       			html += 		'<div class="comment_id">' + reply.nickName + '</div>';
                       			html += 		'<div class="comment_date">';
                       			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
                   				html += 		'</div>';
                   				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt"></i></div>';
                   				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt"></i></div>';
               					html += 	'</div>';
                  				html += 	'<div class="bubble"><p>' + reply.content + '</p></div>';
                  				html += '</div>';
       						}
          				}
   					}
   					
   					$(".board_article_comment_list").html(html);
   					
   					/** 동적으로 댓글 div의 width 변경 */
   					for (let i = 0; i < $(".bubble").length; i++) {
   						let width = $(".bubble:eq(" + i + ") > p").width();
   						if (width < 600) {
   						$(".bubble:eq(" + i + ")").css({"width": width});
   						}
   					}
   					
   					$(".reply_wrapper").hide();
   					
   					$(".comment_reply_button").click(function () {
   						$(this).parent().siblings(".reply_wrapper").slideToggle();
   					});
   				}
			});
		});
		
		/** 추천 클릭 이벤트 */
		$(".board_article_like_wrapper").click(function () {
			if (user == "") {
				alert("추천은 로그인 후 가능합니다.");
				return;
			}
			if ( $(this).children("i").attr("class") == "far fa-heart fa-2x" ) {
				$(this).children("i").attr("class", "fas fa-heart fa-2x");
				$(this).css({"border": "2px solid #FC2E5A"});
				
				$.ajax({
	   				type: "POST",
	   				url: "like-ajax.do",
	   				data: 
	   					{
	   					memberNo : memberNo,
	   					boardNo : boardNo,
	   					likeStatus : "y"
	   					},
	   				success: function (result) {
	   					$(".board_article_info_left > span:eq(2)").text(result);
	   				}
				});
				
			} else {
				if (user == "") {
					alert("추천은 로그인 후 가능합니다.");
					return;
				}
				$(this).children("i").attr("class", "far fa-heart fa-2x");
				$(this).css({"border": "2px solid #C7C7C7"});
				
				$.ajax({
	   				type: "POST",
	   				url: "like-ajax.do",
	   				data: 
	   					{
	   					memberNo : memberNo,
	   					boardNo : boardNo,
	   					likeStatus : "n"
	   					},
	   				success: function (result) {
	   					$(".board_article_info_left > span:eq(2)").text(result);
	   				}
				});
				
			}
		});
	
    </script>
</body>
</html>

