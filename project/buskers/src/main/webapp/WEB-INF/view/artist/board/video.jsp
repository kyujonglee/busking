<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/artist/board/video.css' />" />
<section>
	<div class="video_container">
		<div class="video_header">
			<div class='row'>
				<div class="col-lg-12">
			    	<div class="panel panel-default">
			        	<div class="panel-heading">
			            	<i class="fas fa-video"></i> YouTube
		            		<c:if test="${param.buskerNo eq sessionScope.user.busker.buskerNo }">
		        				<button id='addVideoBtn' class='btn btn-primary btn-xs pull-right' data-toggle="modal" data-target="#videoModal">New Video</button>
		      				</c:if>
			      		</div>      
			        	<div class="panel-body">        
			        		<div class="video_body">
				        		
			        		</div>
	     	                <%-- <div class="pagination">
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
							</c:if>--%>
		     	    	</div> 
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="videoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <div class="modal_title">유튜브 url을 입력해주세요.</div>
        </div>
        <div class="modal-body">
	    	<div class="form-group">
	        	<div class="control-label">글제목 : </div>
		        <input type="text" class="form-control" id="title"/>
	        </div>
	    	<div class="form-group">
	        	<div class="control-label">YouTube : </div>
		        <input type="text" class="form-control" id="videoUrl"/>
	        </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" id="regBtn">글등록</button>
        </div>
      </div>
    </div>
</div>
<script>
	let date = new Date();
	let year = date.getFullYear(); 
	let month = new String(date.getMonth()+1); 
	let day = new String(date.getDate()); 
	let week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
	let dayOfWeek = week[date.getDay()];
	let selDate = year + "-" + month + "-" + day;
	let realPage = 1;

	//수정버튼 클릭시에 다른 수정버튼을 숨김
	$(document).on("click",".videoMenu",function(event){
	    $('.video_menu_modify').hide();
	    event.stopPropagation();   
	    $(this).children(".video_menu_modify").toggle();
    });
        
    $(".panel-body").click(function() {
        $('.video_menu_modify').hide();
    });








	
	//비디오 삭제
	$(document).on("click",".video_menu_modify",function(){
		if(confirm("정말로 삭제하시겠습니까?") == true){
			let videoNo  = $(this).data("vno");
			$.ajax({
				data : {videoNo : videoNo},
				url : "video-delete-ajax.do",
			}).done(function(){
				$(".panel-body").html("<div class='video_body'></div>");
				page = realPage;
				spage = (page -1) * 6;
				$(".panel-body").html("<div class='video_body'></div>");
				showList(spage);
				pageList(page);
				
				
				//비디오 수 새로고침
				$.ajax({
					url : "<c:url value='/artist/main/main-ajax.do'/>",
					dateType : "json",
					data : "buskerNo="+buskerNo
				}).done(map => {
					const videoCount = map.videoCount;
					$("#videoCount").text(videoCount);
				});	
			})
		}
	});
	
	//등록버튼클릭
	$("#regBtn").click(function(){
		let title = $("#title").val();
		let videoUrl = $("#videoUrl").val();
		if(title==""){
			alert("제목을 입력해주세요.")
			return;
		}
		if(title.length>21){
			alert("제목의 길이가 너무 깁니다. 20자 이하로 입력해주세요")
			return;
		}
		if(videoUrl.includes("www.youtube.com") == false){
			alert("유튜브 url을 입력해주세요.");
			return;
		}
		
		let buskerNo = "${sessionScope.user.busker.buskerNo}";
		
		let url = "https://www.youtube.com/embed/";
		
		let code = videoUrl.split('?');
		code = code[1].split('=');
		code = code[1].split('&');
		let yUrl = url+code[0];

		
		$.ajax({
			type: 'post',
			data : {title:title,url:yUrl, buskerNo:buskerNo},
			url:"video-regist-ajax.do",
		}).done(function(){
		    title = $("#title").val("");
		    videoUrl = $("#videoUrl").val("");
			$("#videoModal").hide();
			$(".panel-body").html("<div class='video_body'></div>");		
			showList(0);
			pageList(1);
			
			
			//비디오 갯수 새로고침
			$.ajax({
				url : "<c:url value='/artist/main/main-ajax.do'/>",
				dateType : "json",
				data : "buskerNo="+buskerNo
			}).done(map => {
				const videoCount = map.videoCount;
				$("#videoCount").text(videoCount);
			});	
			
		})
	})
	
	//비디오 리스트를 출력함.	
	function showList(num){
		buskerNo = ${param.buskerNo};
		$.ajax({
			data : {buskerNo:buskerNo,pageNo:num},
			url : "video-select-ajax.do",
		}).done(function(result){
			if(result.list.length == 0){
				$(".panel-body").prepend("<div class='no_video'>버스커가 공유한 동영상이 없습니다.</div>");
			}
			for(let i = 0; i < result.list.length ; i++){
				let htrr = "";
				htrr += '<div class="video">';
				htrr += '<iframe width="100%" height="220px" src='+result.list[i].url+' frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
				htrr += '		<div class="video_title">'+result.list[i].title+"";
				if("${sessionScope.user.busker.buskerNo}" == "${param.buskerNo}"){
					htrr += '<span class="videoMenu">';
					htrr += '<span class="video_menu_modify" data-vno='+result.list[i].videoNo+'>삭제<br></span>';
					htrr += '<i class="fas fa-ellipsis-h"></i>';
					htrr += '</span>';	
				}
				htrr += '</div>';
				htrr += '		<div class="video_date">	'+ new Date(result.list[i].regDate).format('yyyy-MM-dd')+'';
				htrr += '</div>';
				htrr += '</div>';
				
				$(".video_body").append(htrr);
<<<<<<< HEAD
=======
				
>>>>>>> hs
			}
		})
	}
	
	//페이지 리스트를 출력함.
	function pageList(num){
		buskerNo = ${param.buskerNo};
		$.ajax({
			data : {buskerNo:buskerNo,pageNo:num},
			url : "video-select-ajax.do",
		}).done(function(result){
			console.log(result);
			let htr = "";
			htr+="<div class='pagination'>"
			
			if(result.pageResult.prev == true ){
				htr += '<a class="video-page" href='+(result.pageResult.beginpage-1)+'>이전</a>'
			}
			for(let i=result.pageResult.beginPage; i <= result.pageResult.endPage; i++){
				var strClass = num == i ? 'active' : '';
				htr += '<a class="video-page '+strClass+'" href="'+i+'">'+i+'</a>';
			}
			if(result.pageResult.next == true){
				htr += '<a class="video-page" href='+(result.pageResult.endPage+1)+'>다음</a>'
			}
			htr+="</div>"
			$(".panel-body").append(htr);
		})
	}
	
	
	$(document).on("click",".video-page",function(event){
		event.preventDefault();
		page = $(this).attr("href");
		realPage = page;
		spage = (page -1) * 6;
		$(".panel-body").html("<div class='video_body'></div>");
		showList(spage);
		pageList(page);
		
	})
	
	showList(0);
	pageList(1);
	

	
	
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    const weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    let d = this;
	    let h;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};

	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
    
	
<<<<<<< HEAD
=======
	//페이지 클릭시에 각각의 href값을 갖고 페이지를 출력함. spage는 비디오의 begin값, page는 page값.
	$(document).on("click",".video-page",function(event){
		event.preventDefault();
		page = $(this).attr("href");
		realPage = page;
		spage = (page -1) * 6;
		$(".panel-body").html("<div class='video_body'></div>");
		showList(spage);
		pageList(page);
		
	})
	
		showList(0);
		pageList(1);
>>>>>>> hs
	


</script>
