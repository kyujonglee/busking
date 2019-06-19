$(document).ready(function(){
	if(isAgency){
		$("#message_detail_content").text(`<업체정보>\n업체명 : ${agencyName}\n전화번호 : ${phone}\n이메일 : ${email}\n주소 : ${basicAddr} ${detailAddr}\n\n${content}
		`);
	}else {
		$("#message_detail_content").text(content);
	}
});
