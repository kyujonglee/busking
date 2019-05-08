<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
      rel="stylesheet"
      href="<c:url value='/resources/css/main/member/findPassword.css'/>"
    />
    <title>buskers</title>
</head>
<body>
    <!-- HEADER -->
    <header class="header">
        <div class="container">

            <div class="menu">
                <a href="#">Menu</a>
            </div>
            <div class="title">
                <span>Buskers</span>
            </div>
            <div class="user">
                <a href="<c:url value='/main/member/loginform.do'/>">로그인</a>
            </div>
        </div>
            
    </header>
    
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
                        <button type="button" class="back" onclick="location.href='login.html'">뒤로</button>
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
    <!-- FOOTER -->
    <footer class="footer">
        <div class="copyright">
            <h1>Copyright © 2019 .... - Buskers.</h1>
        </div>
    </footer>
    <script>

    </script>
</body>
</html>