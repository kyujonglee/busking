<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="<c:url value='/resources/css/main/member/login.css'/>" />
    <script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <meta name="google-signin-client_id" content="711343291168-unua7itp9em5gms7up15sl5rn2ei80vj.apps.googleusercontent.com">
<main class="main-board">    
    <!-- CONTAINER -->
    <div class="login-body">
        <div class="login-box">
            <div class="lb-header">
                <span class="active" id="login-box-link">로그인</span>
            </div>
            <form class="email-login" method="post">
                <div class="u-form-group">
                    <input type="text" name="id" id="id" placeholder="Id" maxlength="16"/>
                </div>
                <div class="u-form-group">
                    <input type="password" name="pass" id="pass" placeholder="Password" maxlength="16"/>
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
            	<div class="social_div1">
	                <a id="facebook" href="#">
	               		페이스북으로 로그인
	                </a>
            	</div>
            	<div class="social_div2">
	                <!-- 구글로그인  -->
	     		    <div class="g-signin2" data-onsuccess="onSignIn"></div>
            	</div>
     		    
     		    <div class="social_div3">
	                <!-- 네이버로그인 -->
	     		    <div id="naverIdLogin"></div>
     		    </div>
     		    
     		    <div class="social_div4">
	                <a id="kakao" href="javascript:loginWithKakao()">
	           	  	  <i class="fa fa-naver fa-lg"></i>
	        			        카카오 로그인
	                </a>
     		    </div>
            </div>
        </div>
    </div>
    <form id="social-signup" method="POST" action="signupform-social.do">
    	<input type="hidden"  id="memberId" name="id"  value=""/>
    	<input type="hidden"  id="nickName" name="name" value=""/>
    	<input type="hidden"  id="memberType" name="memberType" value=""/>
    </form>
   <form id="social-login" method="POST" action="social-login.do">
    	<input type="hidden"  id="memberId" name="id"  value=""/>
    	<input type="hidden"  id="nickName" name="name" value=""/>
    	<input type="hidden"  id="accessToken" name="accessToken" value=""/>
    </form> 
</main>
<script src="<c:url value='/resources/js/main/member/login.js'/>"></script>
