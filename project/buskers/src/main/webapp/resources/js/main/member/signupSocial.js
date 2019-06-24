
$(".signout").click(function() {
// 		alert("Asd");	
		//구글로그아웃
		$.ajax({
		        type : "POST",
		        dataType : 'text',
		        url : 'https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost/application-name/logoutUser',
		        crossDomain : true,
		        xhrFields : {
		           withCredentials : true
		        }
	     })
	     /*
	     function onLoad() {
	         gapi.load('auth2', function() {
	           gapi.auth2.init();
	         });
	       }
	     function signOut() {
	    	    var auth2 = gapi.auth2.getAuthInstance();
	    	    auth2.signOut().then(function () {
	    	    	alert("사인아웃실행됨");
    	        console.log('User signed out.');
    	    });
    	  }
	   
		onLoad();
	    signOut();
	    */
		var naverLogin = new naver.LoginWithNaverId(	
				{
					clientId: "SPRQERrB_l9ca0FeJSNq",
					callbackUrl: "http://localhost/buskers/main/member/loginform.do",
					isPopup: false,
					callbackHandle: true,
				}
		);
		naverLogin.init();
		// 네이버 세션 로그아웃 처리
		naverLogin.logout();
		// 네이버 로그아웃처리
		 $.ajax({
		        type : "POST",
		        dataType : 'text',
		        url : "http://nid.naver.com/nidlogin.logout",
		        crossDomain : true,
		        xhrFields : {
		           withCredentials : true
		        }
	     })
		location.href="<c:url value='/main/member/logout.do'/>";
});













let nickNameck = 0;





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

function DosignUp() {
	let getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
 	let getCheck = RegExp(/^[a-zA-Z0-9]{4,16}$/);
 	let getCheckPwd = RegExp(/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/);
  	let getName = RegExp(/^[가-힣]+$/);
  	
    // 닉네임 공백 확인
    if($("#nickName").val() == ""){
        alert("닉네임을 입력해주세요!");
        $("#nickName").focus();
        return false;
    }
    
    
    if(confirm("회원가입을 하시겠습니까?")) {
    	if (nickNameck == 0) {
    		alert("닉네임 중복체크를 해주세요!");
    		return false;
    	} else {
        	alert("회원가입을 축하합니다!");
        	return true;
    	}
    }
}