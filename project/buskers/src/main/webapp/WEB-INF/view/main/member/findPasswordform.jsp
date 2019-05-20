<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/findPassword.css'/>"/>
<title>buskers</title>
<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">비밀번호 찾기</span>
                </div>
                <form class="email-login">
                    <div class="u-form-group">
                        <div>이름&nbsp;</div><input type="name" placeholder="Name"/>&emsp;&emsp;
                    </div>
                    <div class="u-form-group">
                        <div>아이디&nbsp;</div><input type="id" placeholder="Id"/>&emsp;&emsp;
                    </div>
                    <div class="u-form-group">
                        <div>이메일&nbsp;</div><input type="email" placeholder="Email"/>&emsp;&emsp;
                    </div>
                    <br>
                    <br>
                    <div class="u-form-group">
                        <button class="submit-login">확인</button>&nbsp;&nbsp;
                        <button type="button" class="back" onclick="location.href='loginform.do'">뒤로</button>
                    </div>
                    <div class="u-form-group">
                        <a href="findIdform.do" class="forgot-id">아이디 찾기</a>
                        &nbsp;
                        <a href="findPasswordform.do" class="forgot-password">비밀번호 찾기</a>
                        &nbsp;
                        <a href="signupform.do" class="forgot-id">회원가입</a>
                    </div>
                </form>
            </div>

    </div>
</main>