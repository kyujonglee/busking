<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/register.css'/>" />
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<title>buskers</title>

<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">회원가입</span>
                </div>
                <form class="email-login" onsubmit="return DosignUp()" action="social-signup.do" method="post">
                    <div class="u-form-group">
                        <div>닉네임&nbsp;</div><input type="text" id="nickName" name="nickName" placeholder="nickName"/>
                        <button type="button" id="checkNickName" class="check">중복확인</button>
                    </div>
                    <br>
                    <div class="u-form-group">
                        <input type="hidden" id="name"  name="name" value="${name}">
                        <input type="hidden" id="id" name="id" value="${id}">
                        <input type="hidden" id="memberType" name="memberType" value="${memberType}">
                        <input type="submit" id="memberRegister" class="register" value="소셜 회원가입"/>&nbsp;&nbsp;
                        <button type="button" class="register signout"  >뒤로</button>
                    </div>
                </form>
            </div>
    </div>
</main>
<script src="<c:url value='/resources/js/main/member/signupSocial.js'/>"></script>