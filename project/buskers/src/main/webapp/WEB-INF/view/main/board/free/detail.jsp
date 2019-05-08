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
    
    <div class="container">
        <div class="container_head">
            buskers
        </div>

        <div class="container_side">
            <ul class="side_menu">
                <li></li>
                <li><a href="#"><span class="fas fa-bullhorn"></span>공지사항</a></li>
                <li><a href="#"><span class="fas fa-comments"></span>자유게시판</a></li>
                <li><a href="#"><span class="fas fa-question"></span>질문게시판</a></li>
                <li><a href="#"><span class="fas fa-building"></span>업체게시판</a></li>
            </ul>
        </div>

        <div class="container_body">
            <div class="board_title">
                <div class="board_title_underline">
                    <a>자유게시판</a>
                </div>
            </div>

            <div class="board_head_line">
                <span class="board_img_title">
    
                </span>
            </div>
            
            
            <div class="board_article">
                <div class="board_article_info">
                    <div class="board_article_info_left">
                        <i class="fas fa-user"></i><span>ads</span>
                        <i class="far fa-eye"></i><span>2</span>
                        <i class="fas fa-heart"></i><span>2</span>
                    </div>

                    <div class="board_article_info_right">
                            <i class="fas fa-clock"></i><span>2014-05-14</span>
                    </div>
                </div>
            </div>
        

            <br><br><br>

            <div class="footer"></div>
        </div>
    
    </div>
</body>
</html>