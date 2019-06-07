<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div>버스커 관리</div>
<hr>
		
	<c:if test="${sessionScope.user.isBusker eq 'n' }">
		<div>버스커 등록을 먼저 해주세요!</div>
		<br>
		<a href="signupform-busker.do" class="busker_signup">
			<button type="button">
				버스커 등록 하러가기
			</button>
		</a>		
		<hr>
	</c:if>
	
	<c:if test="${sessionScope.user.isBusker eq 'y' }">
		<div>도착했나!</div>
	</c:if>
	
	
