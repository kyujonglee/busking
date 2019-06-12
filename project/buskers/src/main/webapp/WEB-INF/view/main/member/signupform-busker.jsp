<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/register-busker.css'/>" />
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<title>버스커가입</title>
<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">버스커 회원가입</span>
                </div>
                <form name="insertBusker" id="insertBusker" class="email-login"  action="signup-busker.do" method="post" onsubmit="return buskerCheck();">
                	<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
                    <div class="u-form-group">
                        <div class="div_group_name">활동명&nbsp;</div><input type="text" id="activityName" name="activityName" maxlength="14" placeholder="ActivityName(14글자 제한)"/>
                        <button type="button" id="checkActivityName" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div class="div_group_name">연락처&nbsp;</div><input type="text" id="phone" name="phone" placeholder="Phone"/>
                        <button type="button" id="checkPhone" class="check">본인인증</button>
                    </div>
                    <div class="u-form-group">
                        <div class="div_group_name">주요장르&nbsp;</div>
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
                            <br>
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
                    <br>
                    <br>
                    <br>
                    <div class="u-form-group">
                        <button class="register">등록</button>&nbsp;&nbsp;
                        <button type="button" class="back" onclick="location.href='setting.do'">뒤로</button>
                    </div>
                </form>
                
            </div>

    </div>
</main>
<script src="<c:url value='/resources/js/main/member/insertBusker.js'/>"></script>