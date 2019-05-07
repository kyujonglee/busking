<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="../../../../../resources/css/board/qnaboard/qnaboardwriteform.css" />
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <script src="../../../../js/main/board/qnaboard/qnaboardwriteform.js"></script>
</head>
<body>
 <header>
        헤더
    </header>
    <div class="container">
        <form action="" method="post" enctype="multipart/form-data" name="">
            <div class="container_board">
                <div class="board_head">새 게시글</div>
                <hr class="write_head_line">
                <div class="title">제목</div>
                <input class="title_write" name="" id="" placeholder="제목 입력"/>
                <div class="title">본문</div>
                <textarea class="content_write" name="smarteditor" id="summernote"></textarea>
                <!--
                <div class="title">이미지 첨부</div>
                <div class="field" align="left">
                   <input type="file" id="files" name="files[]" multiple />
                </div>         
                -->    

                <div class="button">
                    <button class="button_reg">글등록</button>
                </div>
            </div>
        </form>
    </div>
    <footer>
        풋터
    </footer>
</body>
</html>