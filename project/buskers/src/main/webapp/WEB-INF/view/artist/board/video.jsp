<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="<c:url value='/resources/css/artist/board/video.css' />" />
<section>
	<div class="video_container">
		<div class="video_header">
			<div class='row'>
				<div class="col-lg-12">
			    	<div class="panel panel-default">
			        	<div class="panel-heading">
			            	<i class="fas fa-video"></i> YouTube
			        			<button id='addVideoBtn' class='btn btn-primary btn-xs pull-right' data-toggle="modal" data-target="#videoModal">New Video</button>
			      		</div>      
			        	<div class="panel-body">        
			        		<div class="video_body">
				        		<div class="video">
			        				<iframe width="100%" height="250px" src="https://www.youtube.com/embed/_sGNYiaGies" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        			<div class="video_title">동영상 제목을 써주세요
				        				<span class="videoMenu">
				        					<span class="video_menu_modify">수정<br></span>
				        					<i class="fas fa-ellipsis-h"></i>
				        				</span>
				        			</div>
				        			<div class="cideo_date">2019-06-11
				        			</div>
				        		</div>
				        		<div class="video">
			        				<iframe class="youToube_video" width="100%" height="250px" src="https://www.youtube.com/embed/_sGNYiaGies" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        			<div class="video_title">동영상 제목을 써주세요</div>
				        		</div>
				        		<div class="video">
			        				<iframe width="100%" height="250px" src="https://www.youtube.com/embed/_sGNYiaGies" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        			<div class="video_title">동영상 제목을 써주세요</div>
				        		</div>
				        		<div class="video">
			        				<iframe width="100%" height="250px" src="https://www.youtube.com/embed/_sGNYiaGies" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        			<div class="video_title">동영상 제목을 써주세요</div>
				        		</div>
				        		<div class="video">
			        				<iframe width="100%" height="250px" src="https://www.youtube.com/embed/_sGNYiaGies" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        			<div class="video_title">동영상 제목을 써주세요</div>
				        		</div>
				        		<div class="video">
			        				<iframe width="100%" height="250px" src="https://www.youtube.com/embed/_sGNYiaGies" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				        			<div class="video_title">동영상 제목을 써주세요</div>
				        		</div>
			        		
			        		</div>
	     	                <div class="pagination">
		                        <a href="#">
		                            <i class="fas fa-angle-left"></i>
		                        </a>
		                            <a href="#" >1</a>
		                            <a href="#" >2</a>
		                            <a href="#" >3</a>
		                            <a href="#" >4</a>
		                            <a href="#" >5</a>
		                            <a href="#" >6</a>
		                            <a href="#" >7</a>
		                            <a href="#" >8</a>
		                            <a href="#" >9</a>
		                            <a href="#" >10</a>
		                        <a href="#">
		                            <i class="fas fa-angle-right"></i>
		                        </a>
	                		</div>
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
	
	
	$("#regBtn").click(function(){
		let title = $("#title").val();
		let videoUrl = $("#videoUrl").val();
		let buskerNo = "${sessionScope.user.buskerNo}";
		$.ajax({
			type: 'post',
			data : {title:title,url:videoUrl, buskerNo:buskerNo},
			url:"video-regist-ajax.do",
		}).done(function(){
			
			alert("에이작스성공")
		})
	})



</script>
