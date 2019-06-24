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
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				<c:if test="${param.buskerNo eq sessionScope.user.busker.buskerNo }">
					<button type="button" class="btn btn-primary" id="delBtn">삭제
						<input type="hidden" id="delNum"/>
					</button>
				</c:if>
			</div>
		</div>
	</div>
</div>


<script>
	let artistPhotoInsert = "<c:url value='/file/artist-photo-insert.do'/>"
</script>
<script src='<c:url value="/resources/js/artist/board/photo.js"/>'></script>
