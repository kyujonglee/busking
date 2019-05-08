<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <div class="board_head">안녕하세요</div>
                <hr class="write_head_line">
                <div class="board_info">
                <div class="profile">
                    <img class="profileImg" src="pic/profile.jpg">
                </div>
                <div class="nickname">이후승</div>
                <div class="board_info_date">2010/04/05 12:34</div>
                <div class="board_info_date">조회수 : 3</div>
            	</div>
            <div class="content">
                Lorem ipsum, dolor sinam quae assumenda iste non ipsam qui natus molestias? Impedit voluptas eos deleniti cumque, consequatur quibusdam hic suscipit earum molestias quae nulla error excepturi, provident soluta obcaecati libero dignissimos cum adipisci! Vero, architecto expedita harum aliquid delectus hic porro beatae facere molestias fugiat temporibus quod, voluptates ducimus iure ex doloremque dolor tenetur? Sapiente cum fuga aperiam illo, doloribus numquam! Cum cumque necessitatibus laborum quod, beatae maiores voluptates unde numquam, molestias accusantium quam vel quae cupiditate? In excepturi ex ullam odio recusandae placeat culpa officia repudiandae suscipit dicta vel totam autem, quidem aliquam sed corporis iure dolores eum, at, ad doloribus aperiam? Mollitia facilis necessitatibus ullam provident delectus doloribus quasi ex atque deserunt assumenda, nihil non unde numquam nostrum laborum ut voluptas explicabo tenetur vel a placeat cum. Vero assumenda explicabo est, totam eaque error aut sed, vel aliquam provident odit asperiores necessitatibus a magnam. Voluptas unde, tenetur ducimus labore eveniet perferendis magnam aspernatur earum, excepturi, tempore molestias maxime numquam nostrum omnis. Consectetur sunt voluptatem maiores ad alias modi eius molestias perspiciatis similique dolore perferendis aspernatur necessitatibus, sit animi asperiores quaerat placeat, magni dolorem optio. Debitis delectus eveniet optio tempore vitae sunt culpa ratione voluptate! Unde magnam excepturi laboriosam illum aliquid, eveniet culpa dolor nesciunt voluptatum eius, id eum aperiam nam ab? Labore minus est, blanditiis distinctio adipisci fugit explicabo enim, ducimus excepturi, animi vero molestias vitae reprehenderit! Sint nesciunt explicabo rem non magni amet, velit voluptatum dignissimos officiis laborum ipsum sequi dolore natus accusantium quasi, quos dolores? Id suscipit laborum ratione facere officiis ipsam cum, pariatur ullam non officia placeat consectetur assumenda culpa accusantium ab itaque expedita error. Repudiandae harum magni eius debitis necessitatibus quia quam culpa eligendi iusto nam?
            </div>
            <hr>
            <div class="content_bottom">
                <div class="likeImage">
                    <img class="like" src="pic/like.jpg">
                </div>
                <div class="likeText">33</div>
                <div>
                    <button class="buttonBasic">글수정</button>
                </div>
                <div>
                    <button class="buttonBasic">글삭제</button>
                </div>
            </div>
            <div class="comment_start">
                <div class="comment_top">댓글(5)</div>
                <!-- comment 작성부분 -->
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
                <!--comment글 1개 -->
                <div class="comment_container">
                    <hr>
                    <div class="comment_content">
                        <div class="comment_profile">
                            <img class="profileImg" src="pic/profile.jpg">
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
                            <img class="profileImg" src="pic/profile.jpg">
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
        $(".like").attr("src","pic/likeo.jpg");
        $(".likeText").text(parseInt(likeCnt)+1);
        i++;
    }else{
        $(".like").attr("src","pic/like.jpg");
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