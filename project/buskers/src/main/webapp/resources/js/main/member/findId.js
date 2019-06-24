$("#findId").click(function() {
	let email = $("#findEmail").val();
	if(email == ""){
		alert("이메일을 입력하세요.");
		$("#findEmail").focus();
		return false;
	}
	$(".email-login").attr({
			"action": "findId.do"
	});
	
});
let msg = '${msg}';
if (msg === 'msgEmail') {
	alert("존재하지않는 이메일 입니다!");    		
}