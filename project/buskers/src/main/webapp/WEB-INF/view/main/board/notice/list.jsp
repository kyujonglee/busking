<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/board/notice/notice.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Playball&display=swap" rel="stylesheet">
<title>공지사항</title>
<script>

</script>
<main class="notice-board main-board">
<div class="board">
	<header class="notice-board__header">
		<span class="notice-board__header-title">공지사항</span> <span
			class="notice-board__header-subtitle">ㅡ</span>
	</header>
	<div class="notice-board__main">
	    <header class="notice-board__main-header">
	    	<div class="notice-board-main-header__tabs">
	        	<div class="notice-board-main-header__tab tab-selected">
	          		news
	        	</div>
		        <div class="notice-board-main-header__tab">culture</div>
		        <div class="notice-board-main-header__tab">gallery</div>
	      	</div>
	    </header>
         <form action="<c:url value='list.do'/>" method="post" onSubmit="return confirmSearchType();"  id="searchForm">
	       <section class="notice-board-main__search">
	           <div class="notice-board-main__search-column">
	             <select class="notice-board-main__search-item" name="searchType">
	               <option value="title">제목</option>
	               <option value="content">내용</option>
	             </select>
	           </div>
	           <div class="notice-board-main__search-column">
	             <input class="notice-board-main__search-item" type="text" id="searchType" name="input" placeholder="검색어를 입력하세요." />
	           </div>
	           <div class="notice-board-main__search-column">
	             <button class="notice-board-main__search-item" id="search_button">검색</button>
	           </div>
	       </section>
	    </form>
	    <section class="notice-board-main__view">
	      <div class="notice-board-main__view-column" id="notice_board_main__view-list">
	          <button type="button" class="notice-board-main__view-top-btn">
	            <span class="view-top-btn">top</span>
	              <i class="fas fa-angle-up fa-2x"></i>
	          </button>
	
	        <ul class="notice-board-main__view-items" id="notice-board-main__view-items-wrapper">
			  <c:forEach var="board" items="${list}">
		          <li class="notice-board-main__view-item">
		          	<a>
		          	  <input type="hidden" id="boardNo" value="${board.boardNo}"/>
		              <div class="view-item__top">
		                <div class="view-item__header">
		                  <button class="view-item__notice-btn">공지</button>
		                  	<span class="view-item__title">${board.title}</span> 
		                </div>
		                <span class="view-item__date">
		                	<fmt:formatDate value="${board.regDate}" pattern="YYYY-MM-dd" />
		                </span>
		              </div>
		              <span class="view-item__content">
<%-- 		              	<c:out value='${board.content.replaceAll("\\\<.*?\\\>","")}'/> --%>
		              	${board.content}	
		              </span>
		              </a>
		          </li>
			  </c:forEach>	 
		     <li class="mouse-active-parent"><div class="mouse-active"></div></li>
	        </ul>
	        
	      </div>
	      
	      <div class="notice-board-main__view-column">
	        <header class="notice-board__view-content-header">
	          <div class="view-content__header-title" id="detail__title">
				<!-- 첫글의 제목 --> 
				<span id="detail__title">${list[0].title}</span>
	          </div>
	          <div class="view-content__header-content">
	            <div class="header-content__column">
	              <span class="header-content__column-name">작성자</span>
	              <span class="header-content__column-writer" id="detail_nickName">${list[0].nickName}</span>
	            </div>
	            <div class="header-content__column">
	              <span class="header-content__column-name" >작성일</span>
	              <span class="header-content__column-writer" id="detail_date">
					<!-- 첫글의 작성일 -->
					<fmt:formatDate value="${list[0].regDate}" pattern="YYYY-MM-dd HH:mm" />
				  </span>
	            </div>
	          </div>
	        </header>
	        	  <section class="notice-board__view-content" style="white-space:pre;">${list[0].content}</section>
	        	  	<c:if test="${sessionScope.user.memberNo eq 1 }">
	              	  	<span class="button_bottom">
		                	<button class="notice_button reg_button" type="button" data-toggle="modal" data-target="#writeModal">글등록</button>
		                	<button class="notice_button" type="button" id="notice_modify">수정</button>
		                	<button class="notice_button" type="button" id="notice_delete">삭제</button>
		                	<input type="hidden" id="board_no_button" data-bno="${list[0].boardNo}"/>
	                	</span>
                	</c:if>
                </div>
        	</section>
    	</div>
	</div>
</main>

<!-- Modal -->
<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <div class="modal_title">공지사항을 입력해주세요.</div>
        </div>
        <div class="modal-body">
	    	<div class="form-group">
	        	<div class="control-label">글제목 : </div>
		        <input type="text" class="form-control" id="title"/>
	        </div>
	    	<div class="form-group">
	        	<div class="control-label">글내용 : </div>
		        <textarea type="text" class="form-control" id="content"/></textarea>
	        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" id="regBtn">글등록</button>
        </div>
      </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>

<script>
	let searchType = "${param.searchType}";
	let input = "${param.input}";
	let listUrl = "<c:url value='/main/board/notice/list.do' />"
</script>
<script src="<c:url value='/resources/js/main/board/notice/list.js'/>"></script>


