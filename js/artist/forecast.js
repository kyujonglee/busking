function realTimeWeather() {
  let today = new Date();
  let week = new Array("일", "월", "화", "수", "목", "금", "토");
  let year = today.getFullYear();
  let month = today.getMonth() + 1;
  let day = today.getDate();
  let hours = today.getHours();
  let minutes = today.getMinutes();

  $(".weather-date").html(
    month + "월 " + day + "일 " + week[today.getDay()] + "요일"
  );

  /*
   * 기상청 30분마다 발표
   * 30분보다 작으면, 한시간 전 hours 값
   */
  if (minutes < 30) {
    hours = hours - 1;
    if (hours < 0) {
      // 자정 이전은 전날로 계산
      today.setDate(today.getDate() - 1);
      day = today.getDate();
      month = today.getMonth() + 1;
      year = today.getFullYear();
      hours = 23;
    }
  }

  /* example
   * 9시 -> 09시 변경 필요
   */

  if (hours < 10) {
    hours = "0" + hours;
  }
  if (month < 10) {
    month = "0" + month;
  }
  if (day < 10) {
    day = "0" + day;
  }

  today = year + "" + month + "" + day;

  /* 좌표 */
  let _nx = 127,
    _ny = 33;
  const apikey =
    "WXA7tYINraNev4P5lTMXzUpl0Luv2u7LntvWuzc99wSvI9g1CGgkQdPeu8la%2FJLknjtTk2e3DRLy05jT%2Bhlbjw%3D%3D";
  let ForecastGribURL =
    "http://newsky2.kma.go.kr/service/SecndSrtpdFrcstInfoService2/ForecastGrib";
  ForecastGribURL += "?ServiceKey=" + apikey;
  ForecastGribURL += "&base_date=" + today;
  ForecastGribURL += "&base_time=" + hours + "00";
  ForecastGribURL += "&nx=" + _nx + "&ny=" + _ny;
  ForecastGribURL += "&pageNo=1&numOfRows=7";
  ForecastGribURL += "&_type=json";

//   $.ajax({
//     dataType : "jsonp",
//     url :url
// }).done(json=>console.log(json))
// .fail(error=>console.log(error));
}

// const API_KEY = "d3bf0d7d2d5b1152cc9ad6fde52607b6";
// const lat = 37.541;
// const lon = 126.986;

// $("#weather").click(() => {
//     getWeather();
// });
// function getWeather() {
//   fetch(
//     `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
//   ).then(response => response.json())
//   .then(json=>{
//       console.log(json);
//       $(".weather-date").html(json.list[0].name);
//   });
// }


