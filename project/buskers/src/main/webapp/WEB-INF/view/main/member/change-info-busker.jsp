<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="change_info_title">버스커 관리</div>
<hr>
		
	<c:if test="${sessionScope.user.isBusker eq 'n' }">
		<div class="info_detail_wrapper">
			<div class="menu_title">버스커 등록을 먼저 해주세요!</div>
			<br>
			<a href="signupform-busker.do" class="busker_signup">
				<button type="button">
					버스커 등록 하러가기
				</button>
			</a>		
		</div>
		<hr>
	</c:if>
	
	<c:if test="${sessionScope.user.isBusker eq 'y' }">
		<form name="user_info"  id="user_info" action="userInfoUpdate.do"  method="post">
			<div class="info_detail_wrapper">
				<div class="menu_title">활동명</div>
				<div>
					<input type="text" class="busker__activityName" name="activityName" value="세션 활동명">
					<button id="checkActivityName" type="button" class="info_change_button">중복확인</button>
				</div>
			</div>
			<hr>
			<div class="info_detail_wrapper">
				<div class="menu_title">연락처</div>
				<div>
					<input type="text" class="busker__phone" name="phone" value="세션 연락처">
					<button id="checkPhone" type="button" class="info_change_button">중복확인</button>
				</div>	
			</div>
			<hr>
			<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
			<div class="modifyWrapper">
				<button id="modify" type="button" class="info_change_button">변경</button>
			</div>
		</form>

	</c:if>
	
	
