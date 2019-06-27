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
					<ul class="tablist" role="tablist">
						<li class="pro_tab">
						 <a id="tab1" href="#tab-panel1" class="tab" role="tab" aria-controls="tab-panel1">boo</a>
						</li>
						<li class="pro_tab">
						 <a id="tab2" href="#tab-panel2" class="tab" role="tab" aria-controls="tab-panel2">far</a>
						</li>
						<li class="pro_tab">
						 <a id="tab3" href="#tab-panel3" class="tab" role="tab" aria-controls="tab-panel3">baz</a>
						</li>
					</ul>
				</div>
				<div class="profile_content">
			        <div id="tab-panel1" class="tabpanel active" role="tabpanel" aria-labelledby="tab1">
					 ...1
					</div>
					<div id="tab-panel2" class="tabpanel" role="tabpanel" aria-labelledby="tab2">
					 ...2
					</div>
					<div id="tab-panel3" class="tabpanel" role="tabpanel" aria-labelledby="tab3">
					 ...3
					</div>
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
$(".tab, .tabpanel").first()
	.attr("tabindex", "0")
	.addClass("active");

$(".tab").first()
	.attr("aria-selected", "true");

$(".tab").on("click", function(){
	 $(this)
	   .addClass("active") 
	   .attr({
	     "tabindex": "0",
	     "aria-selected": "true"
	   })
	   .siblings(".tab")
	   .removeClass("active")
	   .attr({
	     "tabindex": "-1",
	     "aria-selected": "false"
	   });
	 $("#" + $(this).attr("aria-controls"))
	   .attr("tabindex", "0")
	   .addClass("active")
	   .removeClass("hidden")
	 .siblings(".tabpanel")
	   .attr("tabindex", "-1")
	   .addClass("hidden")
	   .removeClass("active");
	});
</script>
	