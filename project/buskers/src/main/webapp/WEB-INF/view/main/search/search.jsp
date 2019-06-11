<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/main/search/search.css'/>" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"/>
<script
	src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
</script>
<title>Insert title here</title>
</head>
<body class="search__body">
    <div class="container">
    
   
        <div class="search__wrapper">
            <div class="search__result"><b>'${input}'</b>에 대한 검색결과 입니다.</div>
            <c:choose>
			 	<c:when test="${busker ne null}">
		            <div class="search__artist__wrapper">
		            	<div class="search__title">
               				아티스트 검색 결과
            			</div>			
		                <div class="artist__search__info">
		                    <div class="artist__search__image">
		                        <img src="<c:url value='/file/download.do'/>?path=${busker.profileImgPath}${busker.profileImg}">
		                    </div>
		                    <div class="artist__search__explain">
		                        <div class="busker_info busker_name"><a href="<c:url value='/artist/main/main.do?buskerNo=${busker.buskerNo}'/>">${busker.activityName }</a></div>
		                        <div class="busker_info">아티스트 소개  <span class="busker_info_db">${busker.intro }</span></div>
		                        <div class="busker_info">장르  <span class="busker_info_db">${busker.genre }</span></div>
		                        <div class="busker_info">주요 공연 장소  <span class="busker_info_db">${busker.location }</span></div>
		                        <div class="busker_info">주요 공연 시간  <span class="busker_info_db">${busker.time }</span></div>
		                    </div>
		                </div>
		                <div class="artist__search__video">
		                    <!--동영상 목록자리-->
		                </div>
		                <%-- <div class="artist__search__list" >
		                    <div class="search__title">아티스트 리스트</div>
		                    <div class="artist__search__list_detail">
		                        <div class="artist__search__list__info">
		                            <img src="<c:url value='/resources/img/common.jpg'/>">
		                            <div><a href="#">피아노치는 이정환</a></div>
		                            <div>이정환</div>
		                        </div>
		                    </div>
		                </div> --%>
		            </div>
	            </c:when>
	            <c:otherwise>
	            	<div class="no__result">
              	  		'<b>${input }</b>'에 대한 아티스트 정보가 없습니다.
              		</div>
	            </c:otherwise>
            </c:choose>
        </div>
        
        <div class="search__board__wrapper">
<!--         <hr> -->
            <div class="search__title">
               	게시물 검색 결과
            </div>
            
			<c:if test="${list eq '[]'}">
				<div class="no__result">
              	  '<b>${input }</b>'에 대한 게시물 정보가 없습니다.
              	</div>
			</c:if>            
           	<c:forEach var="board" items="${list}" begin="0" end="4" >
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
		                    <div class="board__content">${board.content}</div>
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
            
            
            
			<c:if test="${fn:length(list) gt '5' }">
	            <div class="board__more">
            		<a href="board-search-list.do?input=${input}">
            			게시글 검색결과 더보기
            			<i class="fas fa-chevron-right"></i>
            		</a>
	            </div>
			</c:if>
			
            
            
<!--         <hr> -->
        </div>
    </div>
    <script>
    	$(".search__board__wrapper div:eq(1)").addClass("first__board__list__top");
    	
		
// 	    for (i = 0; i < $(".board__content").length; i++) {
// 	    	text = $(".board__content:eq("+i+")").text();
			
// 	        text = text.replace(/<br\/>/ig, "\n");
	    	
// 	    	let newText = text.replace(/(<([^>]+)>)/ig,"");
// 			$(".board__content:eq(" + i + ")").text(newText);


// 		}
    
    </script>
</body>
</html>