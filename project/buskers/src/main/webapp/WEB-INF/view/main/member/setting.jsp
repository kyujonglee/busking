<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<div class="profile_introduce1">
					<div class="profile_introduce2">
						안녕하세요 박보영 입니다!
					</div>
				</div>
			</div>
			<div class="profile_body">
				<div class="profile_menu">
					<ul class="pro_tab_wapper">
						<li class="pro_tab active">
							<a class="pro_tab_link" href="#profile;" onclick="tab_menu(0);" >프로필</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#friend;" onclick="tab_menu(1);" >친구 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#notice;" onclick="tab_menu(2);" >알림</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#privacy;" onclick="tab_menu(3);" >개인정보 관리</a>
						</li>
						<li class="pro_tab">
							<a class="pro_tab_link" href="#social;" onclick="tab_menu(4);" >결제</a>
						</li>
					</ul>
				</div>
				<div class="profile_content">
			        <div class="tab-pane0" id="profile" style="display: block;">
			        	<form class="form profile">
			        		<div class="profile__img__title">
			        			<h3>프로필 사진</h3>
			        		</div>	
			        		<div class="profile__img__box">
			        			<div class="profile__img__row">
			        				<div class="profile__img__setting">
			        					<div class="img__box1">
			        						<div class="img__box2">
			        							<img class="img__box3" src="<c:url value='/resources/img/boyoung.jpg'/>" title="프로필 사진"/>
			        						</div>
			        					</div>
			        					<div class="img__update">
			        						<div class="img__update__box">
			        							<label for="ex__file">프로필 사진 업데이트</label>
			        							<input type="file" class="img__update__button" id="ex__file" />
			        						</div>
			        						<div class="img__update__ment">
			        							<p>JPEG, PNG, GIF 중 하나여야 하며 10MB를 초과할 수 없습니다.</p>
			        						</div>
			        					</div>
			        				</div>
			        			</div>
			        		</div>
			        		<div class="profile__introduce__title">
			        			<h3>프로필 소개</h3>
			        		</div>
			        		<div class="profile__introduce__box">
			        			<textarea class="introduce__textarea" placeholder="소개글을 써주세요!"></textarea>
			        		</div>
			        	</form>
			        </div>
				    <div class="tab-pane1" id="friend" style="display: none;" >...22
				    
				    </div>
				    <div class="tab-pane2" id="notice" style="display: none;" >...33
				    
				    </div>
				    <div class="tab-pane3" id="privacy" style="display: none;" >
				    	<%@ include file= "change-info.jsp" %>
				    </div>
				    <div class="tab-pane4" id="social" style="display: none;" >
				    	<%@ include file= "pay.jsp" %>
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
function tab_menu(num){
    var f = $('.pro_tab_wapper').find('li');
    for ( var i = 0; i < f.length; i++ ) { 
    	if ( i == num) { 
      		f.eq(i).addClass('active');
      		$('.tab-pane' + i ).css('display','block');
     	} else {
      		f.eq(i).removeClass('active');   
      		$('.tab-pane' + i ).css('display','none');
     	}
    }
}
</script>
	