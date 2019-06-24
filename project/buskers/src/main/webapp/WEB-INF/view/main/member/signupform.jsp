<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/register.css'/>" />
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<title>회원가입</title>
<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">회원가입</span>
                </div>
                <form class="email-login" onsubmit="return DosignUp()" action="signup.do" method="post">
                    <div class="u-form-group">
                        <div>아이디&nbsp;</div><input type="text" id="id" name="id" maxlength="16" placeholder="Id(최소 4자이상)"/>
                        <button type="button" id="checkId" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>비밀번호&nbsp;</div><input type="password" id="pass" name="pass" maxlength="16" placeholder="Password(최소 8자이상)"/>&emsp;&emsp;&emsp;&emsp;&emsp;
                    </div>
                    <div class="u-form-group">
                        <div>비밀번호 확인&nbsp;</div><input type="password" id="checkpass" name="passcheck" maxlength="16" placeholder="PasswordCheck"/>&emsp;&emsp;&emsp;&emsp;&emsp;
                    </div>
                    <div class="u-form-group">
                        <div>이메일&nbsp;</div><input type="text" id="email" name="email" placeholder="email" maxlength="50"/>
                        <button type="button" id="checkEmail" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>닉네임&nbsp;</div><input type="text" id="nickName" name="nickName" maxlength="12" placeholder="nickName(12글자 제한)"/>
                        <button type="button" id="checkNickName" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>성별&nbsp;</div>
                        <div class="radio">                        
                            <label for="sex1">남</label>
                            <input type="radio" id="sex1" name="sex" value="M"/>
                            <label for="sex2">여</label>
                            <input type="radio" id="sex2" name="sex" value="F"/>
                        </div>
                    </div>
                    <br>
                    <div class="u-form-group">
                        <input type="submit" id="memberRegister" class="register" value="일반 회원가입"/>&nbsp;&nbsp;
                        <button type="button" class="register" onclick="location.href='loginform.do'">뒤로</button>
                    </div>
                </form>
                
            </div>

    </div>
</main>
<script src="<c:url value='/resources/js/main/member/signupMember.js'/>"></script>