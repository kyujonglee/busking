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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Italianno" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/detail.css'/>"/>
    <title>Document</title>
</head>
<body>
    
    <div class="board_container">
        <div class="board_container_head">
            buskers
        </div>

        <div class="container_side">
            <ul class="side_menu">
                <li></li>
                <li><a href="#"><span class="fas fa-bullhorn"></span>공지사항</a></li>
                <li><a href="#"><span class="fas fa-comments"></span>자유게시판</a></li>
                <li><a href="#"><span class="fas fa-question"></span>질문게시판</a></li>
                <li><a href="<c:url value='/main/board/agency/list.do'/>"><span class="fas fa-building"></span>업체게시판</a></li>
            </ul>
        </div>

        <div class="board_container_body">
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
                        <i class="fas fa-user"></i><span><c:out value="${board.memberNo}" /></span>
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
                
                <div class="board_article_comment">
                	<div class="board_article_comment_amount">
	                	<div class="board_article_comment_amount_underline">
	                		<i class="fas fa-comment-dots fa-2x"></i>
	                		<span><b class="comment_highlight">3</b>개의 댓글</span>
	                	</div>
	                	
                	</div>
                	<div class="board_article_comment_list">
                		<div class="comment_list">sdfsdfd
                		</div>
                	</div>
                </div>
                
            </div>
            
            <br><br><br>
        
        	<div class="free_board_detail_bottom">
                <a href="<c:url value='/main/board/free/list.do?pageNo=${param.pageNo}&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}'/>" class="fas fa-list-ul"> 목록</a>
            </div>

            <br><br><br>

            <div class="footer"></div>
        </div>
    
    </div>
    
    <script>
    	
    </script>
</body>
</html>