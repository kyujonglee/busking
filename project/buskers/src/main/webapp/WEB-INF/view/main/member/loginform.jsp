<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" />
    <link rel="stylesheet" href="<c:url value='/resources/css/main/member/login.css'/>" />
    <script src="<c:url value='/resources/js/jquery-3.4.1.min.js'/>"></script>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>로그인</title>    
<main class="main-board">    
    <!-- CONTAINER -->
    <div class="login-body">
        <div class="login-box">
            <div class="lb-header">
                <span class="active" id="login-box-link">로그인</span>
            </div>
            <form class="email-login" method="post">
                <div class="u-form-group">
                    <input type="text" name="id" id="id" placeholder="Id"/>
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
                <a id="custom-login-btn" href="javascript:loginWithKakao()">
                <i class="fa fa-naver fa-lg"></i>
                카카오 로그인
                </a>
            </div>
<!--                 <a id="kakao-login-btn"> -->
<!--                 <a href="https://kauth.kakao.com/oauth/authorize?client_id=0bb6a0ac8b05e537563536bc17b336e9&redirect_uri=http://localhost/buskers/kakaologin.do&response_type=code" id="kakao">카카오로그인</a> -->
        </div>
    </div>
    <form id="kakao-member" method="POST" action="kakao-signup.do">
    	<input type="hidden"  id="memberId" name="id"  value=""/>
    	<input type="hidden"  id="nickName" name="nickName" value=""/>
    	<input type="hidden"  id="accessToken" name="accessToken" value=""/>
    </form>
   <form id="kakao-login" method="POST" action="kakao-login.do">
    	<input type="hidden"  id="memberId" name="id"  value=""/>
    	<input type="hidden"  id="nickName" name="nickName" value=""/>
    	<input type="hidden"  id="accessToken" name="accessToken" value=""/>
    </form> 
</main>
    <script>
    	let msg = '${msg}';
    	if (msg === 'msgPass') {
			alert("비밀번호가 틀렸습니다!");    		
    	} else if (msg === 'msgId') {
    		alert("아이디가 틀렸습니다!");
    	}
    	$("#login").click(function() {
    		let id = $("#id").val();
    		let pass = $("#pass").val();
    		if(id == ""){
    			alert("아이디를 입력하세요.");
    			$("#id").focus();
    			return false;
    		}
    		if(pass == ""){
    			alert("비밀번호를 입력하세요.");
    			$("#pass").focus();
    			return false;
    		}
    		$(".email-login").attr({
   				"action": "login.do"
    		});
    	});
    		
    	
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('519496cf424356ba7d05e9feb9606800');
        function loginWithKakao() {
          // 로그인 창을 띄웁니다.
          Kakao.Auth.loginForm({
            success: function(authObj) {
            	 Kakao.API.request({
    		      	 url: '/v1/user/me',
     			     success: function(res) {
//     		             alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
//     		             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
//     		             console.log("아이디"+res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
//     		             console.log("성별"+res.gender);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
//     		             console.log("닉네임"+res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
//     		             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
    		//           console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
    		//           console.log(authObj.refresh_token);//<---- 콘솔 로그에 토큰값 출력

    		
    					 let member = {id:res.id,gender:res.gender,email:res.kaccount_email,nickName:res.properties['nickname'],
    					 accessToken:authObj.access_token,refreshToken:authObj.refresh_token}
    					 $.ajax({
    						type:"POST",
    						data:member,
    						url:"kakao-checkid.do",
    					 }).done(function(result){
    						alert(result);
    						//회원 디비가 없을경우
    						if(result == 0){
    							 $("#kakao-member #memberId").val(res.id);
    		    			     $("#kakao-member #nickName").val(res.properties['nickname']);
    		    			     $("#kakao-member #accessToken").val(authObj.access_token);
    							 $("#kakao-member").submit();
    						}else{
    							$("#kakao-login #memberId").val(res.id);
    	    					$("#kakao-login #nickName").val(res.properties['nickname']);
    	    					$("#kakao-login #accessToken").val(authObj.access_token);
    							$("#kakao-login").submit();
    						}
    					}).fail(function(xhr){
    						alert("서버 처리중 에러발생")
    						console.dir(xhr);
    					})
              	 	}
             	})
            },
            fail: function(err) {
            	alert(JSON.stringify(err));
            }
          });
        };
    		
    	/*
		   // 사용할 앱의 JavaScript 키를 설정해 주세요.
		   Kakao.init('519496cf424356ba7d05e9feb9606800');
		   // 카카오 로그인 버튼을 생성합니다.
		   Kakao.Auth.createLoginButton({
		   container: '#kakao-login-btn',
		   success: function(authObj) {
		     Kakao.API.request({
		      	 url: '/v1/user/me',
 			     success: function(res) {
		             alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
		             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
		             console.log("아이디"+res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
		             console.log("성별"+res.gender);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
		             console.log("닉네임"+res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
		             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
		//           console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
		//           console.log(authObj.refresh_token);//<---- 콘솔 로그에 토큰값 출력
		
					 //hidden에 값을 넣어줌.
					 $("#memberId").val(res.id);
					 $("#nickName").val(res.properties['nickname']);
					 $("#accessToken").val(authObj.access_token);
					 
					 let member = {id:res.id,gender:res.gender,email:res.kaccount_email,nickName:res.properties['nickname'],
					 accessToken:authObj.access_token,refreshToken:authObj.refresh_token}
					 
					 $.ajax({
						type:"POST",
						data:member,
						url:"kakao-checkid.do",
					 }).done(function(result){
						alert(result);
						//회원 디비가 없을경우
						if(result == 0){
							$("#kakao-member").submit();
						}else{
							$("#kakao-login").submit();
							
						}
						
					 }).fail(function(xhr){
						alert("서버 처리중 에러발생")
						console.dir(xhr);
					 })
           }
         })
       },
       fail: function(error) {
         alert(JSON.stringify(error));
       }
     });
		     
		  */   
		  
    </script>
