console.log("insert");
const insertForm = document.insertForm;
const email1 = insertForm.email1;
const email2 = insertForm.email2;
const email = insertForm.email;
const agencyName = insertForm.agencyName;
const purpose = insertForm.purpose;
const phone = insertForm.phone;
const searchAddr = insertForm.searchAddr;
searchAddr.setAttribute('checkAddr','n');

$("#searchAddr").click(function(){
	$(this).attr('checkAddr','y');
});

function allCheck(){
	email.value = email1.value + email2.value;
	console.log(email.value);
//	console.log(searchAddr);
	console.log(searchAddr.getAttribute('checkAddr'));
	if (isEmpty(agencyName, "업체명을 입력해주세요"))return false;
	if (isEmpty(purpose, "목적을 입력해주세요"))return false;
	if (isEmpty(email, "이메일을 입력해주세요"))return false;
	if (isEmpty(phone, "연락처를 입력해주세요"))return false;
	return insertAgency();
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
		alert(msg);
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
	var pop = window.open("/buskers/main/board/agency/jusopopup.do","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
	//var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes");
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
//	document.insertForm.roadAddrPart1.value = roadAddrPart1 + roadAddrPart2;
//	document.insertForm.addrDetail.value = addrDetail;
//	$("#insertForm input[name='']").val(roadAddrPart1);
	insertForm.find("#roadAddrPart1").val(roadAddrPart1 + roadAddrPart2);
	insertForm.find("#addrDetail").val(addrDetail);
}
