<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/setting.css'/>"/>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
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
							<img class="profile_info_img4" src="<c:url value='/resources/img/boyoung.jpg'/>" title="프로필"/>
						</div>
					</div>
					<div class="profile_info_img5">
						<div class="profile_info_img6" title="즐겨찾기"></div>
					</div>
				</div>
				<div class="profile_info_nickName">
					${sessionScope.user.nickName}
				</div>
				<div class="profile_info_email">
					${sessionScope.user.email}
				</div>
				<hr class="profile_hr">
				<div class="profile_countbox">
					<div class="profile_posts">
						<p>6</p>
						<p>게시글</p>
					</div>
					<div class="profile_comment">
						<p>15</p>
						<p>댓글</p>
					</div>
				</div>
			</div>
			<div class="profile_body">
				<div class="profile_menu">
					<ul class="pro_tab_wapper" id="myTab" role="tablist">
						<li class="pro_tab" role="presentation">
							<a class="pro_tab_link" href="#profile" id="profile-anchor" role="tab" aria-controls="profile" >프로필</a>
						</li>
						<li class="pro_tab" role="presentation">
							<a class="pro_tab_link" href="#friend" id="friend-anchor" role="tab" aria-controls="friend" >팔로우 관리</a>
						</li>
						<li class="pro_tab" role="presentation">
							<a class="pro_tab_link" href="#notice" id="notice-anchor" role="tab" aria-controls="notice" >알림</a>
						</li>
						<li class="pro_tab" role="presentation">
							<a class="pro_tab_link" href="#privacy" id="privacy-anchor" role="tab" aria-controls="privacy" >개인정보 관리</a>
						</li>
						<li class="pro_tab" role="presentation">
							<a class="pro_tab_link" href="#social" id="social-anchor" role="tab" aria-controls="social" >소셜관리</a>
						</li>
					</ul>
				</div>
				<div class="profile_content">
					<div class="tab-pane" id="profile" role="tabpanel" aria-labelledby="profile-anchor" >...11</div>
				    <div class="tab-pane" id="friend" role="tabpanel" aria-labelledby="friend-anchor" >...22</div>
				    <div class="tab-pane" id="notice" role="tabpanel" aria-labelledby="notice-anchor" >...33</div>
				    <div class="tab-pane" id="privacy" role="tabpanel" aria-labelledby="privacy-anchor" >...44</div>
				    <div class="tab-pane" id="social" role="tabpanel" aria-labelledby="social-anchor" >...55</div>
				</div>
			</div>
    	</div>
    	<br>
    	<br>
    	<br>
    	<br>
    	<br>
    	<br>
    	<br>
    	
	</div>
</main>
<script type="text/javascript">
// $(function () {
//     $('#myTab a:first').tab('show')
//   })

// 	$('#myTab a').click(function (e) {
// 		e.preventDefault();
// 		$(this).tab('show');
// 	});
	
// 	//시각적으로 활성화 표기를 위한 클래스 추가
// 	$(".pro_tab_link:first-of-type, .tabpanel:first-of-type")
// 	 .addClass("active");
// 	 .attr("tabindex", "0");
	
// 	// 의미적으로 활성화 표기를 위해 true로 설정된 aria-selected 속성 추가
// 	$(".pro_tab_link:first-of-type")
// 	 .attr("aria-selected", "true");

// 	$(".pro_tab_link").on("mousedown", function(){
// 		 // 선택된 탭 활성화
// 		 $(this)
// 		   .addClass("active")
// 		   .attr({
// 		     "tabindex": "0",
// 		     "aria-selected": "true"
// 		   })
// 		   .focus()
// 		 // 기존 탭 비활성화
// 		 .siblings()
// 		   .removeClass("active")
// 		   .attr({
// 		     "tabindex": "-1",
// 		     "aria-selected": "false"
// 		   });
// 		 // 연관된 탭 패널 활성화
// 		 $("#" + $(this).attr("aria-controls"))
// 		   .attr("tabindex", "0")
// 		   .addClass("active")
// 		 // 기존 탭 패널 비활성화
// 		 .siblings(".tabpanel")
// 		   .attr("tabindex", "-1")
// 		   .removeClass("active");
// 		});

</script>
	