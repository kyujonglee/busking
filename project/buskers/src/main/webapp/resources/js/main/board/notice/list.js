
//top 버튼 클릭시 스크롤 위로
$(".notice-board-main__view-top-btn").click(function(){
	$("#notice_board_main__view-list").stop().animate({scrollTop:0},1000);
})

//삭제 이벤트
$(document).on("click","#notice_delete",function(){
	let boardNo = $("#board_no_button").data("bno");
	Swal.fire({
		  title: '정말 삭제하시겠습니까?',
		  type: 'info',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  cancelButtonText: '아니오',
		  confirmButtonText: '예',
	}).then((result) => {
		if (result.value) {
			$.ajax({
				data : {boardNo:boardNo},
				url : "delete.do",
			}).done(function(){
				window.location.href=listUrl;
			})
		}
	})
})

	
	
//글수정 버튼 클릭
$(document).on("click","#notice_modify",function(){
	
	let boardNo = $("#board_no_button").data("bno");
	
	$.ajax({
		data : {boardNo:boardNo},
		url : "detail-ajax.do",
	}).done(function(result){
		$(".button_bottom").html('<button class="notice_button" type="button" id="notice_modify_com">수정완료<input type="hidden" id="modify_board_no" value="'+result.board.boardNo+'"/></button>');
		$("#detail__title").html("<input type='text' class='title__input' value='"+result.board.title+"'/> ");
		$(".notice-board__view-content").html("<textarea type='text' class='content__input'>"+result.board.content+"</textarea>")
	})
});

//글수정 버튼완료 클릭
$(document).on("click","#notice_modify_com",function(){
	let title = $(".title__input").val();
	let content = $(".content__input").val();
	let boardNo = $("#modify_board_no").val();
	if(title.length > 26){
		Swal.fire({
			  title:"제목은 25자 이하로 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	if(title == ""){
		Swal.fire({
			  title:"제목을 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	if(content.length > 1000){
		Swal.fire({
			  title:"내용은 1000자 이하로 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	if(content == ""){
		Swal.fire({
			  title:"내용을 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	$.ajax({
		data : {boardNo:boardNo,title:title,content:content},
		url : "update.do",
	}).done(function(){
		let htr = "";
		htr += '<button class="notice_button reg_button" type="button" data-toggle="modal" data-target="#writeModal">글등록</button>';
		htr += '<button class="notice_button" type="button" id="notice_modify">수정</button>';
		htr += '<button class="notice_button" type="button" id="notice_delete">삭제</button>';
		htr += '<input type="hidden" id="board_no_button" data-bno="'+boardNo+'"/>'
		$(".button_bottom").html(htr);
		$("#detail__title").html(title);
		$(".notice-board__view-content").html(content);
    	let len = $(".notice-board-main__view-item").length;
    	
    	for(let i = 0; i < len ; i++){
        	let no = $(".notice-board-main__view-item:eq("+i+")").find("#boardNo").val();
        	if(no == boardNo){
        		$(".notice-board-main__view-item:eq("+i+")").find(".view-item__title").html(title);
        		$(".notice-board-main__view-item:eq("+i+")").find(".view-item__content").html(content);
        	}
    	}
	})
});
	
//글동룍
$(document).on("click","#regBtn",function(){
	title = $("#title").val();
	content = $("#content").val();
	
	//유효성검사
	if(title.length > 26){
		Swal.fire({
			  title:"제목은 25자 이하로 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	if(title == ""){
		Swal.fire({
			  title:"제목을 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	if(content.length > 1000){
		Swal.fire({
			  title:"내용은 1000자 이하로 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}
	if(content == ""){
		Swal.fire({
			  title:"내용을 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return;
	}

	$.ajax({
		data : {title:title,content:content},
		url : "insert.do",
	}).done(function(){
		$("#writeModal").hide();
//		window.location.href="/buskers/main/board/notice/list.do";
		window.location.href=listUrl;
	})
})
	
	
	
//onsubmit 시에 함수를 실행시켜서  글자수 검사
function confirmSearchType(){
	search = $("#searchType").val();
	if(search.length > 50){
		Swal.fire({
			  title:"50자 미만으로 검색어를 입력해주세요.",
			  type:'info',
			  timer:2000	
		});
		return false;
	}
}
	
function titleBold(){
	$(".view-content__header-title").html( $(".view-content__header-title").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
}
function contentBold(){
	$(".notice-board__view-content").html( $(".notice-board__view-content").html().replace(input, "<b class='search_keyword'>" + input + "</b>") );
}


let itemLength = $(".notice-board-main__view-item").length;
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
//검색어 없을경우
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
	$("#board_no_button").data("bno",boardNo);
	$.ajax({
		type:"POST",
		data:"boardNo="+boardNo,
		url:"detail-ajax.do",
	}).done(function(result){
 		//우측 내용변경
		let date = moment(result.board.regDat).format("YYYY-MM-DD HH:mm");

		$(".view-content__header-title").html("<span>"+result.board.title+"</span>");
		$("#detail_date").html(date);
		$("#detail_nickName").html(result.board.nickName);
		$(".notice-board__view-content").html(result.board.content);

		if (input != "" && searchType == "title" ) {
			titleBold();
		}
		if ( (input != "") && searchType == "content" ) {
			contentBold();
		}
		
		let htr = "";
		htr += '<button class="notice_button reg_button" type="button" data-toggle="modal" data-target="#writeModal">글등록</button>';
		htr += '<button class="notice_button" type="button" id="notice_modify">수정</button>';
		htr += '<button class="notice_button" type="button" id="notice_delete">삭제</button>';
		htr += '<input type="hidden" id="board_no_button" data-bno="'+boardNo+'"/>'
		$(".button_bottom").html(htr);
		
	}).fail(function(xhr){
		alert("서버 처리중 에러발생")
		console.dir(xhr);
	})
})
	
var orgindex = 0;
//마우스이동
$(document).on("click",".notice-board-main__view-item",function(){
	orgindex = $(this).position().top;
	$(".mouse-active").stop().animate({top:orgindex},1000);
	
})
	
// 마우스 왔을때 box 이동   
$(document).on("mouseenter",".notice-board-main__view-item",function(){
	let index = $(this).position().top;
	$(".mouse-active").stop().animate({top:index},300);
}).on("mouseleave",".notice-board-main__view-item",function(){
	$(".mouse-active").stop().animate({top:orgindex},300);
});
	
//5개씩 가져옴
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
		  
		  for(let i = 0 ; i < leng ; i ++){
		    let date = moment(result.listAjax.regDat).format("YYYY-MM-DD");  
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
