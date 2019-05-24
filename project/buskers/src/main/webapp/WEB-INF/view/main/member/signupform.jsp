<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/member/register.css'/>" />
<script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
<title>회원가입</title>
<script type="text/javascript">
	let idck = 0;
	let emailck = 0;
	let nickNameck = 0;

	// 아이디 중복 체크
	$(function() {
		$("#checkId").click(function() {
			let id = $("#id").val();
			
			if(id.length < 1) {
				alert("아이디를 입력해주시기 바랍니다.");
			} else {
				$.ajax({
					data: "id="+id,
					url: "checkId.do",
					success: function(result) {
						if (result == 0) {
							alert("사용가능한 아이디입니다.");
							idck = 1;
						} else if (result == 1) {
							alert("아이디가 존재합니다. \n다른 아이디를 입력해주세요.");
						} else {
							alert("에러 발생");
						}
					}
				});
			}
		});
	});
	
	// 이메일 중복 체크
	$(function() {
		$("#checkEmail").click(function() {
			let email = $("#email").val();
			
			if(email.length < 1) {
				alert("이메일을 입력해주시기 바랍니다.");
			} else {
				$.ajax({
					data: "email="+email,
					url: "checkEmail.do",
					success: function(result) {
						if (result == 0) {
							alert("사용가능한 이메일입니다.");
							emailck = 1;
						} else if (result == 1) {
							alert("이메일이 존재합니다. \n다른 이메일로 입력해주세요.");
						} else {
							alert("에러 발생");
						}
					}
				});
			}
		});
	});
	
	// 닉네임 중복 체크
	$(function() {
		$("#checkNickName").click(function() {
			let nickName = $("#nickName").val();
			
			if(nickName.length < 1) {
				alert("닉네임을 입력해주시기 바랍니다.");
			} else {
				$.ajax({
					data: "nickName="+nickName,
					url: "checkNickName.do",
					success: function(result) {
						if (result == 0) {
							alert("사용가능한 닉네임입니다.");
							nickNameck = 1;
						} else if (result == 1) {
							alert("닉네임이 존재합니다. \n다른 닉네임으로 입력해주세요.");
						} else {
							alert("에러 발생");
						}
					}
				});
			}
		});
	});
	
	function DosignUp() {
		let getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
     	let getCheck = RegExp(/^[a-zA-Z0-9]{4,16}$/);
     	let getCheckPwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
      	let getName = RegExp(/^[가-힣]+$/);
      	
      	// 모듈화
//       	function availability(ele, msg) {
//       		if(ele.val() == "") {
//       			alert(msg)
//       			$(ele).focus()
//       			return false;
//       		}
//       	}
//       	$("#write_form").submit(availability($("#id"), "ID를 입력해주세요!!!!"))

      	
      	// 아이디 공백 확인
      	if($("#id").val() == "") {
      		alert("ID를 입력해주세요!");
      		$("#id").focus();
      		return false;
      	}
      	
      	// 이름 유효성 검사
      	if(!getCheck.test($("#id").val())) {
      		alert("형식에 맞춰서 ID를 4자이상 입력해주세요!");
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
      	
      	
      	// 비밀번호 유효성 검사
      	if(!getCheckPwd.test($("#pass").val())) {
	      	alert("비밀번호는 영문(대/소문자),숫자를 혼용하여 8~16자를 입력해주세요!");
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
   
        
     	// 비밀번호체크 공백 확인
      	if($("#checkpass").val() == "") {
      		alert("비밀번호체크를 입력해주세요!");
      		$("#checkpass").focus();
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
		if($("input:radio[name='sex']").is(":checked") == false) {
            alert("성별을 체크해주세요!");
            return false;
        }
        
        if(confirm("회원가입을 하시겠습니까?")) {
        	if (idck == 0) {
        		alert("아이디 중복체크를 해주세요!");
        		return false;
        	} else if (emailck == 0) {
        		alert("이메일 중복체크를 해주세요!");
        		return false;
        	} else if (nickNameck == 0) {
        		alert("닉네임 중복체크를 해주세요!");
        		return false;
        	} else {
	        	alert("회원가입을 축하합니다!");
	        	return true;
        	}
        }
	}
</script>
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