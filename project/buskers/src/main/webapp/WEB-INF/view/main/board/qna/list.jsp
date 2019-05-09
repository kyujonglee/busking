<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<link rel="stylesheet" href="<c:url value='/resources/css/main/board/qna/list.css'/>"/>
</head>
<body>
    <div class="container">
        <form action="" method="post" enctype="multipart/form-data" name="">
            <div class="container_board">
                <div class="board_head">질문답변 게시판</div>
                <hr class="write_head_line">
                <div class="list_title">
                    <div>제목</div>
                    <div>글쓴이</div>
                    <div>작성일</div>
                    <div>조회수</div>
                    <div>좋아요</div>
                </div>
	          
               <div class="list_content">
					<c:forEach var="board" items="${list}">
					    <div class='board_title'><a href='detail.do?no=${board.boardNo}'>${board.title }</a></div>
					    <div>${board.memberNo}</div>
					    <div><fmt:formatDate value="${board.regDate}" pattern="MM-dd" /></div>
	        			<div>${board.viewCnt}</div>
	     				<div>${board.likeCnt}</div>  
					</c:forEach>
               </div>
              
              
                <div class="page">
                   <c:if test="${pageResult.prev eq true}">
					<a href="list.do?pageNo=${pageResult.beginPage - 1}">이전<i class="fas fa-angle-left"></i></a>
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
						<a href="list.do?pageNo=${pageResult.endPage + 1}">다음<i class="fas fa-angle-right"></i></a>
					</c:if>	
                </div>            
                <hr>
                <div class="list_bot">
                    <div></div> 
                    <div class="search_line">
                        <select name="searchType">
                            <option value="t">제목</option>
                            <option value="c">내용</option>
                            <option value="tc">제목+내용</option>
                            <option value="w">글쓴이</option>
                        </select>
                        <input type="text" name="keyword"/>
                        <button class="search" id="search_button">검색</button>
                    </div> 
                    <div>
                        <a href="writeform.do"><button  type="button" class="button_reg">글등록</button></a>
                    </div> 
                </div>
            </div>
        </form>
    </div>            
<script>

if( $(".page > a").hasClass("active") == false ) {
	$(".page > a:eq(0)").attr("class", "active");
} 


    /* let result = function(){
        let txt = "";
        for(let i = 0; i < 15; i++){
            txt += `   
        <div class='list_content_detail'>${i+1}</div>
        <div class='board_title'>안녕하세요</div>
        <div>이후승</div>
        <div>2019/04/05</div>
        <div>15</div>
        <div>33</div>
        `
        }
        return txt;
    }
    for(let i = 0; i < 15; i++){
        $(".list_content").html(result);
    } */
</script>
</body>
</html>