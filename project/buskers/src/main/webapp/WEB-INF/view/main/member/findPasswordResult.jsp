<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/findPassword.css'/>"/>
<title>비밀번호 찾기</title>
<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">비밀번호 찾기</span>
                </div>
                <div class="email-login">
                    <div class="u-form-group">
                        &emsp;
                    </div>
                    <div class="u-form-group">
                        ${sbEmail}
                    </div>
                    <div class="u-form-group">
                        이메일로 임시 비밀번호를 발송했습니다!
                    </div>
                    <br>
                    <br>
                    <div class="u-form-group">
                        <button class="submit-login" onclick="location.href='loginform.do'">확인</button>
                    </div>
                    <div class="u-form-group">
                        <a href="findIdform.do" class="forgot-id">아이디 찾기</a>
                        &nbsp;
                        <a href="findPasswordform.do" class="forgot-password">비밀번호 찾기</a>
                        &nbsp;
                        <a href="signupform.do" class="forgot-id">회원가입</a>
                    </div>
                </div>
            </div>

    </div>
</main>