<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
    <title>Document</title>
</head>
<body>
    
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
			<div class="freeboard__insert">
				<div class="board_title">
               	 <div class="board_title_underline">
                    <a href="<c:url value='/main/board/qna/list.do'/>">질문게시판</a>
               	 </div>
        	    </div>
			
			<form action="write.do" method="get" id="write_from">
	            <div class="board_head_line">
	                <span class="board_img_title">
	                	<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
	                </span>
	                <input class="write_form_title" name="title" placeholder="제목을 입력하세요." />
	            </div>
	            
	            <textarea class="board_write_form" id="summernote" name="content"></textarea>
	            
            
            
          	  <br><br><br>
        
	        	<div class="free_board_detail_bottom">
	        		<a class="fas fa-edit"> 등록</a>
	                <a href="<c:url value='/main/board/qna/list.do'/>" class="fas fa-list-ul"> 목록</a>
	                <input type="hidden" name="memberNo" value="2">
	            </div>

          	  <br><br><br>
			</form>
				</div>
				</div>
			</main>
         	   <div class="footer"></div>
		</div>
	</div>
    <script>
    $(".fa-edit").click(function () {
			if ( $(".write_form_title").val() == "" ) {
				alert("제목을 입력하세요");
				return;
			}
			
			if ( $(".board_write_form").val() == "" ) {
				alert("내용을 입력하세요");
				return;
			}
			
		$("#write_from").submit();
	});
    
    $(document).ready(function(){
   	   $('#summernote').summernote({
   	    	height: 500,                 
   	        width: 1060,
   	        focus: false,
   	        callbacks: { // 콜백을 사용
   		        // 이미지를 업로드할 경우 이벤트를 발생
   		        onImageUpload: function(files, editor, welEditable) {
   		        	alert("콜백실행")
   			    	sendFile(files[0],editor,welEditable);
   		        	alert("콜백종료")
   				}
   			}
   	    });
		////////업로드시 실행할 함수
	   	function sendFile(file,editor,welEditable) {
	        // 파일 전송을 위한 폼생성
			data = new FormData();
		    data.append("file", file);
		    $.ajax({ // ajax를 통해 파일 업로드 처리
		        data : data,
		        type : "POST",
		        url :  "<c:url value="/main/board/qna/imageupload.do" />",
		        cache : false,
		        contentType : false,
		        processData : false,
		        success : function(url) { // 처리가 성공할 경우
	             alert("sendFile함수 들어옴")
	             // 에디터에 이미지 출력
	             alert(url);
	             $("#summernote").summernote('editor.insertImage', url);
		        }
		    });
		}  
    })
   
 
    


    </script>
</body>
</html>