function deleteAgency(path,agencyInfoNo,memberNo = "") {
//	$("agency-insert__btn-content .agency-insert__btn:eq(1)").click(function(e) {
    Swal.fire({
        title: '정말로 삭제하시겠습니까? ',
        text: '삭제하면 메모를 되돌릴 수 없습니다.',
        type: 'warning',
        showCancelButton: true,
        confirmButtonText: '삭제하겠습니다.',
        cancelButtonText: '아닙니다. 유지하겠습니다.'
      }).then((result) => {
        if (result.value) {
          Swal.fire({
            title : 'Deleted!',
            text : '삭제되었습니다.',
            type : 'success',
            timer : 3000
          })
          // 삭제 진행하는 코드
          setTimeout(function(){
        	  location.href=path+agencyInfoNo+"&memberNo="+memberNo;
          },1000);
          console.log('delete');
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          Swal.fire({
            title : 'Cancelled',
            text : '삭제하는 중 에러가 발생했습니다. :)',
            type : 'error',
            timer : 1000
          })
        }
      })
//  });
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
		$.ajax({
			url : updateUrl,
			data : {permission:per, agencyInfoNo:agencyInfoNo, memberNo : memberNo}
		}).done(()=>{console.log("success")});
	})
});
