<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="<c:url value='/resources/css/main/board/qna/writeform.css'/>"/>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<%--     <link rel="stylesheet" href="<c:url value='/resources/js/main/board/qna/qnaboardwriteform.js'/>"/>     --%>
   
</head>
<body>
 <header>
        헤더
    </header>
    <div class="container">
        <form action="write.do" method="get">
            <div class="container_board">
                <div class="board_head">새 게시글</div>
                <hr class="write_head_line">
                <div class="title">제목</div>
                <input class="title_write" type="text" name="title" id="title" placeholder="제목 입력"/>
                <div class="title">본문</div>
                <!-- 히든 멤버번호 시범용 -->
                <input type="hidden" name="memberNo" value="1">
                <textarea class="content_write" type="text" name="content" id="summernote"></textarea>

                <div class="button">
                    <button class="button_reg">글등록</button>
                </div>
            </div>
        </form>
    </div>
    <footer>
        풋터
    </footer>
    
<script>
$(document).ready(function() {
  $('#summernote').summernote({
    height: 300,
    minHeight: null,
    maxHeight: null,
    focus: true,
    callbacks: {
      onImageUpload: function(files, editor, welEditable) {
        for (var i = files.length - 1; i >= 0; i--) {
          sendFile(files[i], this);
        }
      }
    } 
  });
});

function sendFile(file, el) {
  var form_data = new FormData();
  form_data.append('file', file);
  $.ajax({
    data: form_data,
    type: "POST",
    url: 'image.do',
    cache: false,
    contentType: false,
    enctype: 'multipart/form-data',
    processData: false,
    success: function(url) {
      $(el).summernote('editor.insertImage', url);
      $('#imageBoard > ul').append('<li><img src="'+url+'" width="480" height="auto"/></li>');
    }
  });
} 
</script>



</body>
</html>