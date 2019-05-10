<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    	
    </script>
</body>
</html>