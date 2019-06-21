<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="change_info_title">버스커 관리</div>
<hr>
		
	<c:if test="${sessionScope.user.isBusker eq 'n' }">
		<div class="info_detail_wrapper_none">
			<div class="menu_title_none">버스커 등록을 먼저 해주세요!</div>
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
		<form name="updateBusker"  id="updateBusker" action="buskerInfoUpdate.do"  method="post">
			<div class="info_detail_wrapper">
				<div class="menu_title">활동명</div>
				<div>
					<input type="text" class="busker__activityName" id="changeActivityName" name="activityName" maxlength="14" value="${sessionScope.user.busker.activityName }">
					<button id="updateActivityName" type="button" class="info_change_button">중복확인</button>
				</div>
			</div>
			<hr>
			<div class="info_detail_wrapper">
				<div class="menu_title">연락처</div>
				<div>
					<input type="text" class="busker__phone" id="phone" name="phone" value="${sessionScope.user.busker.phone }">
					<button id="checkPhone" type="button" class="info_change_button">인증하기</button>
				</div>	
			</div>
			<hr>
			<div class="info_detail_wrapper">
	            <div class="menu_title">주요장르&nbsp;</div>
		            <div class="checkBox">
		            	<div class="buskerCheckbox-item">
		                <label for="buskerCheckbox1" style="cursor:pointer">
			                <input type="checkbox" id="buskerCheckbox1" name="buskerCheckbox" value="1">
			                <span>스트릿댄스</span>
		                </label>
		            	</div>
		            	<div class="buskerCheckbox-item">
		                <label for="buskerCheckbox2" style="cursor:pointer">
			                <input type="checkbox" id="buskerCheckbox2" name="buskerCheckbox" value="2">
			                <span>보컬</span>
		                </label>
		            	</div>
		            	<div class="buskerCheckbox-item">
		                <label for="buskerCheckbox3" style="cursor:pointer">
			                <input type="checkbox" id="buskerCheckbox3" name="buskerCheckbox" value="3">
			                <span>스탠드업 코미디</span>
		                </label>
		            	</div>
		            	<div class="buskerCheckbox-item">
		                <label for="buskerCheckbox4" style="cursor:pointer">
			                <input type="checkbox" id="buskerCheckbox4" name="buskerCheckbox" value="4">
			                <span>악기연주</span>
		                </label>
		            	</div>
		            	<div class="buskerCheckbox-item">
		                <label for="buskerCheckbox5" style="cursor:pointer">
			                <input type="checkbox" id="buskerCheckbox5" name="buskerCheckbox" value="5">
			                <span>마술</span>
		                </label>
	            	</div>
	            </div>
       		</div>
       		<hr>
			<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
			<input type="hidden" name="buskerNo" value="${sessionScope.user.busker.buskerNo }"/>
			<div class="modifyWrapper2">
				<button id="modify_busker" type="button" class="info_change_button">변경</button>
			</div>
		</form>

	</c:if>
	
	
