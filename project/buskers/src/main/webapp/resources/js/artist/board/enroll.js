$(".busker-enroll__date").flatpickr({
  enableTime: true,
  onDayCreate: function(selectedDates, dateStr, instance) {
    const todayDate = new Date();
    if (selectedDates[0] < todayDate) {
      alert("현재 날짜 이후로 선택이 가능합니다.");
      return false;
    }
  }
});

function init() {
  console.log("초기실행");
  let lat = 37.5642135;
  let lon = 127.0016985;
  if (navigator.geolocation) {
    // GPS를 지원하면
    navigator.geolocation.getCurrentPosition(
      function(position) {
        lat = position.coords.latitude;
        lon = position.coords.longitude;
        mapInit(lat, lon);
        return;
      },
      function(error) {
        mapInit(lat, lon);
        console.error(error);
      },
      {
        enableHighAccuracy: false,
        maximumAge: 0,
        timeout: Infinity
      }
    );
  } else {
    alert("GPS를 지원하지 않습니다");
    mapInit(lat, lon);
  }
}
init();