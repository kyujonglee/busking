<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/setting.css'/>"/>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<title>개인설정</title>
<main class="main-board profile-main">  
    <div class="profile">
		<div class="profile_title">
			<div class="profile_title_underline">
				<a href="<c:url value='/main/member/setting.do'/>">개인설정</a>
			</div> 
		</div>
    	<div class="profile_row">
			<div class="profile_info">
				<div class="profile_info_img">
					<div class="profile_info_img2" aria-label="프로필 사진">
						<div class="profile_info_img3">
							<img class="profile_info_img4" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" title="프로필" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
						</div>
					</div>
				</div>
				<div class="profile_info_nickName">
					${sessionScope.user.nickName}
				</div>
				<div class="profile_info_email">
					${sessionScope.user.email}
				</div>
				<hr class="profile_hr">
				<div class="profile_info_sum">
					캐시 : ${sessionScope.user.sum} 섬
				</div>
				<hr class="profile_hr">
				<div class="profile_countbox">
					<div class="profile_posts">
						<p>6</p>
						<p>게시글</p>
					</div>
					<div class="profile_comment">
						<p>${followerCount}</p>
						<p>팔로워</p>
					</div>
				</div>
				<hr class="profile_hr">
				<div class="profile_introduce1">
					<div class="profile_introduce2">
						${sessionScope.user.profileIntroduce}
					</div>
				</div>
			</div>
			<div class="profile_body">
				<div class="profile_menu">
					<ul class="pro_tab_wapper">
						<li class="pro_tab active">
							<a class="pro_tab_link"  onclick="tab_menu(0);" >프로필</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(1);" >팔로우 / 팔로워 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(2);" >개인정보 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(3);" >버스커 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(4);" >결제</a>
						</li>
						<c:if test="${sessionScope.user.isAgency eq 'y'}">
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(5);" >업체</a>
						</li>
						</c:if>
						<li class="pro_tab">
							<a class="pro_tab_link"  onclick="tab_menu(6);" >회원탈퇴</a>
						</li>
					</ul>
				</div>
				<div class="profile_content">
			        <div class="tab-pane0" id="profile" style="display: block;">
			        	<%@ include file= "change-profile.jsp" %>
			        </div>
				    <div class="tab-pane1" id="friend" style="display: none;" >
						<%@ include file= "follow-info.jsp" %>
				    </div>
				    <div class="tab-pane2" id="privacy" style="display: none;" >
				    	<%@ include file= "change-info.jsp" %>
				    </div>
				    <div class="tab-pane3" id="privacy__busker" style="display: none;" >
				    	<%@ include file= "change-info-busker.jsp" %>
				    </div>
				    <div class="tab-pane4" id="pay" style="display: none;" >
				    	<%@ include file= "pay.jsp" %>
				    </div>
				    <div class="tab-pane5" id="agency" style="display: none;" >
				    	<%@ include file= "agency.jsp" %>
				    </div>
				</div>
			</div>
    	</div>
    	<div class="profile_title"></div>
	</div>
	
	<!-- The Modal -->
    <div id="myModal" class="modal profileZIndex">
	    <!-- Modal content -->
	    <div class="modal-content">
		    <div class="modal-header">
		    	<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		    	<h4 class="modal-title">프로필 사진 업데이트</h4>
		    </div>
		    <form id="profileFrom" action="profileUpload.do" method="POST">
		    <div class="modal-body">
		      	<button class="btn-file" id="btn___file">
				    <input type="file" id="profile__img" name="userProfile" enctype="multipart/form-data"/>
		      		<img class="preview-profile" id="profile__preview" src="" />
		      		<span class="btn-file-word">사진 업로드</span>
		      		<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
		      		<input type="hidden" name="profileImg" value="${sessionScope.user.profileImg }"/>
				</button>
		    </div>
		    </form>
		    <div class="modal-footer">
		    	<button type="button" class="closeBtn" >닫기</button>
		    	<button type="button" class="saveBtn" >저장</button>
		    </div>
	    </div>
    </div>
</main>
<script>
	let userMemberNo = "${sessionScope.user.memberNo}";
	let userEmail = "${sessionScope.user.email}";
	let userNickName = "${sessionScope.user.nickName}";
	let buskeractivityName = "${sessionScope.user.busker.activityName}";
	let id = "${sessionScope.user.id}";
	let profileImg = "${sessionScope.user.profileImg}";
	let profileImgPath = "${sessionScope.user.profileImgPath}";
</script>
<script src="<c:url value='/resources/js/main/member/setting.js'/>"></script>
	