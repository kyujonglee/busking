<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="<c:url value='/resources/css/artist/board/photo.css' />" />
<section>
	<div class="video_container">
		<div class="video_header">
			<div class='row'>
				<div class="col-lg-12">
			    	<div class="panel panel-default">
			        	<div class="panel-heading">
			            	<i class="fas fa-video"></i> YouTube
		        				<button id='addVideoBtn' class='btn btn-primary btn-xs pull-right' data-toggle="modal" data-target="#photoModal">New Photo</button>
			      		</div>      
			        	<div class="panel-body">          
			        		<div class="photo_body">
<!-- 				        		<div class="photo"> -->
<!-- 				        			<a href="#"> -->
<%-- 					        			<img src="<c:url value='/resources/img/boyoung.jpg'/>"/> --%>
<!-- 					        			<div class="hover"></div> -->
<!-- 				        			</a> -->
<!-- 				        		</div> -->
<%-- 				        		<div class="photo"><img src="<c:url value='/resources/img/musician.jpg'/>"/></div> --%>
<%-- 				        		<div class="photo"><img src="<c:url value='/resources/img/marker.jpg'/>"/></div> --%>
<%-- 				        		<div class="photo"><img src="<c:url value='/resources/img/twilight.jpg'/>"/></div> --%>
			        		</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="photoModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			 <div class="modal_title">첨부할 사진을 선택합니다.</div>
        </div>
        <div class="modal-body">
	    	<div class="form-group">
	        	<div class="control-label">글제목 : </div>
		        <input type="text" class="form-control" id="title"/>
	        </div>
	    	<div class="form-group">
	        	<div class="control-label">사진 선택 </div>
		        <input type="file" class="btn" id="photo"  name="userProfile" enctype="multipart/form-data"/>
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
	$(document).on("click","#regBtn",function(){
		let title = $("#title").val();
	  	let file = $("#photo")[0].files[0];g
	  	let buskerNo = "${param.buskerNo}";
	  	console.log(title);
	  	console.log(file);
	  	console.log(buskerNo);
		let formData = new FormData();
		formData.append("file", file);
		formData.append("buskerNo",buskerNo);
		formData.append("title", title);
		
	  	$.ajax({
	  		type : "post",
			data: formData,
			processData: false,
			contentType: false,
			cache : false,
			url : '/buskers/file/artist-photo-insert.do',
		}).done(function(retsult){
			alert("에이작스성공");		
		})
	})

	$(".photo_body").append(
		`<div class="artist__photo__img" ><img src="<c:url value='/resources/img/musician.jpg'/>"/></div>
		 <div class="artist__photo__img" ><img src="<c:url value='/resources/img/marker.jpg'/>"/></div>
		 <div class="artist__photo__img" ><img src="<c:url value='/resources/img/musician.jpg'/>"/></div>
		 <div class="artist__photo__img" ><img src="<c:url value='/resources/img/marker.jpg'/>"/></div>
		 `
	)
		
		function getList(num){
			setTimeout(function(){
				heightFirst = $(".artist__photo__img:eq("+(num-4)+")").outerHeight();
	 			heightSecond = $(".artist__photo__img:eq("+(num-3)+")").outerHeight();
	 			heightThird = $(".artist__photo__img:eq("+(num-2)+")").outerHeight();
	 			heightFourth = $(".artist__photo__img:eq("+(num-1)+")").outerHeight();
	 			$(".photo_body").append(`
 					 <div class="artist__photo__img" style="top:`+heightFirst+`px;"  ><img src="<c:url value='/resources/img/marker.jpg'/>"/></div>
 					 <div class="artist__photo__img" style="top:`+heightSecond+`px;" ><img src="<c:url value='/resources/img/musician.jpg'/>"/></div>
 					 <div class="artist__photo__img" style="top:`+heightThird+`px;" ><img src="<c:url value='/resources/img/twilight.jpg/>"/></div>
 					 <div class="artist__photo__img" style="top:`+heightFourth+`px;" ><img src="<c:url value='/resources/img/musician.jpg'/>"/></div>
	 			`)
			},100);
		}
		getList(4);


</script>
