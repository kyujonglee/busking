let memberNo = "${sessionScope.user.memberNo}";
	$("#cashButton").click(function(){
		let cash = $('#cash').val()
		var IMP = window.IMP;
		IMP.init('imp76471212');
		IMP.request_pay({
		    pg : 'kakao', // version 1.1.0부터 지원.
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : 'buskers_충전',
		    amount : cash,
		    buyer_email : '유저-이메일',
		    buyer_name : '유저-이름',
		    buyer_tel : '유저-전화번호',
		    buyer_addr : '유저-주소',
		    buyer_postcode : '123-456',
		    m_redirect_url : 'localhost/buskers/main/main.do'
		}, function(rsp) {
		    if ( rsp.success ) {
// 	// 	        msg += '고유ID : ' + rsp.imp_uid;
// 	// 	        msg += '상점 거래ID : ' + rsp.merchant_uid;
// 	// 	        msg += '결제 금액 : ' + rsp.paiCd_amount;
// 	// 	        msg += '카드 승인번호 : ' + rsp.apply_num;

// 				//결제금액
		        let cash = rsp.paid_amount;
				
				$.ajax({
					type:"POST",
					data:{memberNo:memberNo,sum:cash},
					url:"charge-money.do",
				}).done(function(result){

				}).fail(function(xhr){
					alert("서버 처리중 에러발생")
				});
				Swal.fire({
					  title:cash+'충전이 완료됐습니다.',
					  type:'success',
					  timer:2000	
				});

		    } else {
		    	 Swal.fire({
					  title:'결제를 취소하셨습니다.',
					  type:'info',
					  timer:2000	
				});
		    }
		});
	})		