<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="<c:url value='/resources/css/main/member/register.css'/>" />
    <script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <title>buskers</title>
</head>
<body>
<script type="text/javascript">
	function DosignUp() {
		var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
     	var getCheck = RegExp(/^[a-zA-Z0-9]{4,12}$/);
      	var getName = RegExp(/^[가-힣]+$/);
      	
      	// 아이디 공백 확인
      	if($("#id").val() == "") {
      		alert("ID를 입력해주세요!");
      		$("#id").focus();
      		return false;
      	}
      	
      	// 이름 유효성 검사
      	if(!getCheck.test($("#id").val())) {
      		alert("형식에 맞춰서 ID를 입력해주세요!");
      		$("#id").val("");
            $("#id").focus();
            return false;
      	}
      	
      	// 비밀번호 공백 확인
      	if($("#pass").val() == "") {
      		alert("비밀번호를 입력해주세요!");
      		$("#pass").focus();
      		return false;
      	}
      	
      	// 비밀번호체크 공백 확인
      	if($("#checkpass").val() == "") {
      		alert("비밀번호체크를 입력해주세요!");
      		$("#checkpass").focus();
      		return false;
      	}
      	
      	// 비밀번호 유효성 검사
      	if(!getCheck.test($("#pass").val())) {
	      	alert("형식에 맞춰서 비밀번호를 입력해주세요!");
	      	$("#pass").val("");
	      	$("#pass").focus();
	      	return false;
      	}	
      	
        // 아이디와 비밀번호가 같은지 검사
        if ($("#id").val()==($("#pass").val())) {
	        alert("비밀번호와 ID가 똑같습니다!");
	        $("#pass").val("");
	        $("#pass").focus();
	        return false;
        }
   
        // 비밀번호와 비밀번호체크가 같은지 검사
        if($("#pass").val() != ($("#checkpass").val())){ 
	        alert("비밀번호가 같지않습니다!");
	        $("#pass").val("");
	        $("#checkpass").val("");
	        $("#pass").focus();
        	return false;
        }
        
        // 이메일 공백 확인
        if($("#email").val() == ""){
          	alert("이메일을 입력해주세요!");
          	$("#email").focus();
          	return false;
        }
             
        // 이메일 유효성 검사
        if(!getMail.test($("#email").val())){
          	alert("이메일형식에 맞게 입력해주세요!")
          	$("#email").val("");
          	$("#email").focus();
          	return false;
        }
   
        // 닉네임 공백 확인
        if($("#nickName").val() == ""){
            alert("닉네임을 입력해주세요!");
            $("#nickName").focus();
            return false;
        }
        
        // 성별 체크 공백 확인
//         var count = 0;
//         var checksex = $(":input[name=sex]:radio:checked").val();
        
//         if(checksex.length == 0) {
//         	alert("성별을 체크해주세요!");
//         	return false;
//         }
		var frm = document.all;
		var radio_num = document.all.radio.length;
		var chk_i = 0;
		
		for(var i = 0; i<radio_num; i++) {
			if(frm.radio[i].checked==true){
				chk_i++;
				break;
			}
		}
		if(chk_i<=0) {
			alert("성별을 체크해주세요!");
			return false;
		}
        
        
	}
</script>
    <div class="main-form">
		<%@ include file="/WEB-INF/view/include/sidebar.jsp" %>
		<div class="main-body">
			<%@ include file="/WEB-INF/view/include/header.jsp" %>
		</div>
	</div>
    
    <!-- CONTAINER -->
    <div class="login-body">
            <div class="login-box">
                <div class="lb-header">
                    <span class="active" id="login-box-link">회원가입</span>
                </div>
                <form class="email-login" action="signup.do" method="post">
                    <div class="u-form-group">
                        <div>아이디&nbsp;</div><input type="text" id="id" name="id" placeholder="Id"/>
                        <button type="button" id="checkId" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>비밀번호&nbsp;</div><input type="password" id="pass" name="pass" placeholder="Password"/>&emsp;&emsp;&emsp;&emsp;&emsp;
                    </div>
                    <div class="u-form-group">
                        <div>비밀번호 확인&nbsp;</div><input type="password" id="checkpass" name="passcheck" placeholder="PasswordCheck"/>&emsp;&emsp;&emsp;&emsp;&emsp;
                    </div>
                    <div class="u-form-group">
                        <div>이메일&nbsp;</div><input type="text" id="email" name="email" placeholder="email"/>
                        <button type="button" id="checkEmail" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>닉네임&nbsp;</div><input type="text" id="nickName" name="nickName" placeholder="nickName"/>
                        <button type="button" id="checkNickName" class="check">중복확인</button>
                    </div>
                    <div class="u-form-group">
                        <div>성별&nbsp;</div>
                        <div class="radio">                        
                            <label for="sex1">남</label>
                            <input type="radio" id="sex1" name="sex" value="남"/>
                            <label for="sex2">여</label>
                            <input type="radio" id="sex2" name="sex" value="여"/>
                        </div>
                    </div>
                    <br>
                    <div class="u-form-group">
                        <input type="button" class="register" onclick="DosignUp();" value="일반 회원가입"/>&nbsp;&nbsp;
                        <button type="button" class="register" onclick="location.href='signupform-busker.do'">버스커 회원가입</button>
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
</body>
</html>