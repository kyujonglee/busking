<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>개인정보변경</div>
<hr>
<form name="user_info"  id="user_info" action="userInfoUpdate.do"  method="post">
		
	<c:if test="${sessionScope.user.memberType eq 'n' }">
		<div>비밀번호
			<input type="password" class="user__password" id="pass" name="pass" maxlength="16">
		</div>
		<hr>
	</c:if>
	
	<c:if test="${sessionScope.user.memberType eq 'n' }">
		<div>비밀번호 확인
			<input type="password" class="user__password__confirm" id="checkpass"  maxlength="16">
		</div>
		<hr>
	</c:if>
	
	<div>이메일
		<input type="text" class="user__email" name="email" value="${sessionScope.user.email}">
		<button id="checkEmail" type="button">중복확인</button>
	</div>

	<hr>
	<div>닉네임
		<input type="text" class="user__nickName" name="nickName" value="${sessionScope.user.nickName}">
		<button id="checkNickName" type="button">중복확인</button>
	</div>
	<hr>
	
	<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>

	
	<br>
	<button id="modify" type="button">수정</button>
</form>
