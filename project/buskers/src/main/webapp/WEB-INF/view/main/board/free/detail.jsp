<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<%@ page session="true" %>

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/test.css'/>" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<title>자유게시판</title>
	<main class="main-freeboard main-board">
		<div class="board">
			<div class="freeboard__detail">
            <div class="board_title">
                <div class="board_title_underline">
                    <a href="<c:url value='/main/board/free/list.do'/>">자유게시판</a>
                </div>
            </div>

            <div class="board_head_line">
                <span class="board_img_title">
                	<img src="<c:url value='/file/download.do'/>?path=${board.profileImgPath}${board.profileImg}" onError="this.src='<c:url value='/resources/img/profile.png' />';" />/>
                </span>
   				<c:out value="${board.title}" />
            </div>
            
           
            <div class="board_article">
                <div class="board_article_info">
                    <div class="board_article_info_left">
                        <i class="fas fa-user"></i>
                        <span id="board_article_info_id" class="nickName_info">
	                        <c:if test="${board.isAdmin eq 'y'}">
								<i class="fas fa-sun"></i>
							</c:if>
							<c:if test="${board.isBusker eq 'y'}">
								<i class="fas fa-star"></i>
							</c:if>
	                        <c:out value="${board.nickName}" />
                        </span>
                        <i class="far fa-eye"></i>
                        <span><c:out value="${board.viewCnt}" /></span>
                        <i class="fas fa-heart"></i>
                        <span><c:out value="${board.likeCnt}" /></span>
						<c:if test="${board.isBusker eq 'y'}">
							<div class="nickName_info_box">
								<a class="info_box_detail" href="<c:url value='/artist/main/main.do?buskerNo=${board.buskerNo}'/>">아티스트 채널</a>
								<a name="${board.nickName}" class="info_box_detail nickName_info_box_send_message">쪽지 보내기</a>
							</div>
						</c:if>
						<c:if test="${board.isBusker eq 'n'}">
							<div class="nickName_info_box">
								<a>회원 정보</a>
								<a name="${board.nickName}" class="nickName_info_box_send_message">쪽지 보내기</a>
							</div>
						</c:if>
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
                
               	<div class="board_article_bottom">
                	<div class="board_image_list">
                		<c:if test="${file ne null}">
	                		<c:forEach var="file" items="${file}">
	   	               		<div class="board_image fas fa-image">
								<a href="<c:url value='/file/download-file.do'/>?path=${fn:substring(file.path, 0, fn:length(file.path) - 1)}&systemName=${file.systemName}&name=${file.name}">
									${file.name}
								</a>
							</div>
							</c:forEach>
						</c:if>
                	</div>
                	
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
                			<!--  
               				<div class="best_comment comment_list">
		               			<div class="comment_info">
		                			<span class="board_img_title">
					                	<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
					                </span>
		               				<div class="comment_id">닉네임</div>
		               				<div class="comment_date">
			               				<i class="far fa-clock comment_clock"></i>
			               				05-15 05:05
		               				</div>
		               				<div class="comment_like"><i class="fas fa-heart">추천<a>99</a></i></div>
		               				<div class="comment_best"><i class="fas fa-medal fa-1x"></i></div>
		               			</div>
		               			<div class="bubble"><p>베스트 댓글</p></div>
	               			</div>
                			-->
                		<c:forEach var="comment" items="${comment}">
			                	<div class="comment_list">
			               			<div class="comment_info">
			                			<span class="board_img_title">
						                	<img src="<c:url value='/file/download.do'/>?path=${comment.profileImgPath}${comment.profileImg}" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
						                </span>
			               				<div class="comment_id">${comment.nickName}</div>
			               				<div class="comment_date">
				               				<i class="far fa-clock comment_clock"></i>
				               				<fmt:formatDate value="${comment.regDate}" pattern="MM-dd HH:mm" />
			               				</div>
		               					<c:if test="${sessionScope.user.memberNo eq comment.memberNo}">
			               				<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>
			               				<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>
			               				</c:if>
			               				<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>
			               				<div class="comment_like_button"><i class="fas fa-heart">추천<a>${comment.likeCnt}</a></i></div>
			               				<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>${comment.dislikeCnt}</a></i></div>
			               			</div>
					                
			               			<div class="bubble"><p>${comment.content}</p></div>
			               			
			               			<div class="update_wrapper">
				               			<div class="reply_content_wrapper">
						           			<textarea class="reply_content" name="content"></textarea>
					           			</div>
					           			<div class="update_submit_button" name="${comment.commentNo}" nick="${comment.nickName}" type="comment" no="${comment.commentNo}">
						           			<a class="far fa-edit"> 댓글 수정</a>
					           			</div>
				           			</div>
			               			
			               			<div class="reply_wrapper">
				               			<div class="reply_content_wrapper">
						           			<textarea class="reply_content" name="content"></textarea>
					           			</div>
					           			<div class="reply_submit_button" name="${comment.commentNo}" nick="${comment.nickName}" type="comment" no="${comment.commentNo}">
						           			<a class="far fa-edit"> 답글 등록</a>
					           			</div>
				           			</div>
			               		</div>
		                	<c:forEach var="reply" items="${reply}">
		                		<c:if test="${reply.replyNo eq comment.commentNo}">
			                		<div class="reply_list">
				               			<div class="comment_info">
				                			<span class="board_img_title">
							                	<img src="<c:url value='/file/download.do'/>?path=${reply.profileImgPath}${reply.profileImg}" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
							                </span>
				               				<div class="comment_id">${reply.nickName}</div>
				               				<div class="comment_date">
					               				<i class="far fa-clock comment_clock"></i>
					               				<fmt:formatDate value="${reply.regDate}" pattern="MM-dd HH:mm" />
				               				</div>
			               					<c:if test="${sessionScope.user.memberNo eq reply.memberNo}">
				               				<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>
				               				<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>
				               				</c:if>
				               				<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>
				               				<div class="comment_like_button"><i class="fas fa-heart">추천<a>${reply.likeCnt}</a></i></div>
			               					<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>${reply.dislikeCnt}</a></i></div>
				               			</div>
						                
				               			<div class="bubble"><p>${reply.content}</p></div>
				               			
				               			<div class="update_wrapper">
					               			<div class="reply_content_wrapper">
							           			<textarea class="reply_content" name="content"></textarea>
						           			</div>
						           			<div class="update_submit_button" name="${comment.commentNo}" nick="${reply.nickName}" type="reply" no="${reply.commentNo}">
							           			<a class="far fa-edit"> 댓글 수정</a>
						           			</div>
					           			</div>
					           			
				               			<div class="reply_wrapper">
					               			<div class="reply_content_wrapper">
							           			<textarea class="reply_content" name="content"></textarea>
						           			</div>
						           			<div class="reply_submit_button" name="${comment.commentNo}" nick="${reply.nickName}" type="reply" no="${reply.commentNo}">
							           			<a class="far fa-edit"> 답글 등록</a>
						           			</div>
				           				</div>
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
		              			<img src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" onError="this.src='<c:url value='/resources/img/profile.png' />';" />/>
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
        		<c:if test="${sessionScope.user.memberNo eq board.memberNo}">
                <a href="<c:url value='/main/board/free/update-form.do?pageNo=${param.pageNo}&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}&boardNo=${param.boardNo}'/>" class="fas fa-eraser"> 수정</a>
                <a href="<c:url value='/main/board/free/delete.do?pageNo=${param.pageNo}&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}&boardNo=${param.boardNo}'/>" class="fas fa-pen-square"> 삭제</a>
                </c:if>
                <a href="<c:url value='/main/board/free/list.do?pageNo=${param.pageNo}&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}'/>" class="fas fa-list-ul"> 목록</a>
            </div>

            <br><br><br>
			</div>
			</div>
		</main>
		
	<script>
		toastr.options.positionClass = 'toast-bottom-right';
		toastr.options.closeButton = true;
	
		let user = "${sessionScope.user}";
		let like = "${like.likeStatus}";
		let nickName = "${sessionScope.user.nickName}";
		let memberNo = "${sessionScope.user.memberNo}";
	
		$(document).ready(function () {
			$(".reply_wrapper").hide();
			$(".update_wrapper").hide();
		});
		
		function commentIsLiked() {
			$.ajax({
				type: "POST",
				url: "is-liked-comment-ajax.do",
				data: 
					{
					memberNo : memberNo,
					},
				dataType: "json",
				success: function (result) {
						let isLikeCommentList = result.isLikedComment;
					for (let i = 0; i < isLikeCommentList.length; i++) {
						let isLikedCommentNo = isLikeCommentList[i];
 						$(".reply_submit_button[no=" + isLikedCommentNo.boardNo + "]").parent().siblings(".comment_info").find(".fa-heart").css("color","#FC2E5A");
					}
				}
			});
		}
		commentIsLiked();
		
		function commentIsDisliked() {
			$.ajax({
				type: "POST",
				url: "is-disliked-comment-ajax.do",
				data: 
					{
					memberNo : memberNo,
					},
				dataType: "json",
				success: function (result) {
						let isDislikeCommentList = result.isDislikedComment;
					for (let i = 0; i < isDislikeCommentList.length; i++) {
						let isDislikedCommentNo = isDislikeCommentList[i];
 						$(".reply_submit_button[no=" + isDislikedCommentNo.boardNo + "]").parent().siblings(".comment_info").find(".fa-exclamation").css("color","#EE7C01");
					}
				}
			});
		}
		commentIsDisliked();
		
		
		/** 댓글 삭제 */
		function deleteComment() {
			
			$(".comment_delete_button").click(function () {
				if (user == "") {
					alert("로그인 후 이용 가능합니다.");
					return;
				}
				
				let commentNo = $(this).parent().siblings(".reply_wrapper").children(".reply_submit_button").attr("no");
				if ( nickName != $(this).siblings(".comment_id").text() ) {
					alert("본인이 작성하지 않은 댓글은 삭제할 수 없습니다.");
					return;
				}
				
				$.ajax({
	   				type: "POST",
	   				url: "delete-comment-ajax.do",
	   				data: 
	   					{
	   					commentNo : commentNo
	   					},
	   				success: function () {
	   					alert("삭제 되었습니다.");
	   				}
				});
				if ( $(this).parent().siblings(".reply_wrapper").children(".reply_submit_button").attr("type") == "reply" ) {
					$(this).parent().parent().remove();
	  				$(".comment_highlight").text( parseInt( $(".comment_highlight").text() ) - 1 );
	  				return;
				}
				if ( $(this).parent().parent().next().attr("class") == "reply_list" ) {
					$(this).parent().siblings(".bubble").css({"width": "143.1"});
					$(this).parent().siblings(".bubble").children("p").text("삭제된 댓글 입니다.");
				} else {
					$(this).parent().parent().remove();
	  				$(".comment_highlight").text( parseInt( $(".comment_highlight").text() ) - 1 );
				}
			});
		}
		deleteComment();
		
		
		$(".comment_update_button").click(function () {
			$(".reply_wrapper").hide();
			$(this).parent().siblings(".update_wrapper").slideToggle();
		});
		
		$(".comment_reply_button").click(function () {
			$(".update_wrapper").hide();
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
		
		/** 동적으로 댓글 div의 width 변경 */
		console.log( $(".bubble") );
		for (let i = 0; i < $(".bubble").length; i++) {
			let width = parseInt($(".bubble:eq(" + i + ") > p").width()) + 41;
			if (width < 600) {
			$(".bubble:eq(" + i + ")").css({"width": width});
			}
		}
		
		/** 댓글 작성 */
		function writeComment() {
			
			$(".comment_submit_button > a").click(function () {
				if (user == "") {
					alert("로그인 후 이용 가능합니다.");
					return;
				}
				
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
	   					$(".comment_content").val('');
						let commentList = commentResult.comment;
						let replyList = commentResult.reply;					
						let html = "";
	   					for (let i = 0; i < commentList.length; i++) {
	   						let comment = commentList[i];
	   						let date = moment(comment.regDate).format("MM-DD HH:mm");
	   						
	                		html += '<div class="comment_list">';
	                		html += 	'<div class="comment_info">';
	                		html += 		'<span class="board_img_title">';
	                		html +=     		'<img src="<c:url value='/file/download.do'/>?path=' + comment.profileImgPath + comment.profileImg+ `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` + '"/>';
	               			html +=     	'</span>';
	               			html += 		'<div class="comment_id">' + comment.nickName + '</div>';
	               			html += 		'<div class="comment_date">';
	               			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
	           				html += 		'</div>';
	           				if ( "${sessionScope.user.memberNo}" == comment.memberNo ) {
		           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>';
		           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>';
	           				}
	           				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
           					html += 		'<div class="comment_like_button"><i class="fas fa-heart">추천<a>' + comment.likeCnt + '</a></i></div>';
	           				html += 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>' + comment.dislikeCnt + '</a></i></div>';
	       					html += 	'</div>';
	          				html += 	'<div class="bubble"><p>' + comment.content + '</p></div>';
	          				html +=		'<div class="update_wrapper">';
	          				html +=			'<div class="reply_content_wrapper">';
	          				html +=				'<textarea class="reply_content" name="content"></textarea>';
	          				html +=			'</div>';
	          				html +=			'<div class="update_submit_button" name="' + comment.commentNo + '" nick="' + comment.nickName + '" no="' + comment.commentNo + '" type="comment">';
	          				html +=				'<a class="far fa-edit"> 댓글 수정</a>';
	          				html +=			'</div>';
	          				html +=		'</div>';
	          				html +=		'<div class="reply_wrapper">';
	          				html +=			'<div class="reply_content_wrapper">';
	          				html +=				'<textarea class="reply_content" name="content"></textarea>';
	          				html +=			'</div>';
	          				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '" nick="' + comment.nickName + '" no="' + comment.commentNo + '" type="comment">';
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
	                        		html +=     		'<img src="<c:url value='/file/download.do'/>?path=' + reply.profileImgPath + reply.profileImg  + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` +  '"/>';
	                       			html +=     	'</span>';
	                       			html += 		'<div class="comment_id">' + reply.nickName + '</div>';
	                       			html += 		'<div class="comment_date">';
	                       			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
	                   				html += 		'</div>';
	                   				if ( "${sessionScope.user.memberNo}" == reply.memberNo ) {
	    		           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>';
	    		           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>';
	    	           				}
	                   				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
    	           					html += 		'<div class="comment_like_button"><i class="fas fa-heart">추천<a>' + reply.likeCnt + '</a></i></div>';
    		           				html += 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>' + reply.dislikeCnt + '</a></i></div>'; 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고</i></div>';
	    	           				html += 	'</div>';
	                  				html += 	'<div class="bubble"><p>' + reply.content + '</p></div>';
	                  				html +=		'<div class="update_wrapper">';
	                  				html +=			'<div class="reply_content_wrapper">';
	                  				html +=				'<textarea class="reply_content" name="content"></textarea>';
	                  				html +=			'</div>';
	                  				html +=			'<div class="update_submit_button" name="' + comment.commentNo + '" nick="' + reply.nickName + '" no="' + reply.commentNo + '" type="reply">';
	                  				html +=				'<a class="far fa-edit"> 댓글 수정</a>';
	                  				html +=			'</div>';
	                  				html +=		'</div>';
	                  				html +=		'<div class="reply_wrapper">';
	                  				html +=			'<div class="reply_content_wrapper">';
	                  				html +=				'<textarea class="reply_content" name="content"></textarea>';
	                  				html +=			'</div>';
	                  				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '" nick="' + reply.nickName + '" no="' + reply.commentNo + '" type="reply">';
	                  				html +=				'<a class="far fa-edit"> 답글 등록</a>';
	                  				html +=			'</div>';
	                  				html +=		'</div>';
	                  				html += '</div>';
	       						}
	          				}
	   					}
	   					
	   					$(".board_article_comment_list").html(html);
	   					
	   					/** 동적으로 댓글 div의 width 변경 */
	   					for (let i = 0; i < $(".bubble").length; i++) {
	   						let width = parseInt($(".bubble:eq(" + i + ") > p").width()) + 41;
	   						if (width < 600) {
	   						$(".bubble:eq(" + i + ")").css({"width": width});
	   						}
	   					}
	   					
						$(".reply_wrapper").hide();
						$(".update_wrapper").hide();
	   					
	   					$(".comment_reply_button").click(function () {
	   						$(".update_wrapper").hide();
	   						$(this).parent().siblings(".reply_wrapper").slideToggle();
	   					});
	   					
	   					$(".comment_update_button").click(function () {
	   						$(".reply_wrapper").hide();
	   						$(this).parent().siblings(".update_wrapper").slideToggle();
	   					});
	   					
	   					$(".comment_highlight").text( parseInt( $(".comment_highlight").text() ) + 1 );
	   					
	   					replyComment();
	   					updateComment();
	   					deleteComment();
	   					commentLike();
	   					commentIsLiked();
	   					commentDislike();
	   					commentIsDisliked();
	   				}
				});
				
			    toastr.success('댓글이 등록되었습니다.');
			});
		}
		writeComment();
		
		/** 답글(대댓글) 작성 */
		function replyComment() {
			$(".reply_submit_button").click(function () {
				if (user == "") {
					alert("로그인 후 이용 가능합니다.");
					return;
				}
					
				let content = $(this).siblings().children().val();
				let memberNo = "${sessionScope.user.memberNo}";
				let replyNo = $(this).attr("name");
				let replyName = $(this).attr("nick");

				if ( content == "" ) {
					alert("답글 내용을 입력해주세요.")
					return;
				}
				content = "<b class='reply_name'>" + "@" + replyName + "</b>" + " " + content;
				
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
	                		html +=     		'<img src="<c:url value='/file/download.do'/>?path=' + comment.profileImgPath + comment.profileImg  + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` + '"/>';
	               			html +=     	'</span>';
	               			html += 		'<div class="comment_id">' + comment.nickName + '</div>';
	               			html += 		'<div class="comment_date">';
	               			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
	           				html += 		'</div>';
	           				if ( "${sessionScope.user.memberNo}" == comment.memberNo ) {
		           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>';
		           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>';
	           				}		
	           				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
           					html += 		'<div class="comment_like_button"><i class="fas fa-heart">추천<a>' + comment.likeCnt + '</a></i></div>';
	           				html += 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>' + comment.dislikeCnt + '</a></i></div>';
	       					html += 	'</div>';
	          				html += 	'<div class="bubble"><p>' + comment.content + '</p></div>';
	          				html +=		'<div class="update_wrapper">';
	          				html +=			'<div class="reply_content_wrapper">';
	          				html +=				'<textarea class="reply_content" name="content"></textarea>';
	          				html +=			'</div>';
	          				html +=			'<div class="update_submit_button" name="' + comment.commentNo + '" nick="' + comment.nickName + '" no="' + comment.commentNo + '" type="comment">';
	          				html +=				'<a class="far fa-edit"> 댓글 수정</a>';
	          				html +=			'</div>';
	          				html +=		'</div>';
	          				html +=		'<div class="reply_wrapper">';
	          				html +=			'<div class="reply_content_wrapper">';
	          				html +=				'<textarea class="reply_content" name="content"></textarea>';
	          				html +=			'</div>';
	          				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '" nick="' + comment.nickName + '" no="' + comment.commentNo + '" type="comment">';
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
	                        		html +=     		'<img src="<c:url value='/file/download.do'/>?path=' + reply.profileImgPath + reply.profileImg + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` + '"/>';
	                       			html +=     	'</span>';
	                       			html += 		'<div class="comment_id">' + reply.nickName + '</div>';
	                       			html += 		'<div class="comment_date">';
	                       			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
	                   				html += 		'</div>';
	                   				if ( "${sessionScope.user.memberNo}" == reply.memberNo ) {
	    		           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>';
	    		           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>';
	    	           				}	
	                   				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
    	           					html += 		'<div class="comment_like_button"><i class="fas fa-heart">추천<a>' + reply.likeCnt + '</a></i></div>';
    		           				html += 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>' + reply.dislikeCnt + '</a></i></div>';
	               					html += 	'</div>';
	                  				html += 	'<div class="bubble"><p>' + reply.content + '</p></div>';
	                  				html +=		'<div class="update_wrapper">';
	                  				html +=			'<div class="reply_content_wrapper">';
	                  				html +=				'<textarea class="reply_content" name="content"></textarea>';
	                  				html +=			'</div>';
	                  				html +=			'<div class="update_submit_button" name="' + comment.commentNo + '" nick="' + reply.nickName + '" no="' + reply.commentNo + '" type="reply">';
	                  				html +=				'<a class="far fa-edit"> 댓글 수정</a>';
	                  				html +=			'</div>';
	                  				html +=		'</div>';
	                  				html +=		'<div class="reply_wrapper">';
	                  				html +=			'<div class="reply_content_wrapper">';
	                  				html +=				'<textarea class="reply_content" name="content"></textarea>';
	                  				html +=			'</div>';
	                  				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '" nick="' + reply.nickName + '" no="' + reply.commentNo + '" type="reply">';
	                  				html +=				'<a class="far fa-edit"> 답글 등록</a>';
	                  				html +=			'</div>';
	                  				html +=		'</div>';
	                  				html += '</div>';
	       						}
	          				}
	   					}
	   					
	   					$(".board_article_comment_list").html(html);
	   					
	   					/** 동적으로 댓글 div의 width 변경 */
	   					for (let i = 0; i < $(".bubble").length; i++) {
	   						let width = parseInt($(".bubble:eq(" + i + ") > p").width()) + 41;
	   						if (width < 600) {
	   						$(".bubble:eq(" + i + ")").css({"width": width});
	   						}
	   					}
	   					
						$(".reply_wrapper").hide();
						$(".update_wrapper").hide();
	   					
	   					$(".comment_reply_button").click(function () {
	   						$(".update_wrapper").hide();
	   						$(this).parent().siblings(".reply_wrapper").slideToggle();
	   					});
	   					
	   					$(".comment_update_button").click(function () {
	   						$(".reply_wrapper").hide();
	   						$(this).parent().siblings(".update_wrapper").slideToggle();
	   					});
	   					
	   					$(".comment_highlight").text( parseInt( $(".comment_highlight").text() ) + 1 );
	   					
	   					replyComment();
	   					updateComment();
	   					deleteComment();
	   					commentLike();
	   					commentIsLiked();
	   					commentDislike();
	   					commentIsDisliked();
	   				}
				});
				toastr.success('답글이 등록되었습니다.')
			});
		}
		replyComment();
		
		/** 댓글 수정 */
		function updateComment() {
		
			$(".update_submit_button").click(function () {
				let content = $(this).siblings().children().val();
				let boardNo = "${param.boardNo}";
				let commentNo = $(this).attr("no");
				if (content == "") {
					alert("댓글 내용을 입력해주세요.");
					return;
				}
				
				if ( $(this).attr("type") == "reply" ) {
					let replyName = $(this).parent().siblings(".bubble").children().text();
					replyName = replyName.substring(1, replyName.indexOf(" "));
					content = "<b class='reply_name'>" + "@" + replyName + "</b>" + " " + content;
				}
				
				if ( nickName != $(this).attr("nick") ) {
					alert("본인이 작성하지 않은 댓글은 수정할 수 없습니다.");
					return;
				}
				
				$.ajax({
	   				type: "POST",
	   				url: "update-comment-ajax.do",
	   				data: 
	   					{
	   					content : content,
	   					boardNo : boardNo,
	   					commentNo : commentNo
	   					},
	   				dataType: "json",
	   				success: function (result) {
	   					let commentList = result.comment;
						let replyList = result.reply;					
						let html = "";
	   					for (let i = 0; i < commentList.length; i++) {
	   						let comment = commentList[i];
	   						let date = moment(comment.regDate).format("MM-DD HH:mm");
	   						
	                		html += '<div class="comment_list">';
	                		html += 	'<div class="comment_info">';
	                		html += 		'<span class="board_img_title">';
	                		html +=     		'<img src="<c:url value='/file/download.do'/>?path=' + comment.profileImgPath + comment.profileImg + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` + '"/>';
	               			html +=     	'</span>';
	               			html += 		'<div class="comment_id">' + comment.nickName + '</div>';
	               			html += 		'<div class="comment_date">';
	               			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
	           				html += 		'</div>';
	           				if ( "${sessionScope.user.memberNo}" == comment.memberNo ) {
		           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>';
		           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>';
	           				}	
	           				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
           					html += 		'<div class="comment_like_button"><i class="fas fa-heart">추천<a>' + comment.likeCnt + '</a></i></div>';
	           				html += 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>' + comment.dislikeCnt + '</a></i></div>';
	       					html += 	'</div>';
	          				html += 	'<div class="bubble"><p>' + comment.content + '</p></div>';
	          				html +=		'<div class="update_wrapper">';
	          				html +=			'<div class="reply_content_wrapper">';
	          				html +=				'<textarea class="reply_content" name="content"></textarea>';
	          				html +=			'</div>';
	          				html +=			'<div class="update_submit_button" name="' + comment.commentNo + '" nick="' + comment.nickName + '" no="' + comment.commentNo + '" type="comment">';
	          				html +=				'<a class="far fa-edit"> 댓글 수정</a>';
	          				html +=			'</div>';
	          				html +=		'</div>';
	          				html +=		'<div class="reply_wrapper">';
	          				html +=			'<div class="reply_content_wrapper">';
	          				html +=				'<textarea class="reply_content" name="content"></textarea>';
	          				html +=			'</div>';
	          				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '" nick="' + comment.nickName + '" no="' + comment.commentNo + '" type="comment">';
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
	                        		html +=     		'<img src="<c:url value='/file/download.do'/>?path=' + reply.profileImgPath + reply.profileImg + `" onError="this.src='<c:url value='/resources/img/profile.png' />';"` + '"/>';
	                       			html +=     	'</span>';
	                       			html += 		'<div class="comment_id">' + reply.nickName + '</div>';
	                       			html += 		'<div class="comment_date">';
	                       			html += 			'<i class="far fa-clock comment_clock"></i>' + date;
	                   				html += 		'</div>';
	                   				if ( "${sessionScope.user.memberNo}" == reply.memberNo ) {
	    		           				html += 		'<div class="comment_update_button"><i class="fas fa-pen-alt">수정</i></div>';
	    		           				html += 		'<div class="comment_delete_button"><i class="far fa-trash-alt">삭제</i></div>';
	    	           				}	
	                   				html += 		'<div class="comment_reply_button"><i class="fas fa-reply">답글</i></div>';
    	           					html += 		'<div class="comment_like_button"><i class="fas fa-heart">추천<a>' + reply.likeCnt + '</a></i></div>';
    		           				html += 		'<div class="comment_dislike_button"><i class="fas fa-exclamation">신고<a>' + reply.dislikeCnt + '</a></i></div>';
	               					html += 	'</div>';
	                  				html += 	'<div class="bubble"><p>' + reply.content + '</p></div>';
	                  				html +=		'<div class="update_wrapper">';
	                  				html +=			'<div class="reply_content_wrapper">';
	                  				html +=				'<textarea class="reply_content" name="content"></textarea>';
	                  				html +=			'</div>';
	                  				html +=			'<div class="update_submit_button" name="' + comment.commentNo + '" nick="' + reply.nickName + '" no="' + reply.commentNo + '" type="reply">';
	                  				html +=				'<a class="far fa-edit"> 댓글 수정</a>';
	                  				html +=			'</div>';
	                  				html +=		'</div>';
	                  				html +=		'<div class="reply_wrapper">';
	                  				html +=			'<div class="reply_content_wrapper">';
	                  				html +=				'<textarea class="reply_content" name="content"></textarea>';
	                  				html +=			'</div>';
	                  				html +=			'<div class="reply_submit_button" name="' + comment.commentNo + '" nick="' + reply.nickName + '" no="' + reply.commentNo + '" type="reply">';
	                  				html +=				'<a class="far fa-edit"> 답글 등록</a>';
	                  				html +=			'</div>';
	                  				html +=		'</div>';
	                  				html += '</div>';
	       						}
	          				}
	   					}
	   					
	   					$(".board_article_comment_list").html(html);
	   					
	   					/** 동적으로 댓글 div의 width 변경 */
	   					for (let i = 0; i < $(".bubble").length; i++) {
	   						let width = parseInt($(".bubble:eq(" + i + ") > p").width()) + 41;
	   						if (width < 600) {
	   						$(".bubble:eq(" + i + ")").css({"width": width});
	   						}
	   					}
	   					
	   					$(".reply_wrapper").hide();
	   					$(".update_wrapper").hide();
	   					
	   					$(".comment_reply_button").click(function () {
	   						$(".update_wrapper").hide();
	   						$(this).parent().siblings(".reply_wrapper").slideToggle();
	   					});
	   					
	   					$(".comment_update_button").click(function () {
	   						$(".reply_wrapper").hide();
	   						$(this).parent().siblings(".update_wrapper").slideToggle();
	   					});
	   					
	   					replyComment();
	   					updateComment();
	   					deleteComment();
	   					writeComment();
	   					commentLike();
	   					commentIsLiked();
	   					commentDislike();
	   					commentIsDisliked();
	   				}
				});
 				toastr.success('댓글이 수정되었습니다.')
			});
		}
		updateComment();
		
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
		
		/** 댓글 좋아요 */
		function commentLike() {
			$(".comment_like_button").click(function () {
				let commentNo = $(this).parent().siblings(".reply_wrapper").find(".reply_submit_button").attr("no");
				let element = $(this).children();
				
				$.ajax({
	   				type: "POST",
	   				url: "like-comment-ajax.do",
	   				data: 
	   					{
	   					memberNo : memberNo,
	   					boardNo : commentNo,
	   					},
	   				success: function (result) {
	   					element.children().text(result.likeCount);
	   					if (result.likeStatus == "n") {
	   						element.css("color", "grey");
	   					} else {
	   						element.css("color", "#FC2E5A");
	   					}
	   				}
				});
			});
		}
		commentLike();
		
		/** 댓글 신고 */
		function commentDislike() {
			$(".comment_dislike_button").click(function () {
				let commentNo = $(this).parent().siblings(".reply_wrapper").find(".reply_submit_button").attr("no");
				let element = $(this).children();
				
				$.ajax({
	   				type: "POST",
	   				url: "dislike-comment-ajax.do",
	   				data: 
	   					{
	   					memberNo : memberNo,
	   					boardNo : commentNo,
	   					},
	   				success: function (result) {
	   					element.children().text(result.dislikeCount);
	   					if (result.dislikeStatus == "n") {
	   						element.css("color", "grey");
	   					} else {
	   						element.css("color", "#EE7C01");
	   					}
	   				}
				});
			});
		}
		commentDislike();
		
		$(".nickName_info").click(function (event) {
        	event.stopPropagation();	
        	$(this).siblings(".nickName_info_box").toggle();
        });
        
       	$(document).click(function() {
       	    $('.nickName_info_box').hide();
       	});
       	
    	$(".nickName_info_box_send_message").click(function () {
    		let name = $(this).attr("name");
    		window.open('<c:url value="/main/header/message/write-form.do?nickName=' + name + '"/>', '', 'top=' + popupY + ', left=' + popupX + ', scrollbars=no, resizable=no, width=500, height=500');
    	});
		
    </script>

