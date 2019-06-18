function agencyDetail(url,agencyMemberNo,memberNo){
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
		const agencyInfoNo = $(this).parent().parent().attr("no");
		const memberNo = $(this).parent().parent().attr("memberNo");
		$.ajax({
			url : updateUrl,
			data : {permission:per, agencyInfoNo:agencyInfoNo, memberNo : memberNo}
		}).done(()=>{console.log("success")});
	})
});

const moveCheckForm = () => {
	if(isAgency){
		Swal.fire({
		  title:'이미 업체등록이 완료된 회원입니다.',
		  type:'info',
		  timer:2000
		});
	} else {
		location.href = checkFormUrl;
	}
};

