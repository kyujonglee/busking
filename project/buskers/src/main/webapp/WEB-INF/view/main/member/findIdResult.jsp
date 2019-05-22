<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/findId.css'/>"/>
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<title>buskers</title>

<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">아이디 찾기</span>
                </div>
                <div class="email-login">
                	<br>
                    <div class="u-form-group">
                        회원님의 아이디는
                    </div>
                    <div class="u-form-group">
                    	${sbId} 입니다
                    </div>
                    <br>
                    <br>
                    <br>
                    <br>
                    <div class="u-form-group">
                        <button class="submit-login" onclick="location.href='loginform.do'" >로그인</button>&nbsp;&nbsp;
                        <button type="button" class="back" onclick="history.go(-1);">뒤로</button>
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