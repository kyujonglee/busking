<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/register-busker.css'/>" />
<title>buskers</title>
<main class="main-board">  
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">버스커 회원가입</span>
                </div>
                <form class="email-login">
                    <div class="u-form-group">
                        <div>이름&nbsp;</div><input type="text" placeholder="Name"/>&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
                    </div>
                    <div class="u-form-group">
                        <div>활동명&nbsp;</div><input type="text" placeholder="ActiveName"/>
                        <button type="button" id="checkActiveName" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>연락처&nbsp;</div><input type="text" placeholder="Phone"/>
                        <button type="button" id="phone" class="check">본인인증</button>
                    </div>
                    <div class="u-form-group">
                        <div class="genre">주요장르&nbsp;</div>
                        <div class="checkBox">
                            <input type="checkbox" id="skill1" name="skill" value="1">
                            <label for="skill1">스트릿댄스</label>
                            <input type="checkbox" id="skill2" name="skill" value="2">
                            <label for="skill2">발라드</label>
                            <input type="checkbox" id="skill3" name="skill" value="3">
                            <label for="skill3">스탠드업 코미디</label>
                            <br>
                            <input type="checkbox" id="skill4" name="skill" value="4">
                            <label for="skill4">악기연주</label>
                            <input type="checkbox" id="skill5" name="skill" value="5">
                            <label for="skill5">마술</label>
                        </div>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div class="u-form-group">
                        <button class="register">등록</button>&nbsp;&nbsp;
                        <button type="button" class="back" onclick="location.href='signupform.do'">뒤로</button>
                    </div>
                </form>
                
            </div>

    </div>
</main>