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
    <div class="container">
        <form action="" method="post" enctype="multipart/form-data" name="">
            <div class="container_board">
                <div class="board_head">${board.title}</div>
                <hr class="write_head_line">
                <div class="board_info">
                <div class="profile">
                    <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                </div>
                <div class="nickname">이후승</div>
                <div class="board_info_date"><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd HH:mm" /></div>
                <div class="board_info_date">조회수 : ${board.viewCnt} </div>
            	</div>
            <div class="content">
                ${board.content }
            </div>
            <hr>
            <div class="content_bottom">
                <div class="likeImage">
                    <img class="like"   src="<c:url value='/resources/img/like.jpg'/>">
                </div>
                <div class="likeText">${board.likeCnt}</div>
                <div>
                    <a href="updateForm.do?no=${board.no}"><button class="buttonBasic">글수정</button></a>
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
                <div class="comment_top">댓글(5)</div>
                <!-- comment 작성부분 -->
                <div class="comment_write">
                    <div class="profile">
                        <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                    </div>
                    <div class="nickname">이후승</div>
                    <div><textarea class="comment_write_input"></textarea></div>
                    <div class="board_info_date">
                        <button class="button_write">쓰기</button>
                    </div>
                </div>
                <!--comment글 1개 -->
                <div class="comment_container">
                    <hr>
                    <div class="comment_content">
                        <div class="comment_profile">
                            <img class="profileImg" src="<c:url value='/resources/img/profile.png'/>">
                        </div>
                        <div class="nickname commentNik">구본영</div>
                        <div></div>
                        <div class="buttonDiv">
                            <button class="answer">답글</button>
                        </div>
                        <div class="comment_date">2010/04/05 12:34</div>
                        <div class="comment_like_img" >
                            <i class="material-icons">
                            thumb_up_alt
                            </i></div>
                        <div class="comment_like" >21</div>
                        <div class="comment_like_img">
                            <i class="material-icons">
                            thumb_down_alt
                            </i></div>
                        <div class="comment_like">30</div>
                    </div>
                    <div class="comment">
                        Lorem Lorem ipLorem10 Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, necessitatibus. sum dolor sit amet consectetur adipisicing elit. Repellendus, laudantium? . Consectetur eaque perandae, iste quas soluta, in, non tempore quasi cupiditate sequi excepturi sapiente itaque nisi quam ratione aut doloribus veniam? 
                    </div>
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
<script>
let i = 0;
$(".like").click(function(){
    let likeCnt=$(".likeText").text();
    if(i==0){
        $(".like").attr("src","<c:url value='/resources/img/likeo.jpg'/>");
        $(".likeText").text(parseInt(likeCnt)+1);
        i++;
    }else{
        $(".like").attr("src","<c:url value='/resources/img/like.jpg'/>");
        $(".likeText").text(parseInt(likeCnt)-1);
        i--;
    }
});
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
            <img class="profileImg" src="pic/profile.jpg">
        </div>
        <div class="nickname">이후승</div>
        <div><textarea class="comment_write_input"></textarea></div>
        <div class="board_info_date">
            <button class="button_write">쓰기</button>
        </div>
    </div>
`
$(".answer").click(function(){
    alert("ss");
    $(".comment_container").after(result);
    alert("끝");
})
</script>
</body>
</html>