const API_KEY = "d3bf0d7d2d5b1152cc9ad6fde52607b6";
let lat, lon;

$("#weather").click(() => {
  getWeather();
});

function getWeather() {
  fetch(
    `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
  )
    .then(response => response.json())
    .then(json => {
      console.log(json);
      $(".weather-date").append(`
         도시 : ${json.city.name}
         날짜 : ${json.list[10].dt_txt}
         날씨 : ${json.list[10].weather[0].main}
         아이콘 : 
         <img src="http://openweathermap.org/img/w/${
           json.list[10].weather[0].icon
         }.png" />
    `);
    });
}

function coords() {
  navigator.geolocation.getCurrentPosition(
    position => {
      lat = position.coords.latitude;
      lon = position.coords.longitude;
    },
    () => {
      lat = 37.5642135;
      lon = 127.0016985;
    }
  );
}

function init() {
  coords();
  // 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
  const infowindow = new daum.maps.InfoWindow({ zIndex: 1 });

  const mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      center: new daum.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
    };
  // 지도를 생성합니다
  const map = new daum.maps.Map(mapContainer, mapOption);

  // 장소 검색 객체를 생성합니다
  // let ps = new daum.maps.services.Places();
  // 지도를 클릭한 위치에 표출할 마커입니다
  const marker = new daum.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다
    position: map.getCenter()
  });
  // // 지도에 마커를 표시합니다
  // marker.setMap(map);

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  daum.maps.event.addListener(map, "click", function(mouseEvent) {
    // 클릭한 위도, 경도 정보를 가져옵니다
    const latlng = mouseEvent.latLng;

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    let message = "클릭한 위치의 위도는 " + latlng.getLat() + " 이고, ";
    message += "경도는 " + latlng.getLng() + " 입니다";
    lat = latlng.getLat();
    lon = latlng.getLng();
    const resultDiv = document.getElementById("clickLatlng");
    resultDiv.innerHTML = message;
  });

  // 키워드로 장소를 검색합니다
  // ps.keywordSearch("이태원 맛집", placesSearchCB);

  // 키워드 검색 완료 시 호출되는 콜백함수 입니다
  function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {
      // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
      // LatLngBounds 객체에 좌표를 추가합니다
      let bounds = new daum.maps.LatLngBounds();

      for (let i = 0; i < data.length; i++) {
        displayMarker(data[i]);
        bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
      }

      // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
      map.setBounds(bounds);
    }
  }

  // 지도에 마커를 표시하는 함수입니다
  function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    const marker = new daum.maps.Marker({
      map: map,
      position: new daum.maps.LatLng(place.y, place.x)
    });

    // 마커에 클릭이벤트를 등록합니다
    daum.maps.event.addListener(marker, "click", function() {
      // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
      infowindow.setContent(
        '<div style="padding:5px;font-size:12px;">' +
          place.place_name +
          "</div>"
      );
      infowindow.open(map, marker);
    });
  }
}
init();

/*
전체적인 로직에 따라서 하나씩 완성할 것!


지도에서 검색을 만듬.
버스커가 공연 날짜를 선택할 수 있게 함.( 간단한 달력  codepen을 통해서 가져올 것! )
(ex. input type="data" )
버스커가 공연 장소를 선택하기 위해 지도에서 검색을 함.
1. 다음지도에 검색을 만듬.
2. 검색을 하면 그 장소에 대한 lat, lon을 뽑아옴.
3. lat, lon 에 관한 날씨 정보를 가져옴.
4. 버스커의 공연 날짜가 5일 이내라면 날씨를 보여주고,
그렇지 않다면 날씨를 알 수 없음으로 표시해줌.
(현재날짜와 버스커가 선택한 공연날짜의 계산을 통해서
    관련 날짜의 날씨를 보여줘야함...!! 날짜를 통한 계산이 필요하다!
)


*/
