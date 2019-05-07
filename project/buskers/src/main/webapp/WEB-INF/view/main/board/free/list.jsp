<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
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
        
            <div class="free_board_search">
            </div>

            <table class="free_board">
                <tr>
                    <th class="free_board_no"></th>
                    <th class="free_board_title">제목</th>
                    <th class="free_board_writer">작성자</th>
                    <th class="free_board_date"><a>작성일</a></th>
                    <th class="free_board_view"><a class="fas fa-sort-down">조회</a></th>
                    <th class="free_board_like"><a class="fas fa-sort-down">추천</a></th>
                </tr>
                <tr>
                    <td><span class="board_notify">공지</span></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

            <div class="free_board_bottom">
                <a class="fas fa-pen">글쓰기</a>
                <a class="fas fa-sort-amount-up">정렬</a>
            </div>

            <br><br><br>

            <div class="footer"></div>
        </div>
    
    </div>

    <script>
        $(".free_board_view").click(function () {
            if ( $(this).children("a").attr("class") == "fas fa-sort-down" ) {
                $(this).children("a").attr("class", "fas fa-sort-up");
            } else {
                $(this).children("a").attr("class", "fas fa-sort-down");
            }
        });

        $(".free_board_like").click(function () {
            if ( $(this).children("a").attr("class") == "fas fa-sort-down" ) {
                $(this).children("a").attr("class", "fas fa-sort-up");
            } else {
                $(this).children("a").attr("class", "fas fa-sort-down");
            }
        });
    </script>
</body>
</html>