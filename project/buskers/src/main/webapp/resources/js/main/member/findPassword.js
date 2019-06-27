$("#findPass").click(function() {
		let id = $("#id").val();
		let email = $("#email").val();
	
		if(id.length < 1) {
			alert("아이디를 입력해주시기 바랍니다.");
			$("#id").focus();
			return false;
		} else if(email.length < 1) {
			alert("이메일을 입력해주시기 바랍니다.");
			$("#email").focus();
			return false;
		} else {
			$(".email-login").attr({
   				"action": "findPass.do"
    		});
		}
	}); 
	if (msg === 'msgFalse') {
		alert("이메일 혹은 아이디가 일치하지 않습니다!");    		
	}
	if (msg === 'msgMatch') {
		alert("스프링 암호화 로직 오류!");
	}