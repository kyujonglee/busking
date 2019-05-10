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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <link href="https://fonts.googleapis.com/css?family=Italianno" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>
    <link rel="stylesheet" href="<c:url value='/resources/css/main/board/free/koo.css'/>"/>
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
                <li><a href="<c:url value='/main/board/qna/list.do'/>"><span class="fas fa-question"></span>질문게시판</a></li>
                <li><a href="<c:url value='/main/board/agency/list.do'/>"><span class="fas fa-building"></span>업체게시판</a></li>
            </ul>
        </div>



        <div class="board_container_body">
            <div class="board_title">
                <div class="board_title_underline">
                    <a href="<c:url value='/main/board/free/list.do'/>">질문게시판</a>
                </div>
                
            </div>
        
            <div class="free_board_search">
	            <form action="list.do" class="search_form">
	            	<select class= "search_form_option" name='searchType'>
					    <option value='title'>제목</option>
					    <option value='content'>내용</option>
					    <option value='writer'>작성자</option>
					</select>
	            	
		            <input class="search_form_input" name="input" placeholder="검색어를 입력하세요." />
		            
		            <button class="search_form_button">검색</button>
		        </form>
            </div>

            <table class="free_board">
                <tr class="free_board_head">
                    <th class="free_board_no"></th>
                    <th class="free_board_title">제목</th>
                    <th class="free_board_writer">작성자</th>
                    <th class="free_board_date"><a class="fas fa-caret-down" id="dateDESC">작성일</a></th>
                    <th class="free_board_view"><a class="fas fa-caret-down" id="viewDESC">조회</a></th>
                    <th class="free_board_like"><a class="fas fa-caret-down" id="likeDESC">추천</a></th>
                </tr>
                
                <c:if test="${param.pageNo eq 1 || empty param.pageNo}">
					<c:forEach var="notify" items="${notifyList}">
               			<tr class="free_board_notice">
					    	<td><span class="board_notify">공지</span></td>
							<td class="board_title_left" id="board_notify_title">
								<a href="detail.do?no=${notify.boardNo}">${notify.title}</a>
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
               		<tr class="free_board_list">
				    	<td>${board.boardNo}</td>
						<td class="board_title_left">
						<c:if test="${empty param.pageNo}">
							<a href="detail.do?no=${board.boardNo}&pageNo=1&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}">${board.title}</a>
						</c:if>
						<c:if test="${!empty param.pageNo}">
							<a href="detail.do?no=${board.boardNo}&pageNo=${param.pageNo}&input=${param.input}&sortType=${param.sortType}&searchType=${param.searchType}">${board.title}</a>
						</c:if>
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
                <a href="writeform.do" class="fas fa-pen"> 글쓰기</a>
                <a href="list.do" class="fas fa-sort-amount-up"> 초기화</a>
            </div>

            <br><br><br>
            
            
            <div class="pagination">
                <c:if test="${pageResult.prev eq true}">
					<a href="list.do?pageNo=${pageResult.beginPage - 1}&sortType=${param.sortType}&searchType=${param.searchType}&input=${param.input}">
					<i class="fas fa-angle-left"></i></a>
				</c:if>
				<c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
					<c:if test="${param.pageNo eq i}">
						<a href="list.do?pageNo=${i}&sortType=${param.sortType}&searchType=${param.searchType}&input=${param.input}" class="active">${i}</a>
					</c:if>
					<c:if test="${param.pageNo ne i}">
						<a href="list.do?pageNo=${i}&sortType=${param.sortType}&searchType=${param.searchType}&input=${param.input}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${pageResult.next eq true}">
					<a href="list.do?pageNo=${pageResult.endPage + 1}&sortType=${param.sortType}&searchType=${param.searchType}&input=${param.input}">
					<i class="fas fa-angle-right"></i></a>
				</c:if>	
            </div>
            
            <br><br><br>

            <div class="footer"></div>
        </div>
    
    </div>

    <script>
    	let sortType = "${param.sortType}";
    	let searchType = "${param.searchType}";
    	let input = "${param.input}";
    	
    	if ( (input != "") && searchType == "title" ) {
    		for (i = 0; i < $(".board_title_left > a").length; i++) {
    			$(".board_title_left > a:eq(" + i + ")").html( $(".board_title_left > a:eq(" + i + ")").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
    		};
    		$(".search_form_input").val(input);
    		$(".search_form_option > option:eq(0)").prop("selected", true);
    	};
    	
    	if ( (input != "") && searchType == "content" ) {
    		$(".search_form_input").val(input);
    		$(".search_form_option > option:eq(1)").prop("selected", true);
    	};
		
	    if( $(".pagination > a").hasClass("active") == false ) {
	    	$(".pagination > a:eq(0)").attr("class", "active");
	    } ;

	    $(".pagination > a").click(function() {
	        $(".pagination > a").attr("class", "disabled");
	        $(this).attr("class", "active");
	    });
    
	    /** 정렬 아이콘 변경 */ 
        $(".free_board_date").click(function () {
            if ( $(this).children("a").attr("id") == "dateDESC" ) {
                $(this).children("a").attr("id", "dateASC");
                $(this).children("a").attr("class", "fas fa-caret-down");
            } else {
                $(this).children("a").attr("id", "dateDESC");
                $(this).children("a").attr("class", "fas fa-caret-up");
            };
        });
        
        $(".free_board_view").click(function () {
            if ( $(this).children("a").attr("id") == "viewDESC" ) {
                $(this).children("a").attr("id", "viewASC");
                $(this).children("a").attr("class", "fas fa-caret-down");
            } else {
                $(this).children("a").attr("id", "viewDESC");
                $(this).children("a").attr("class", "fas fa-caret-up");
            };
        });
        
        $(".free_board_like").click(function () {
            if ( $(this).children("a").attr("id") == "likeDESC" ) {
                $(this).children("a").attr("id", "likeASC");
                $(this).children("a").attr("class", "fas fa-caret-down");
            } else {
                $(this).children("a").attr("id", "likeDESC");
                $(this).children("a").attr("class", "fas fa-caret-up");
            }
        });

        /** 정렬 버튼 변경 */
        switch (sortType) {
	        case "viewDESC":
	        	$(".free_board_view > a").attr("class", "fas fa-caret-down");
	        	break;
	        case "viewASC":
	        	$(".free_board_view > a").attr("class", "fas fa-caret-up");
	        	break;
	        case "likeDESC":
	        	$(".free_board_like > a").attr("class", "fas fa-caret-down");
	        	break;
	        case "likeASC":
	        	$(".free_board_like > a").attr("class", "fas fa-caret-up");
	        	break;
	        case "dateDESC":
	        	$(".free_board_date > a").attr("class", "fas fa-caret-down");
	        	break;
	        case "dateASC":
	        	$(".free_board_date > a").attr("class", "fas fa-caret-up");
	        	break;
	       	default:
	       		$(".free_board_view > a").attr("class", "fas fa-caret-down");
	       		break;
        }
		
        
        $(".free_board_head > th > a").on("click", function () {
        	
        	$(".free_board_head > th > a").css({
        		"text-decoration": ""
        	});
        	
        	console.log( $(this).attr("id") );
        	$(this).css({
        		"text-decoration": "underline"
        	});
   			let sort = $(this).attr("id");
   			console.log(sort);
   			let pageNo = "${param.pageNo}";
   			if (pageNo == "") {
   				pageNo = 1;
   			}
   			
   			$.ajax({
   				type: "POST",
   				url: "list-ajax.do",
   				data: {sortType : sort, pageNo : pageNo, searchType : searchType, input : input},
   				dataType: "json",
   				success: function (sortResult) {
   					let notifyList = sortResult.notifyList;
   					let list = sortResult.list;
   					let pageResult = sortResult.pageResult;
   					let html = "";
   					let pageHtml = "";
   					let beginPage = pageResult.beginPage + 1;
   					let endPage = pageResult.endPage + 1;
   					
   					for (i = 0; i < list.length; i++) {
   						let board = list[i];
	   					let date = moment(board.regDate).format("MM-DD HH:mm");
	   					
   						html += '<tr id="board_table">';
   						html += 	'<td>' + board.boardNo + '</td>';
   						html += 	'<td class="board_title_left">';
   						html += 		'<a href="detail.do?boardNo=' + board.boardNo + '&pageNo=' + pageNo + '&sortType=' + sort + '&input=' + input + '&searchType=' + searchType + '">' + board.title + '</a>';
   						html += 	'</td>';
   						html += 	'<td>' + board.memberNo + '</td>';
   						html += 	'<td>' + date + '</td>';
   						html += 	'<td>' + board.viewCnt + '</td>';
   						html += 	'<td>' + board.likeCnt + '</td>';
   						html += '</tr>';
   					}
  
   					/** 페이징 */
   					if (pageResult.prev) {
   						pageHtml += '<a href="list.do?pageNo=' + beginPage + '&sortType=' + sort + '&input=' + input + '&searchType=' + searchType + '">';
   						pageHtml += '<i class="fas fa-angle-left"></i></a>';
   					}
   					
   					for (i = 1; i <= pageResult.endPage; i++) {
   						if (pageNo == i) {
   							pageHtml += '<a href="list.do?pageNo=' + i + '&sortType=' + sort + '&input=' + input + '&searchType=' + searchType + '" class="active">' + i + '</a>';
   							continue;
   						}
   						pageHtml += '<a href="list.do?pageNo=' + i + '&sortType=' + sort + '&input=' + input + '&searchType=' + searchType + '">' + i + '</a>';
   					}
   					
   					if (pageResult.next) {
   						pageHtml += '<a href="list.do?pageNo=' + endPage + '&sortType=' + sort + '&input=' + input + '&searchType=' + searchType + '">';
   						pageHtml += '<i class="fas fa-angle-right"></i></a>';
   					}
					
   					$(".pagination").html(pageHtml);
   					
   					if ( $(".free_board tr").hasClass("free_board_notice") ) {
   						$(".free_board_notice:last").nextAll().remove();
   						$(".free_board > tbody").append(html);
   					} else {
   						$(".free_board_head").nextAll().remove();
   						$(".free_board > tbody").append(html);
   					}
   					
   					if ( (input != "") && searchType == "title" ) {
   		        		for (i = 0; i < $(".board_title_left > a").length; i++) {
   		        			$(".board_title_left > a:eq(" + i + ")").html( $(".board_title_left > a:eq(" + i + ")").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
   		        		};
   		        	};
   				}
   			});
        });
        
    </script>
</body>
</html>