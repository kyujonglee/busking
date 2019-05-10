function deleteAgency(path,agencyInfoNo) {
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
            text : '리얼루다가 삭제됨!',
            type : 'success',
            timer : 3000
          })
          // 삭제 진행하는 코드
          setTimeout(function(){
        	  location.href=path+agencyInfoNo;
          },1000);
          console.log('delete');
        } else if (result.dismiss === Swal.DismissReason.cancel) {
          Swal.fire({
            title : 'Cancelled',
            text : '휴~ 아직 삭제안됨! :)',
            type : 'error',
            timer : 1000
          })
        }
      })
//  });
}
