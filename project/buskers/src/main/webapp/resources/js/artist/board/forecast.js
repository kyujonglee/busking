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


const openweathermapKorean = [{"Parameter":200,"English":"thunderstorm with light rain","Korean":"가벼운 비를 동반한 천둥구름"},
{"Parameter":201,"English":"thunderstorm with rain","Korean":"비를 동반한 천둥구름"},
{"Parameter":202,"English":"thunderstorm with heavy rain","Korean":"폭우를 동반한 천둥구름"},
{"Parameter":210,"English":"light thunderstorm","Korean":"약한 천둥구름"},
{"Parameter":211,"English":"thunderstorm","Korean":"천둥구름"},
{"Parameter":212,"English":"heavy thunderstorm","Korean":"강한 천둥구름"},
{"Parameter":221,"English":"ragged thunderstorm","Korean":"불규칙적 천둥구름"},
{"Parameter":230,"English":"thunderstorm with light drizzle","Korean":"약한 연무를 동반한 천둥구름"},
{"Parameter":231,"English":"thunderstorm with drizzle","Korean":"연무를 동반한 천둥구름"},
{"Parameter":232,"English":"thunderstorm with heavy drizzle","Korean":"강한 안개비를 동반한 천둥구름"},
{"Parameter":300,"English":"light intensity drizzle","Korean":"가벼운 안개비"},
{"Parameter":301,"English":"drizzle","Korean":"안개비"},
{"Parameter":302,"English":"heavy intensity drizzle","Korean":"강한 안개비"},
{"Parameter":310,"English":"light intensity drizzle rain","Korean":"가벼운 적은비"},
{"Parameter":311,"English":"drizzle rain","Korean":"적은비"},
{"Parameter":312,"English":"heavy intensity drizzle rain","Korean":"강한 적은비"},
{"Parameter":313,"English":"shower rain and drizzle","Korean":"소나기와 안개비"},
{"Parameter":314,"English":"heavy shower rain and drizzle","Korean":"강한 소나기와 안개비"},
{"Parameter":321,"English":"shower drizzle","Korean":"소나기"},
{"Parameter":500,"English":"light rain","Korean":"약한 비"},
{"Parameter":501,"English":"moderate rain","Korean":"중간 비"},
{"Parameter":502,"English":"heavy intensity rain","Korean":"강한 비"},
{"Parameter":503,"English":"very heavy rain","Korean":"매우 강한 비"},
{"Parameter":504,"English":"extreme rain","Korean":"극심한 비"},
{"Parameter":511,"English":"freezing rain","Korean":"우박"},
{"Parameter":520,"English":"light intensity shower rain","Korean":"약한 소나기 비"},
{"Parameter":521,"English":"shower rain","Korean":"소나기 비"},
{"Parameter":522,"English":"heavy intensity shower rain","Korean":"강한 소나기 비"},
{"Parameter":531,"English":"ragged shower rain","Korean":"불규칙적 소나기 비"},
{"Parameter":600,"English":"light snow","Korean":"가벼운 눈"},
{"Parameter":601,"English":"snow","Korean":"눈"},
{"Parameter":602,"English":"heavy snow","Korean":"강한 눈"},
{"Parameter":611,"English":"sleet","Korean":"진눈깨비"},
{"Parameter":612,"English":"shower sleet","Korean":"소나기 진눈깨비"},
{"Parameter":615,"English":"light rain and snow","Korean":"약한 비와 눈"},
{"Parameter":616,"English":"rain and snow","Korean":"비와 눈"},
{"Parameter":620,"English":"light shower snow","Korean":"약한 소나기 눈"},
{"Parameter":621,"English":"shower snow","Korean":"소나기 눈"},
{"Parameter":622,"English":"heavy shower snow","Korean":"강한 소나기 눈"},
{"Parameter":701,"English":"mist","Korean":"박무"},
{"Parameter":711,"English":"smoke","Korean":"연기"},
{"Parameter":721,"English":"haze","Korean":"연무"},
{"Parameter":731,"English":"sand, dust whirls","Korean":"모래 먼지"},
{"Parameter":741,"English":"fog","Korean":"안개"},
{"Parameter":751,"English":"sand","Korean":"모래"},
{"Parameter":761,"English":"dust","Korean":"먼지"},
{"Parameter":762,"English":"volcanic ash","Korean":"화산재"},
{"Parameter":771,"English":"squalls","Korean":"돌풍"},
{"Parameter":781,"English":"tornado","Korean":"토네이도"},
{"Parameter":800,"English":"clear sky","Korean":"구름 한 점 없는 맑은 하늘"},
{"Parameter":801,"English":"few clouds","Korean":"약간의 구름이 낀 하늘"},
{"Parameter":802,"English":"scattered clouds","Korean":"드문드문 구름이 낀 하늘"},
{"Parameter":803,"English":"broken clouds","Korean":"구름이 거의 없는 하늘"},
{"Parameter":804,"English":"overcast clouds","Korean":"구름으로 뒤덮인 흐린 하늘"},
{"Parameter":900,"English":"tornado","Korean":"토네이도"},
{"Parameter":901,"English":"tropical storm","Korean":"태풍"},
{"Parameter":902,"English":"hurricane","Korean":"허리케인"},
{"Parameter":903,"English":"cold","Korean":"한랭"},
{"Parameter":904,"English":"hot","Korean":"고온"},
{"Parameter":905,"English":"windy","Korean":"바람부는"},
{"Parameter":906,"English":"hail","Korean":"우박"},
{"Parameter":951,"English":"calm","Korean":"바람이 거의 없는"},
{"Parameter":952,"English":"light breeze","Korean":"약한 바람"},
{"Parameter":953,"English":"gentle breeze","Korean":"부드러운 바람"},
{"Parameter":954,"English":"moderate breeze","Korean":"중간 세기 바람"},
{"Parameter":955,"English":"fresh breeze","Korean":"신선한 바람"},
{"Parameter":956,"English":"strong breeze","Korean":"센 바람"},
{"Parameter":957,"English":"high win","Korean":"돌풍에 가까운 센 바람"},
{"Parameter":958,"English":"gale","Korean":"돌풍"},
{"Parameter":959,"English":"severe gale","Korean":"심각한 돌풍"},
{"Parameter":960,"English":"storm","Korean":"폭풍"},
{"Parameter":961,"English":"violent storm","Korean":"강한 폭풍"},
{"Parameter":962,"English":"hurricane","Korean":"허리케인"}]
