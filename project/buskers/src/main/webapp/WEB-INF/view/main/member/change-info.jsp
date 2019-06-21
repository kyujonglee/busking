<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="change_info_title">개인정보변경</div>
<hr>
<form name="user_info"  id="user_info" action="userInfoUpdate.do"  method="post">
		
	<c:if test="${sessionScope.user.memberType eq 'n' }">
		<div class="info_detail_wrapper">
			<div class="menu_title">비밀번호</div>
			<div>
				<input type="password" class="user__password" id="pass" name="pass" maxlength="16">
			</div>
		</div>
		<hr>
	</c:if>
	
	<c:if test="${sessionScope.user.memberType eq 'n' }">
		<div class="info_detail_wrapper">
			<div class="menu_title">비밀번호 확인</div>
			<div>
				<input type="password" class="user__password__confirm" id="checkpass"  maxlength="16">
			</div>
		</div>
		<hr>
	</c:if>
	
	<div class="info_detail_wrapper">
		<div class="menu_title">이메일</div>
		<div>
			<input type="text" class="user__email" name="email" value="${sessionScope.user.email}" maxlength="50">
			<button id="checkEmail" type="button" class="info_change_button">중복확인</button>
		</div>
	</div>
	<hr>
	<div class="info_detail_wrapper">
		<div class="menu_title">닉네임</div>
		<div>
			<input type="text" class="user__nickName" name="nickName" value="${sessionScope.user.nickName}" maxlength="12">
			<button id="checkNickName" type="button" class="info_change_button">중복확인</button>
		</div>	
	</div>
	<hr>
	<br>
	<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
	<div class="modifyWrapper">
		<button id="modify" type="button" class="info_change_button">변경</button>
	</div>
</form>
