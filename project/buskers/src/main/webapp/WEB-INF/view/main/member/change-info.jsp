<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>개인정보변경</div>
<hr>
<form name="user_info" action="">
	<div>비밀번호
		<input type="text" class="user__password" name="user__password">
	</div>
		<hr>
	
	<div>비밀번호 확인
		<input type="text" class="user__password__confirm" name="user__password__confirm">
	</div>
	<hr>
	
	<div>이메일
		<input type="text" class="user__email" name="user__email">
	</div>
	<hr>
	
	<div>닉네임
		<input type="text" class="user__nickname" name="user__nickname">
	</div>
	
	<br>
	<button>수정</button>
</form>
