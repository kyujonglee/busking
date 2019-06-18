const checkAgencyCode = () => {
	const agencyCode = $("#agencyCode").val();
	$.ajax({
		url : agencyUrl,
		data : { agencyCode : agencyCode }
	}).done( result => {
		console.log("success");
		if(result === 0){
			alert("해당 업체번호가 존재하지 않습니다.");
		}else {
			alert("업체등록이 되었습니다.");
			$.ajax({
				url : agencyEnrollUrl,
				data : {agencyCode : agencyCode, memberNo : memberNo}
			}).done(()=>{
				alert("shit");
				location.href = agencyListUrl;
			})
		}
	});
}

$("#agencyCode").keyup(function(){
	const agencyCode = $(this).val();
	$.ajax({
		url : agencyUrl,
		data : { agencyCode : agencyCode }
	}).done( result => {
		console.log("success");
		if(result === 0){
			$(this).css({"border-color" : "red"});
		}else {
			$(this).css({"border-color" : "skyblue"});
		}
	});
});