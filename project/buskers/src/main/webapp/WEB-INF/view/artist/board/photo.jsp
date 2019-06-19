<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/artist/board/photo.css' />" />
<section>
	<div class="video_container">
		<div class="video_header">
			<div class='row'>
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">
							<i class="far fa-image"></i> Photo
							<c:if test="${param.buskerNo eq sessionScope.user.busker.buskerNo }">
								<button id='addVideoBtn'
									class='btn btn-primary btn-xs pull-right' data-toggle="modal"
									data-target="#photoModal">New Photo</button>
							</c:if> 
						</div>
						<div class="panel-body">
							<div class="photo_body">
								<div class="photo_body_wrapper">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>

<!-- Modal -->
<div class="modal fade" id="photoModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="add-modal_title">첨부할 사진을 선택합니다.</div>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<div class="control-label">글제목 :</div>
					<input type="text" class="form-control" id="title" />
				</div>
				<div class="form-group">
					<div class="control-label">사진 선택</div>
					<input type="file" class="btn" id="photo" name="userProfile"
						enctype="multipart/form-data" />
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="regBtn">글등록</button>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div class="modal fade" id="photoModalDetail" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<div class="modal_title" >title보여주기!</div>
			</div>
			<div class="modal-body-photo">
				<%-- 			<img src="<c:url value='/resources/img/busker1.jpg'/>"/> --%>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" id="delBtn">삭제
					<input type="hidden" id="delNum"/>
				</button>
			</div>
		</div>
	</div>
</div>


<script>



	//사진등록
	$(document).on("click","#regBtn",function(){
		let title = $("#title").val();
		let file = $("#photo")[0].files[0];
		let buskerNo = "${param.buskerNo}";
		let formData = new FormData();
		formData.append("file", file);
		formData.append("buskerNo",buskerNo);
		formData.append("title", title);

		//글등록 유효성 검사
		if(title==""){
			alert("타이틀을 입력해주세요.")
			return;
		}
		if(title.length>21){
			alert("제목의 길이가 너무 깁니다. 20자 이하로 입력해주세요")
			return;
		}
		if(file == undefined){
			alert("파일을 첨부해주세요")
			return;
		}
		
		//파일 유효성 검사
		let fileName = $("#photo")[0].files[0].name;	
		fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
		if(fileName != "jpg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){ //확장자를 확인합니다.
			alert('썸네일은 이미지 파일(jpg, png, gif, bmp)만 등록 가능합니다.');
			return;
		}
		//파일등록 에이작스
		$.ajax({
			type : "post",
			data: formData,
			processData: false,
			contentType: false,
			cache : false,
			url : '/buskers/file/artist-photo-insert.do',
		}).done(function(retsult){
			$(".photo_body_wrapper").html("");
			showList();
			$("#title").val("");
			$("#photo").val("");
			$("#photoModal").hide();
			//사진숫자 새로고침
			$.ajax({
				url : "<c:url value='/artist/main/main-ajax.do'/>",
				dateType : "json",
				data : "buskerNo="+buskerNo
			}).done(map => {
				
				const photoCount = map.photoCount;
				$("#photoCount").text(photoCount);
			});
			
		})
	})
	
	//사진삭제
	$(document).on("click","#delBtn",function(){
		if(confirm("정말로 삭제하시겠습니까?") == true){
			let fileNo = $(this).find("#delNum").val();
			$.ajax({
				data:{fileNo:fileNo},
				url : "delete-photo.do",
			}).done(function(){
				$(".photo_body_wrapper").html("");
				$("#photoModalDetail").hide();
				showList();
				
				//사진숫자 새로고침
				$.ajax({
					url : "<c:url value='/artist/main/main-ajax.do'/>",
					dateType : "json",
					data : "buskerNo="+buskerNo
				}).done(map => {
					const photoCount = map.photoCount;
					$("#photoCount").text(photoCount);
				});
				
			})
		}
	})
	
	
	
	//목록보여주기 전체
	function showList(){
		$.ajax({
			data : {buskerNo: buskerNo},
			url:'select-photo-ajax.do',
		}).done(function(result){
			for(let i = 0; i < 4;  i ++){
				$(".photo_body_wrapper").append(`
					<div class="artist__photo__img" >
						<img data-pno="`+result[i].fileNo+`" src="<c:url value='/file/download.do'/>?path=`+result[i].path+result[i].sysname+`" />
					</div>
				`)
			}
			list(result.length,4,result);
		})
	}
	
 	//목록보여주기 추가되는부분
	function list(length,i,result){
		setTimeout(function(){
			let k = i%4;
			let t = Math.floor(i/4);
// 			t = Math.floor(t);
			height = 0;
// 			console.log(i,k,t)
			for(let j=0; j<t ; j++){
				height += $(".artist__photo__img:eq("+k+")").outerHeight();
				k = k+4;
			};
				
			$(".photo_body_wrapper").append(`
					 <div class="artist__photo__img" style="top:`+height+`px;"  >
					 	<img data-pno="`+result[i].fileNo+`" src="<c:url value='/file/download.do'/>?path=`+result[i].path+result[i].sysname+`" />
					 </div>
				`);
			i++;
			if(i==length){
				return;
			}
			list(length,i,result);
		},20);
	}
	
	
	//사진 디테일
	$(document).on("click",".artist__photo__img img",function(){
		let fileNo = $(this).data("pno");
		$("#delNum").val(fileNo);
		$.ajax({
			data:{fileNo:fileNo},
			url : "select-photo-no-ajax.do",
		}).done(function(result){
			$(".modal_title").html("<input id='title_text' class='select_title_text title_text' value='"+result.title+"' readonly/>");
			$(".modal-body-photo").html(`<img src="<c:url value='/file/download.do'/>?path=`+result.path+result.sysname+`" />`)
		})
		$("#photoModalDetail").modal();
	})
	
// 	//제목 클릭시에 수정할수 있게
// 	$(document).on("click",".modal_title",function(){
// 		$(".select_title_text").removeAttr('readonly');
// 		$(".select_title_text").removeClass("title_text");
// 		$(".select_title_text").addClass("title_text_click");
// 	})
// 	//블러시에 돌아감
// 	$(document).on("blur",".select_title_text",function(){
// 		$(".select_title_text").removeClass("title_text_click");
// 		$(".select_title_text").attr('readonly',true);
// 		let text=$(".select_title_text").val();
// 		alert(text);
// 	})
	
	showList();


</script>
