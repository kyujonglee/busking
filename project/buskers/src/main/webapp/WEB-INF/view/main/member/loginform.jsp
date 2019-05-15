<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/login.css'/>" />
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>

<main class="main-board">
    <div class="login-body">
        <div class="login-box">
            <div class="lb-header">
                <span class="active" id="login-box-link">로그인</span>
            </div>
            <form class="email-login" method="post">
                <div class="u-form-group">
                    <input type="id" name="id" id="id" placeholder="Id"/>
                </div>
                <div class="u-form-group">
                    <input type="password" name="pass" id="pass" placeholder="Password"/>
                </div>
                <div class="u-form-group">
                    <button id="login">로그인</button>
                </div>
                <div class="u-form-group">
                    <a href="findIdform.do" class="forgot-id">아이디 찾기</a>
                    &nbsp;
                    <a href="findPasswordform.do" class="forgot-password">비밀번호 찾기</a>
                    &nbsp;
                    <a href="signupform.do" class="forgot-id">회원가입</a>
                </div>
            </form>
            <div class="social-login">
                <a href="#">
                <i class="fa fa-facebook fa-lg"></i>
                페이스북으로 로그인
                </a>
                <a href="#">
                <i class="fa fa-google-plus fa-lg"></i>
                구글 로그인
                </a>
                <a href="#">
                <i class="fa fa-naver fa-lg"></i>
                네이버 로그인
                </a>
                <a href="#">
                <i class="fa fa-kakao fa-lg"></i>
                카카오 로그인
                </a>
            </div>
        </div>
    </div>
</main>
<script>
	$("#login").click(function() {
		var id = $("#id").val();
		var pass = $("#pass").val();
		if(id == ""){
			alert("아이디를 입력하세요.");
			$("#id").focus();
			return;
		}
		if(pass == ""){
			alert("비밀번호를 입력하세요.");
			$("#pass").focus();
			return;
		}
		$(".email-login").attr({
			"action": "login.do"
		});
	});
</script>
