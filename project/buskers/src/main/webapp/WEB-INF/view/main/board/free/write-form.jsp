<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/agency/agency.css'/>" />
		<main class="main-freeboard">
			<div class="agency">
			<div class="freeboard__insert">
				<div class="board_title">
               	 <div class="board_title_underline">
                    <a href="<c:url value='/main/board/free/list.do'/>">자유게시판</a>
               	 </div>
        	    </div>
			
			<form action="write.do" method="get" id="write_form">
	            <div class="board_head_line">
	                <span class="board_img_title">
	                	<img src="<c:url value='/resources/img/boyoung.jpg'/>"/>
	                </span>
	                <input class="write_form_title" name="title" placeholder="제목을 입력하세요." />
	            </div>
	            
	            <textarea class="board_write_form" name="content"></textarea>
	            
            
            
          	  <br><br><br>
        
	        	<div class="free_board_detail_bottom">
	        		<a class="fas fa-edit"> 등록</a>
	                <a href="<c:url value='/main/board/free/list.do'/>" class="fas fa-list-ul"> 목록</a>
	                <input type="hidden" name="memberNo" value="${sessionScope.user.memberNo}">
	            </div>

          	  <br><br><br>
			</form>
				</div>
				</div>
			</main>
         	   <div class="footer"></div>
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
   			
    		$("#write_form").submit();
    	});
	    
    
	    $(document).ready(function() {
	        $('.board_write_form').summernote({
                height: 500,                 // set editor height
                width: 1060,
                focus: false                  // set focus to editable area after initializing summernote
	        });
	    });
    </script>
    <script src="<c:url value='/resources/js/main/board/agency/side-bar.js'/>"></script>
</body>
</html>