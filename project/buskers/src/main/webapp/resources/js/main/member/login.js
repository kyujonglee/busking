let msg = '${msg}';
    	if (msg === 'msgPass') {
			alert("비밀번호가 틀렸습니다!");    		
    	} else if (msg === 'msgId') {
    		alert("아이디가 틀렸습니다!");
    	} else if (msg === 'msgOk2') {
    		Swal.fire({
    			  title:'로그인후에 이용가능합니다',
    			  type:'info',
    			  backdrop:'rgba(240,240,240,1)'
    		});
    		
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
    		
    	//카카오로그인
        Kakao.init('519496cf424356ba7d05e9feb9606800');
        function loginWithKakao() {
          // 로그인 창을 띄웁니다.
          Kakao.Auth.loginForm({
            success: function(authObj) {
            	 Kakao.API.request({
    		      	 url: '/v1/user/me',
     			     success: function(res) {
//      			    	 alert("카카오로그인실행");
//     		             alert(JSON.stringify(res)); //<---- kakao.api.request 에서 불러온 결과값 json형태로 출력
//     		             alert(JSON.stringify(authObj)); //<----Kakao.Auth.createLoginButton에서 불러온 결과값 json형태로 출력
//     		             console.log("아이디"+res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
//     		             console.log("성별"+res.gender);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
//     		             console.log("닉네임"+res.properties['nickname']);//<---- 콘솔 로그에 닉네임 출력(properties에 있는 nickname 접근 
//     		             console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
//                       console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
//                       console.log(authObj.refresh_token);//<---- 콘솔 로그에 토큰값 출력
    					 let member = {id:res.id,nickName:res.properties['nickname'],
    					 accessToken:authObj.access_token,refreshToken:authObj.refresh_token}
    					 $.ajax({
    						type:"POST",
    						data:member,
    						url:"social-checkid.do",
    					 }).done(function(result){
//     						alert(result);  //결과값  0또는 1을 반환 , 0은 회원가입 1은 기존유저 확인
    						//회원 디비가 없을경우
    						if(result == 0){
    							 $("#social-signup #memberId").val(res.id);
    		    			     $("#social-signup #nickName").val(res.properties['nickname']);
    		    			     $("#social-signup #memberType").val("k");
    							 $("#social-signup").submit();
    						}else{
    							$("#social-login #memberId").val(res.id);
    	    					$("#social-login #nickName").val(res.properties['nickname']);
    	    					$("#social-login #accessToken").val(authObj.access_token);
//     							$("#social-login").submit();
    							 $("#social-login").submit();
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
    		
    

     /////////////네이버 로그인
     var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "SPRQERrB_l9ca0FeJSNq",
			callbackUrl: "http://localhost/buskers/main/member/loginform.do",
			isPopup: false,
			callbackHandle: true,
			loginButton: {color: "green", type: 3, height: 40,width:200} /* 로그인 버튼의 타입을 지정 */
		}
	);
	naverLogin.init();
	window.addEventListener('load', function () {
		naverLogin.getLoginStatus(function (status) {
			if (status) {
				/* (5) 필수적으로 받아야하는 프로필 정보가 있다면 callback처리 시점에 체크 */
				var email = naverLogin.user.getEmail();
				if( email == undefined || email == null) {
					alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
					/* (5-1) 사용자 정보 재동의를 위하여 다시 네아로 동의페이지로 이동함 */
					naverLogin.reprompt();
					return;
				}
// 				alert(naverLogin.accessToken.accessToken);
// 				alert(naverLogin.user.getName());
// 				alert(naverLogin.user.getId());
				let id = naverLogin.user.getId();
// 				let tk = naverLogin.accessToken.accessToken; //토큰가져오기
				let name = naverLogin.user.getName();
				let member = {id:id,
							  nickName:name,
							  }
    					$.ajax({
    						type:"POST",
    						data:member,
    						url:"social-checkid.do",
    					}).done(function(result){	
    						alert(result);  //결과값  0또는 1을 반환 , 0은 회원가입 1은 기존유저 확인
    						if(result == 0){
    							 $("#social-signup #memberId").val(id);
    		    			     $("#social-signup #nickName").val(name);
    		    			     $("#social-signup #memberType").val("v");
    							 $("#social-signup").submit();
    						}else{
    							$("#social-login #memberId").val(id);
    	    					$("#social-login #nickName").val(name);
    							$("#social-login").submit();
    						}
    					}).fail(function(xhr){
    						alert("서버 처리중 에러발생")
    						console.dir(xhr);
    					})

			} else {
				console.log("callback 처리에 실패하였습니다.");
			}
		});
	});
	

		
	function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  let id = profile.getId();
	  let name =profile.getName();
	  let member = {id:id,
			  	    nickName:name,
// 			        accessToken:tk
	  				}
		$.ajax({
			type:"POST",
			data:member,
			url:"social-checkid.do",
		}).done(function(result){	
			//회원 디비가 없을경우
			if(result == 0){
				 $("#social-signup #memberId").val(id);
			     $("#social-signup #nickName").val(name);
			     $("#social-signup #memberType").val("g");
				 $("#social-signup").submit();
			}else{
				$("#social-login #memberId").val(id);
				$("#social-login #nickName").val(name);
				$("#social-login").submit();
			}
		}).fail(function(xhr){
			alert("서버 처리중 에러발생")
			console.dir(xhr);
		})
	  
	  
	  
	  
	}