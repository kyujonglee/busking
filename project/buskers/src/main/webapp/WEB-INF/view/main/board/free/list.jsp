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
                <li><a href="<c:url value='/main/board/agency/list.do'/>"><span class="fas fa-building"></span>업체게시판</a></li>
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
                <tr id="free_board_head">
                    <th class="free_board_no"></th>
                    <th class="free_board_title">제목</th>
                    <th class="free_board_writer">작성자</th>
                    <th class="free_board_date"><a>작성일</a></th>
                    <th class="free_board_view"><a class="fas fa-caret-down" id="viewDESC">조회</a></th>
                    <th class="free_board_like"><a class="fas fa-caret-down" id="likeDESC">추천</a></th>
                </tr>
                
                <c:if test="${param.pageNo eq 1 || empty param.pageNo}">
					<c:forEach var="notify" items="${notifyList}">
               			<tr class="notice_table">
					    	<td><span class="board_notify">공지</span></td>
							<td class="board_title_left" id="board_notify_title">
								<a href="detail.do?boardNo=${notify.boardNo}">${notify.title}</a>
								<i class="fas fa-comment"><a>2</a></i>
							</td>
							<td>${notify.memberNo}</td>
						    <td><fmt:formatDate value="${notify.regDate}" pattern="MM-dd HH:mm" /></td>
						    <td>${notify.viewCnt}</td>
						    <td>${notify.likeCnt}</td>
						</tr>
					</c:forEach>
				</c:if>
				
               
                <c:forEach var="board" items="${list}">
               		<tr id="board_table">
				    	<td>${board.boardNo}</td>
						<td class="board_title_left">
							<a href="detail.do?boardNo=${board.boardNo}">${board.title}</a>
						</td>
						<td>${board.memberNo}</td>
					    <td><fmt:formatDate value="${board.regDate}" pattern="MM-dd HH:mm" /></td>
					    <td>${board.viewCnt}</td>
					    <td>${board.likeCnt}</td>
               		</tr>
				</c:forEach>
            </table>
			
			<br><br><br>
			
            <div class="free_board_bottom">
                <a class="fas fa-pen"> 글쓰기</a>
                <a class="fas fa-sort-amount-up"> 정렬</a>
            </div>

            <br><br><br>
            
            
            <div class="pagination">
                <c:if test="${pageResult.prev eq true}">
					<a href="list.do?pageNo=${pageResult.beginPage - 1}"><i class="fas fa-angle-left"></i></a>
				</c:if>
				<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
					<c:if test="${param.pageNo eq i}">
						<a href="list.do?pageNo=${i}" class="active">${i}</a>
					</c:if>
					<c:if test="${param.pageNo ne i}">
						<a href="list.do?pageNo=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageResult.next eq true}">
					<a href="list.do?pageNo=${pageResult.endPage + 1}"><i class="fas fa-angle-right"></i></a>
				</c:if>	
            </div>
            
            <br><br><br>

            <div class="footer"></div>
        </div>
    
    </div>

    <script>
		
	    if( $(".pagination > a").hasClass("active") == false ) {
	    	$(".pagination > a:eq(0)").attr("class", "active");
	    } 

    
	    $(".pagination > a").click(function() {
	        $(".pagination > a").attr("class", "disabled");
	        $(this).attr("class", "active");
	    });
    
        $(".free_board_view").click(function () {
            if ( $(this).children("a").attr("class") == "fas fa-caret-down" ) {
                $(this).children("a").attr("class", "fas fa-caret-up");
                $(this).children("a").attr("id", "viewASC");
            } else {
                $(this).children("a").attr("class", "fas fa-caret-down");
                $(this).children("a").attr("id", "viewDESC");
            }
        });

        $(".free_board_like").click(function () {
            if ( $(this).children("a").attr("class") == "fas fa-caret-down" ) {
                $(this).children("a").attr("class", "fas fa-caret-up");
                $(this).children("a").attr("id", "likeASC");
            } else {
                $(this).children("a").attr("class", "fas fa-caret-down");
                $(this).children("a").attr("id", "likeDESC");
            }
        });
        
        
        
        $(".free_board_view").on("click", function () {
   			let sort = $(".free_board_view > a").attr("id");
   			console.log(sort);
   			
   			$.ajax({
   				type: "POST",
   				url: "list-ajax.do",
   				data: "sort=" + sort,
   				dataType: "json",
   				success: function (sortResult) {
   					console.log(sortResult);
   					console.log("성공");
   					let notifyList = sortResult.notifyList;
   					let list = sortResult.list;
   					let pageResult = sortResult.pageResult;
   					let html = "";
   					
   					html += '<tr id="free_board_head">';
   					html += '<th class="free_board_no"></th>';
   					html += '<th class="free_board_title">제목</th>';
   					html += '<th class="free_board_writer">작성자</th>';
   					html += '<th class="free_board_date"><a>작성일</a></th>';
   					html += '<th class="free_board_view"><a class="fas fa-caret-down" id="viewDESC">조회</a></th>';
   					html += '<th class="free_board_like"><a class="fas fa-caret-down" id="likeDESC">추천</a></th>';
   					html += '</tr>';
   					
   					console.log(list.length);
   					for (i = 0; i < list.length; i++) {
   						let board = list[i];
   						html += '<tr id="board_table">';
   						html += 	'<td>' + board.boardNo + '</td>';
   						html += 	'<td class="board_title_left">';
   						html += 		'<a href="detail.do?boardNo=' + board.boardNo + '">' + board.title + '</a>';
   						html += 	'</td>';
   						html += 	'<td>' + board.memberNo + '</td>';
   						html += 	'<td>' + board.regDate + '</td>';
   						html += 	'<td>' + board.viewCnt + '</td>';
   						html += 	'<td>' + board.likeCnt + '</td>';
   						html += '</tr>';
   					}
   					$(".free_board").html(html);
   				}
   			});
        });
        
    </script>
</body>
</html>