<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/board/notice/notice.css'/>" />
<title>공지사항</title>
<main class="notice-board main-board">
<div class="board">
	<header class="notice-board__header">
		<span class="notice-board__header-title">notice</span> <span
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
	    <form>
	       <section class="notice-board-main__search">
	         <form action="<c:url value='list.do'/>" method="post" >
	           <div class="notice-board-main__search-column">
	             <select class="notice-board-main__search-item" name="searchType">
	               <option value="title">제목</option>
	               <option value="content">내용</option>
	             </select>
	           </div>
	           <div class="notice-board-main__search-column">
	             <input class="notice-board-main__search-item" type="text" name="input" placeholder="검색어를 입력하세요." />
	           </div>
	           <div class="notice-board-main__search-column">
	             <button class="notice-board-main__search-item">검색</button>
	           </div>
	         </form>
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
		              	${board.content }
		              </span>
		              </a>
		          </li>
			  </c:forEach>	 
		     <li class="mouse-active-parent"><div class="mouse-active"></div></li>
	        </ul>
	        
	      </div>
	      
	      <div class="notice-board-main__view-column">
	      	<input type="hidden" name="detail_boardNo" value="${list[0].boardNo}" id="detail_boardNo"/>
	        <header class="notice-board__view-content-header">
	          <div class="view-content__header-title">
				<!-- 첫글의 제목 --> 
				${list[0].title}
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
	        	  <section class="notice-board__view-content">
		          	<!-- 첫글의 내용 -->   
		          	${list[0].content}
              	  </section>
                </div>
        	</section>
    	</div>
	</div>
</main>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/main/board/notice/list.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script>

	let searchType = "${param.searchType}";
    let input = "${param.input}";
	let itemLength = $(".notice-board-main__view-item").length;
	
	
	function titleBold(){
		$(".view-content__header-title").html( $(".view-content__header-title").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
	}
	function contentBold(){
		$(".notice-board__view-content").html( $(".notice-board__view-content").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
	}
	//검색어 유지
    if (input != "" && searchType == "title" ) {
    	for (i = 0; i < itemLength; i++) {
			$(".view-item__title:eq(" + i + ")").html( $(".view-item__title:eq(" + i + ")").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
		};
		$(".notice-board-main__search-item").val(input);
		$(".notice-board-main__search-item > option:eq(0)").prop("selected", true);
		titleBold();
	};
	
	if ( (input != "") && searchType == "content" ) {
		for (i = 0; i < itemLength; i++) {
			$(".view-item__content:eq(" + i + ")").html( $(".view-item__content:eq(" + i + ")").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
		};
		$(".notice-board-main__search-item").val(input);
		$(".notice-board-main__search-item > option:eq(1)").prop("selected", true);
		contentBold();
	}
	
	
	//검색어가 4개 미만일경우에는 top버튼 삭제함
	
	if(itemLength < 4){
		$(".notice-board-main__view-top-btn").remove();
	}
	if(itemLength < 1){
		Swal.fire({
			  title:'등록된 게시글이 없습니다.',
			  type:'info',
			  timer:2000	
			});
	}
	
	//우측 공지사항 detail부분
	$(document).on("click",".notice-board-main__view-item",function(){
		let boardNo = $(this).find("#boardNo").val();
		$.ajax({
			type:"POST",
			data:"boardNo="+boardNo,
			url:"detail-ajax.do",
		}).done(function(result){
	 		//우측 내용변경
			let date = moment(result.board.regDat).format("YYYY-MM-DD HH:mm");
			$(".view-content__header-title").text("");
			$(".view-content__header-title").append(result.board.title);
	
			$("#detail_date").text("");
			$("#detail_date").append(date);
		
			$("#detail_nickName").text("");
			$("#detail_nickName").append(result.board.nickName);
			
			$(".notice-board__view-content").text("");
			$(".notice-board__view-content").append(result.board.content);

			$("#detail_boardNo").val(result.board.boardNo);
			if (input != "" && searchType == "title" ) {
				titleBold();
			}
			if ( (input != "") && searchType == "content" ) {
				contentBold();
			}
		}).fail(function(xhr){
			alert("서버 처리중 에러발생")
			console.dir(xhr);
		})
	})
	
	var orgindex = 0;
	$(document).on("click",".notice-board-main__view-item",function(){
		orgindex = $(this).position().top;
		$(".mouse-active").stop().animate({top:orgindex},1000);
		
	})
		
	// 마우스 왔을때 box 이동   
	$(document).on("mouseenter",".notice-board-main__view-item",function(){
		let index = $(this).position().top;
		console.log("자식좌표0"+$(this).position().top);
		$(".mouse-active").stop().animate({top:index},300);
	}).on("mouseleave",".notice-board-main__view-item",function(){
		console.log(orgindex);
		$(".mouse-active").stop().animate({top:orgindex},300);
	});
	
	//5개씩 가져옴..
	let pageNo = 0;
	// 무한스크롤
	$("#notice_board_main__view-list").scroll(
	  
	  function(){
	    let sh = $("#notice_board_main__view-list").scrollTop() + $("#notice_board_main__view-list").height();
	    let dh = $("#notice-board-main__view-items-wrapper").height();
	    
	    if(sh >= dh-10){
	      //Ajax로 서버의 데이터를 가져온다.
	      pageNo = pageNo+5;
	      $.ajax({
			
	    	type:"POST",
			data:{ pageNo : pageNo, searchType : searchType, input : input },
			url:"list-ajax.do",
	
	      }).done(function(result){
	    	  let leng= result.listAjax.length;
// 	    	  console.log(result.listAjax);
			  
			  for(let i = 0 ; i < leng ; i ++){
			    let date = moment(result.listAjax.regDat).format("YYYY-MM-DD");  
	    	   /*	  <li class="notice-board-main__view-item">
			        <a>
			      	  <input type="hidden" id="boardNo" value=`+""+result.listAjax[i].boardNo+""+`  />
			          <div class="view-item__top">
			              <button class="view-item__notice-btn">공지</button>
				            <div class="view-item__title">
			              	`+result.listAjax[i].title+`
			              </div>
			            <span class="view-item__date">
	 		            `+date+`
			            </span>
			          </div>
			          <span class="view-item__content">
		              	`+result.listAjax[i].content+`
			          </span>
			        </a>
			      </li>*/
			    $("#notice-board-main__view-items-wrapper").append( `
			    		<li class="notice-board-main__view-item">
			          	<a>
			          	<input type="hidden" id="boardNo" value=`+""+result.listAjax[i].boardNo+""+`  />
			              <div class="view-item__top">
			                <div class="view-item__header">
			                  <button class="view-item__notice-btn">공지</button>
			                  	<span class="view-item__title">`+result.listAjax[i].title+`</span> 
			                </div>
			                <span class="view-item__date">
			                `+date+`
			                </span>
			              </div>
			              <span class="view-item__content">
			              `+result.listAjax[i].content+`
			              </span>
			              </a>
			          </li>
			    `)
			  }
			  if (input != "" && searchType == "title" ) {
				  itemLength = $(".notice-board-main__view-item").length;
		    	 for (i = itemLength-5; i < itemLength; i++) {
		    		$(".view-item__title:eq(" + i + ")").html($(".view-item__title:eq(" + i + ")").html().replace(input, "<b class='search_keyword'>" + input + "</b>"));
				 };
	  		  };
			  if (input != "" && searchType == "content" ) {
				  itemLength = $(".notice-board-main__view-item").length;
		    	 for (i = itemLength-5; i < itemLength; i++) {
		    		$(".view-item__content:eq(" + i + ")").html($(".view-item__title:eq(" + i + ")").html().replace(input, "<b class='search_keyword'>" + input + "</b>"));
				 };
	  		  };
		  }).fail(function(xhr){
			alert("서버 처리중 에러발생")
			console.dir(xhr);
		  })
	    }
	  }
	)
	
	

</script>



