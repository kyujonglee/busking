<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/search/search-board-list.css'/>" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
<script
	src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<title>board-search-list</title>
<body class="search__body">
    <div class="container">
        <div class="search__wrapper">
            <div class="search__result"><b>'${input}'</b>에 대한 검색결과 입니다.</div>
        </div>
        <div class="search__board__wrapper">
        
			<c:if test="${list eq '[]'}">
				<div class="no__result">
              	  '<b>${input }</b>'에 대한 게시물 정보가 없습니다.
              	</div>
			</c:if>            
           	<c:forEach var="board" items="${list}" begin="0" end="9">
           		<!-- 그룹no가 0일경우는 사진이 없는경우임 -->
				
           		<c:if test="${board.groupNo eq 0}">
           			<div class="search__board__detail_not_photo">
		                <div class="search__board__board__wapper">
		                    <div class="board__title">
		                    	<c:if test="${board.boardType eq 'q' }">
		                        	<a href="<c:url value='/main/board/qna/detail.do?boardNo=${board.boardNo}'/>">${board.title}</a>
	                        	</c:if>
	                        	<c:if test="${board.boardType eq 'f' }">
		                        	<a href="<c:url value='/main/board/free/detail.do?boardNo=${board.boardNo}'/>">${board.title}</a>
	                        	</c:if>
	                        	<span class="board__date">
		                        	<i class="far fa-clock"></i>
									<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
								</span>
                     		</div>
		                    <div class="board__content"><c:out value='${board.content.replaceAll("\\\<.*?\\\>","")}' /></div>
		                    <div class="board__info">
                        		<c:if test="${board.boardType eq 'q' }">
	                        		<a href= "<c:url value='/main/board/qna/list.do'/>" class="kind__board">질문게시판</a>
	                        	</c:if>
	                        	<c:if test="${board.boardType eq 'f' }">
	                        		<a href= "<c:url value='/main/board/free/list.do'/>" class="kind__board">자유게시판</a>
	                        	</c:if>
	                    	</div>
                    	</div>
		            </div>
           		</c:if>
           	
            <!-- 사진있을 경우는  추가해줘야함..-->
           		<c:if test="${board.groupNo ne 0 }">
		            <div class="search__board__detail">
		                <div class="board__detail__img__wrapper">
      	                    <a href="<c:url value='/main/board/qna/detail.do?boardNo=${board.boardNo}'/>">
		                		<img src="<c:url value='/file/download.do?path=${board.path}${board.systemName}' />">
	                		</a>
		                </div>
		                <div class="search__board__board__wapper">
		                    <div class="board__title">
		                        <c:if test="${board.boardType eq 'q' }">
		                        	<a href="<c:url value='/main/board/qna/detail.do?boardNo=${board.boardNo}'/>">${board.title}</a>
	                        	</c:if>
	                        	<c:if test="${board.boardType eq 'f' }">
		                        	<a href="<c:url value='/main/board/free/detail.do?boardNo=${board.boardNo}'/>">${board.title}</a>
	                        	</c:if>
	                        	<span class="board__date">
		                        	<i class="far fa-clock"></i>
									<fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" />
								</span>
		                    </div>
		                    <div class="board__content"><c:out value='${board.content.replaceAll("\\\<.*?\\\>","")}' /></div>
		                    <div class="board__info">
		                        <a href="#">
		                        	<c:if test="${board.boardType eq 'q' }">
	                        			<a href= "<c:url value='/main/board/qna/list.do'/>" class="kind__board">질문게시판</a>
	                        		</c:if>
	                    	    	<c:if test="${board.boardType eq 'f' }">
	                        			<a href= "<c:url value='/main/board/free/list.do'/> " class="kind__board">자유게시판</a>
	                       		 	</c:if>
		                        </a>
		                        
		                    </div>
		                </div>
		            </div>
           		</c:if>
           	</c:forEach>
            
            
            
		  <div class="pagination">
	          <c:if test="${pageResult.prev eq true}">
			      <a href="board-search-list.do?pageNo=${pageResult.beginPage - 1}&input=${param.input}">
				      <i class="fas fa-angle-left"></i>
			 	  </a>
			  </c:if>
              
              
              <c:forEach var="i" begin="${pageResult.beginPage}" end="${pageResult.endPage}">
			  	<c:if test="${param.pageNo eq i}">
					<a href="board-search-list.do?pageNo=${i}&input=${param.input}" class="active">
						${i}
					</a>
				</c:if>
				<c:if test="${param.pageNo ne i}">
					<a href="board-search-list.do?pageNo=${i}&input=${param.input}">
						${i}
					</a>
				</c:if>
			  </c:forEach>
			  
			  
			  <c:if test="${pageResult.next eq true}">
				<a href="board-search-list.do?pageNo=${pageResult.endPage + 1}&input=${param.input}">
					<i class="fas fa-angle-right"></i>
				</a>
			</c:if>
	         
	         
          </div>
            
<!--         <hr> -->
        </div>
    </div>
    <script>
    	let pageNo = "${param.pageNo}";
    </script>
    <script src="<c:url value='/resources/js/main/search/board-search-list.js'/>"></script>
</body>
