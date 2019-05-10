<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qnaBoardWriteForm</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="<c:url value='/resources/css/main/board/qna/detail.css'/>"/>
</head>
<body>
<header>
        헤더
    </header>
    <div class="board_container">
        <form action="" method="post" enctype="multipart/form-data" name="">
            <div class="container_board">
                <div class="board_head">${board.title}</div>
                <hr class="write_head_line">
                <div class="board_info">
                <div class="profile">
                    <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                </div>
                <div class="nickname">${board.nickName}</div>
                <div class="board_info_date"><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm" /></div>
                <div class="board_info_date">조회수 : ${board.viewCnt} </div>
            	</div>
            <div class="content">
                ${board.content}
            </div>
            <hr>
            <div class="content_bottom">
            <!-- 좋아요버튼  -->
                <div class="likeImage">
                    <a id="like" href="<c:url value="/main/board/qna/like.do"/>">
						<c:if test="${board.likeStatus eq 'y'}">
	                    	<img class="like"   src="<c:url value='/resources/img/likeo.jpg'/>">
						</c:if>
						<c:if test="${board.likeStatus eq 'n'}">
	                    	<img class="like"   src="<c:url value='/resources/img/like.jpg'/>">
						</c:if>
						
                    </a>
                </div>
                <div class="likeText">${board.likeCnt}</div>
                <div>
          			<a href="updateform.do?no=${board.boardNo}">
          				<button type="button" class="buttonBasic">
                   			 글수정
                    	</button>
                    </a>
                </div>
                <div>
                    <a href="delete.do?no=${board.boardNo}">
                    	<button type="button" class="buttonBasic">
                   			 글삭제
            		    </button>
            	    </a> 
              
                </div>
            </div>
            <div class="comment_start">
                <div class="comment_top"></div>
                <!-- comment 작성부분 -->
                <div class="comment_write">
                    <div class="profile">
                        <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                    </div>
                    <div class="nickname">이후승</div>
                    <div><textarea class="comment_write_input" name="comment_write_content"></textarea></div>
                    <div class="board_info_date">
                        <button type="button" class="button_write" id="comment_write_button">쓰기</button>
                    </div>
                </div>
                <!--comment글 1개 -->
                <div class="comment_container">
                  
                </div>
                <!--comment 글 1개 끝-->
              
                <!--comment글 ----답글----- -->
                <div>
                    <hr>
                    <div class="answer_comment_content">
                        <div class="answer_icon">
                            <i class="material-icons">
                                subdirectory_arrow_right
                            </i>
                        </div>
                        <div class="comment_profile">
                            <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                        </div>
                        <div class="nickname commentNik">구본영</div>
                        <div></div>
                        <div class="buttonDiv">
                            <button class="answer">답글</button>
                        </div>
                        <div class="comment_date">2010/04/05 12:34</div>
                        <div class="comment_like_img">
                            <i class="material-icons">
                            thumb_up_alt
                            </i></div>
                        <div class="comment_like">21</div>
                        <div class="comment_like_img">
                            <i class="material-icons">
                            thumb_down_alt
                            </i>
                        </div>
                        <div class="comment_like">30</div>
                    </div>
                    <div class="comment">
                        Lorem Lorem ipLorem10 Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, necessitatibus. sum dolor sit amet consectetur adipisicing elit. Repellendus, laudantium? . Consectetur eaque perandae, iste quas soluta, in, non tempore quasi cupiditate sequi excepturi sapiente itaque nisi quam ratione aut doloribus veniam? 
                    </div>
                </div>
                <hr>
           	 </div>
           </div>
        </form>
    </div>
    <footer>
        풋터
    </footer>
 <script src="<c:url value='/resources/js/main/board/qna/detail.js'/>"></script> 
<script>

//좋아요 기능 구현
$("#like").click(function(e){
	let likeInfo = {boardNo: "${board.boardNo}" , memberNo:1 , likeCnt : "${board.likeCnt}"};
// 		alert($(this).attr("href"));   	//url확인
	e.preventDefault();ㅋ
	$.ajax({
		type : "POST",
		data : likeInfo,
		url:$(this).attr("href")
	}).done(function(result){
//		alert("실행완료")
//		alert(result.likeCnt);
//		alert(result.likeStatus);
		if(result.likeStatus=='n'){
			$(".like").attr("src","<c:url value='/resources/img/like.jpg'/>");
			$(".likeText").html(result.likeCnt);
		}else if(result.likeStatus=='y'){
			$(".like").attr("src","<c:url value='/resources/img/likeo.jpg'/>");
			$(".likeText").html(result.likeCnt);		
		}	
		
	})
	.fail(function(xhr){
		alert("서버 처리중 에러발생")
		console.dir(xhr);
	})
})

//날짜  파싱하는 함수 /////////////////////////////////////////////////////

function getTimeStamp(d) {
var s =
  leadingZeros(d.getFullYear(), 4) + '-' +
  leadingZeros(d.getMonth() + 1, 2) + '-' +
  leadingZeros(d.getDate(), 2) + ' ' +

  leadingZeros(d.getHours(), 2) + ':' +
  leadingZeros(d.getMinutes(), 2)
return s;
}

function leadingZeros(n, digits) {
var zero = '';
n = n.toString();

if (n.length < digits) {
  for (i = 0; i < digits - n.length; i++)
    zero += '0';
}
return zero + n;
}

$("#comment_write_button").click(function(){
let writeContent = $(".comment_write_input").val();
// 	alert(writeContent);
	let comment = {boardNo: "${board.boardNo}" , memberNo:1 , content : writeContent};
// 	console.log(comment);
	$.ajax({
		url:"<c:url value="/main/board/qna/comment-write.do" />",
		data : comment
	}) 
	.done(function(){
		$(".comment_container").empty();
		commentLoad();
	}).fail(function(xhr){
		alert("서버 처리중 에러발생")
		console.dir(xhr);
	});
})

//페이지 시작시 comment 불러옴
window.onload=commentLoad();
// window.onload=commentReplyLoad();

//댓글 리스트(답글제외) 불러오기
function commentLoad(){
	$.ajax({      
			url: "<c:url value="/main/board/qna/comment-list.do" />",
			data: "no=${board.boardNo}",
		})
		.done(function (result) {
	//		alert("성공이요");
			for(let i=0; i<result.length ; i++){
				
				//날짜변환
				
				
			d = new Date(result[i].regDate);
	  		let dt = getTimeStamp(d);
			
				let text = `
				<div class="comment_heigh" id="comment`+result[i].commentNo+`">
					<hr>
	              <div class="comment_content">
	                  <div class="comment_profile">
	                      <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
	                  </div>
	                  <div class="nickname commentNik">`+result[i].nickName+`</div>
	                  <div></div>
	                  <div class="buttonDiv">
	                      <a class="comment_answer">
		                  	  <button class="answer" type="button">
		                  	  	   답글
		                      </button>
	                  	  </a>
	                  </div>
	                  <div class="comment_date">`+dt+`</div>
	                  <div class="comment_like_img" >
	                      <i class="material-icons">
	                      thumb_up_alt
	                      </i></div>
	                  <div class="comment_like" >`+result[i].likeCnt+`</div>
	                  <div class="comment_like_img">
	                      <i class="material-icons">
	                      thumb_down_alt
	                      </i></div>
	                  <div class="comment_like">`+result[i].disLikeCnt+`</div>
	              </div>
	              <div class="comment">
	              	`+result[i].content+`
	              </div>
              	</div>
				`
				//댓글 불러오기
				$(".comment_container").append(text);
				//댓글숫자 불러오기
				$(".comment_top").html("댓글("+result.length+")");
			}
			
			commentReplyLoad()
		}).fail(function(xhr){
			alert("서버 처리중 에러발생")
			console.dir(xhr);
		});
}

/////////////////////////////////////////////////reply
function commentReplyLoad(){
	$.ajax({      
		url: "<c:url value="/main/board/qna/comment-reply-list.do" />",
		data: "no=${board.boardNo}",
	})
	.done(function (result) {
// 		alert("성공이요");
		for(let i=0; i<result.length ; i++){
			
			
		d = new Date(result[i].regDate);
  		let dt = getTimeStamp(d);
			
			let text = `
				<div>
                <hr>
                <div class="answer_comment_content">
                    <div class="answer_icon">
                        <i class="material-icons">
                            subdirectory_arrow_right
                        </i>
                    </div>
                    <div class="comment_profile">
                        <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                    </div>
                    <div class="nickname commentNik">`+result[i].nickName+`</div>
                    <div></div>
                    <div class="buttonDiv">
                        <button class="answer">답글</button>
                    </div>
                    <div class="comment_date">2010/04/05 12:34</div>
                    <div class="comment_like_img">
                        <i class="material-icons">
                        thumb_up_alt
                        </i></div>
                    <div class="comment_like">`+result[i].likeCnt+`</div>
                    <div class="comment_like_img">
                        <i class="material-icons">
                        thumb_down_alt
                        </i>
                    </div>
                    <div class="comment_like">+result[i].disLikeCnt+</div>
                </div>
                <div class="comment">
                `+result[i].content+`
                </div>
            </div>
			`
			console.log(result);
			$("#comment"+result[i].replyNo).append(text);
			$(".comment_top").html("댓글("+result.length+")");
			$(".nickName").html()
		}
		
	}).fail(function(xhr){
		alert("서버 처리중 에러발생")
		console.dir(xhr);
	});

}


//댓글 좋아요 //////////////////////////////////////////////////////////////////
let k=0;
$(".material-icons").click(function(){
let commentLikeCnt=$(this).parent().next().text();
if(k==0){
    $(this).parent().next().text(parseInt(commentLikeCnt)+1);
    k++;
}else{
    $(this).parent().next().text(parseInt(commentLikeCnt)-1);
    k--;
}
})

let result=`
	<div class="comment_write">
   	 	<div class="profile">
        	<img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
    	</div>
    	<div class="nickname">이후승</div>
    	<div><textarea class="comment_write_input" name="comment_write_content"></textarea></div>
    	<div class="board_info_date">
       		<button type="button" class="button_write" id="comment_write_button">쓰기</button>
    	</div>
	</div>
`
let i =0;
$(document).on("click",".comment_answer",(function(){
		if(i==0){
			$(this).parent().parent().parent().after(result);
			$(this).find(".answer").html("답글취소");
			i++;
		}else if(i==1){
			$(this).parent().parent().parent().next().remove();
			i--;
		}
	})
)


</script>
</body>
</html>