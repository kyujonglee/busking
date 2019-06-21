const insertBusker = document.insertBusker;
const activityName = insertBusker.activityName;
const phone = insertBusker.phone;
const buskerCheckbox = insertBusker.buskerCheckbox;
let activityNameck = 0;
	
$("#activityName").on("change paste keyup", function() {
	activityNameck = 0;
});
	


	//활동명 중복 체크
	$(function() {
		$("#checkActivityName").click(function() {
			let activityName = $("#activityName").val();
			
			if(activityName.length < 1) {
				alert("활동명을 입력해주시기 바랍니다.");
			} else {
				$.ajax({
					data: "activityName="+activityName,
					url: "checkActivityName.do",
					success: function(result) {
						if (result == 0) {
							alert("사용가능한 활동명입니다.");
							activityNameck = 1;
						} else if (result == 1) {
							alert("같은 활동명이 존재합니다. \n다른 활동명을 입력해주세요.");
						} else {
							alert("에러 발생");
						}
					}
				});
			}
		});
	});

	function buskerCheck() {
		if (isEmpty(activityName, "활동명을 입력해주세요!")) return false;
		
		if (phone.value === "") {
			alert("연락처를 입력해주세요!")
			return false;
		} else {
			if (!isCellPhone(phone.value)){
				alert("연락처를 형식에 맞게 입력해주세요\n ex) 010-3333-3333");
				return false;
			}
		}
		
		if (!checkbox(buskerCheckbox)) {
			alert("관심분야를 1가지이상 선택하세요.");
			return false;
		}
		
		if(confirm("버스커등록을 하시겠습니까?")) {
        	if (activityNameck == 0) {
        		alert("활동명 중복체크를 해주세요!");
        		return false;
        	} else {
        		return signupBusker();
        	}
		}
	}
	
	// 체크박스 체크
	function checkbox(buskerCheckbox){
		 let flag = false;
		 for(let check of buskerCheckbox){
			 if(check.checked){
				 flag = true;
				 break;
			 };
		 }
		 return flag;
	}
	
	// 연락처 유효성 검사.
	function isCellPhone(p) {
		const phonenum = $('#phone').val();
		const regPhone = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
		if(!regPhone.test(phonenum)){
			$('#phone').select();
			return false;    
		}
		return true;
	}
	
	// 공백일때 메시지
	function isEmpty(ele, msg) {
		if (ele.value == "") {
			alert(msg);
			ele.focus();
			return true;
		}
		return false;
	}
	
	
	function signupBusker(){
		alert("버스커로 등록 되었습니다!");
		setTimeout(function(){
			return true;
		},2000);
	}