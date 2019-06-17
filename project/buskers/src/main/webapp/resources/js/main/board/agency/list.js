function agencyDetail(url,agencyMemberNo,memberNo){
	console.log(isAdmin);
	if(memberNo === parseInt(agencyMemberNo) || isAdmin){
		location.href = url;
		return;
	};
	Swal.fire({
	  title:'다른 회원의 게시물을 볼 수 없습니다.',
	  type:'info',
	  timer:2000
	});
}

$(document).ready(function(){
	$(".agency-table__admin").click(function(){
		let per = $(this).parent().parent().attr("per");
		$(this).toggleClass("ing").toggleClass("end");
		if(per === 'y'){
			$(this).parent().parent().attr("per",'n');
			$(this).text("신청중");
			per = 'n';
		}else {
			$(this).parent().parent().attr("per",'y');
			$(this).text("등록완료");
			per = 'y';
		}
		const no = $(this).parent().parent().attr("no");
		$.ajax({
			url : updateUrl,
			data : {permission:per, agencyInfoNo:no}
		}).done(()=>{console.log("success")});
	})
});

