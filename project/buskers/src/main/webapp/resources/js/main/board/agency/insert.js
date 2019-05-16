console.log("insert");
const insertForm = document.insertForm;
const email1 = insertForm.email1;
const email2 = insertForm.email2;
const email = insertForm.email;
const agencyName = insertForm.agencyName;
const purpose = insertForm.purpose;
const phone = insertForm.phone;
const basicAddr = insertForm.basicAddr;
const detailAddr = insertForm.detailAddr;
const agencyCheckbox = insertForm.agencyCheckbox;
const searchAddr = insertForm.searchAddr;
searchAddr.setAttribute('checkaddr','n');


$("#searchAddr").click(function(){
	$(this).attr('checkaddr','y');
});

function allCheck(){
	email.value = email1.value +'@'+ email2.value;
	if (isEmpty(agencyName, "업체명을 입력해주세요"))return false;
	if (isEmpty(purpose, "목적을 입력해주세요"))return false;
	if (isEmpty(email, "이메일을 입력해주세요"))return false;
	
	if (!checkEmail(email)) {
		alertInfo("이메일을 형식에 맞게 입력해주세요","ex) kyu****@naver.com");
		return false;
	}
	// email유효성 검사 할 것!!
	// 체크박스 선택범위 늘리기!!
	
	if (phone.value === ""){
		alertInfo("연락처를 입력해주세요");
		return false;
	}else {
		if (!isCellPhone(phone.value)){
			alertInfo("연락처를 형식에 맞게 입력해주세요","ex) 010-3333-3333");
			return false;
		}
	}
	if (searchAddr.getAttribute('checkaddr') === 'n'){
		alertInfo("주소검색 버튼을 눌러주세요.","버튼을 눌러 주소를 선택해주세요.");
		return false;
	}
	if (isEmpty(basicAddr, "기본주소를 입력해주세요"))return false;
	if (isEmpty(detailAddr, "상세주소를 입력해주세요"))return false;
	if (!checkbox(agencyCheckbox)) {
		alertInfo("관심분야를 선택하세요.","관심분야를 1가지이상 선택하세요.");
		return false;
	}
	return insertAgency();
}

function checkEmail(email){
	const emailVal = email.value;
	const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	return (emailVal.match(regExp) == null)? false:true;
}

function checkbox(agencyCheckbox){
	 let flag = false;
	 for(let check of agencyCheckbox){
		 if(check.checked){
			 flag = true;
			 break;
		 };
	 }
	 return flag;
}

function alertInfo(msg,text){
	// sweetalert 쓰기 
	// isEmpty function 도 고치기
	Swal.fire({
	  title:msg,
	  text:text,
	  type:'info',
	  timer:2000
	});
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

function insertAgency(){
//	console.log(email1.val()+"@"+email2.val());
	email.val(email1.val()+"@"+email2.val());
	Swal.fire({
	  title:'등록되었습니다.',
	  text:'허가가 날 때까지 기다려주시기 바랍니다.',
	  type:'info',
	  timer:2000
	});
	setTimeout(function(){
		return true;
	},2000);
};

function isEmpty(ele, msg) {
	if (ele.value == "") {
		alertInfo(msg);
		ele.focus();
		return true;
	}
	return false;
}


//팝업주소띄우기!
//opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/buskers/popup/jusopopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
//	document.insertForm.roadAddrPart1.value = roadAddrPart1 + roadAddrPart2;
//	document.insertForm.addrDetail.value = addrDetail;
//	$("#insertForm input[name='']").val(roadAddrPart1);
	insertForm.basicAddr.value = roadAddrPart1 + roadAddrPart2;
	insertForm.detailAddr.value = addrDetail;
}
