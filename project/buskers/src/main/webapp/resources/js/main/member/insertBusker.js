const insertBusker = document.insertBusker;
const activityName = insertBusker.activityName;
const phone = insertBusker.phone;
const buskerCheckbox = insertBusker.buskerCheckbox;

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
		
		return signupBusker();
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