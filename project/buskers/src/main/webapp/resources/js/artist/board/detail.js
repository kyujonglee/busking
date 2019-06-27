function init() {
  mapInit(lat, lon);
}
const update = (showNo, enrollDate) => {
  if(new Date() > new Date(enrollDate)){
	  alert("현재 날짜 이전의 공연날짜는 수정할 수 없습니다.");
  }else {
	  location.href = `updateForm.do?showNo=${showNo}&buskerNo=${paramBuskerNo}`;
  }
};
init();