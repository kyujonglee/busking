import { openweathermapKorean } from "./forecast.js";

const API_KEY = "d3bf0d7d2d5b1152cc9ad6fde52607b6";

function getWeather(lat, lon, date) {
  const selDate = new Date(date);
  fetch(
    `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
  )
    .then(response => response.json())
    .then(json => {
      let weatherFlag = true;
      let preDate = new Date(json.list[0].dt_txt);
      for (let i = 1; i < json.list.length; i++) {
        const ele = json.list[i];
        const proDate = new Date(ele.dt_txt);
        if (preDate <= selDate && selDate <= proDate) {
          let weatherKorean = "❌";
          for (let i = 0; i < openweathermapKorean.length; i++) {
            if(ele.weather[0].id === openweathermapKorean[i].Parameter){
              weatherKorean = openweathermapKorean[i].Korean;
              break;
            }
          }
          // 보여줄 것 : 기온, 날짜, 날씨, 날씨 아이콘
          // 날씨 : ${ele.weather[0].main}
          $("#lat").val(lat);
          $("#lon").val(lon);
          $(".busker-show-enroll__form-column:nth-child(2) .enroll-form-column__content").html(`
              <span class="enroll-form-column__content-weather-icon"> 
              <img src="http://openweathermap.org/img/w/${
                ele.weather[0].icon
              }.png" /> </span>
              <span class="enroll-form-column__content-weather"> ${weatherKorean} </span>
              <span class="enroll-form-column__content-temperature-icon"><i class="fas fa-temperature-high fa-lg"></i></span>
              <span class="enroll-form-column__content-temperature"> ${ele.main.temp} °C </span>
              `);
              // 기온 : ${ele.main.temp}
              //  날짜 : ${date}
              //  날씨 : ${weatherKorean}
              //  아이콘 : 
              //  <img src="http://openweathermap.org/img/w/${
              //    ele.weather[0].icon
              //  }.png" />
          weatherFlag = false;
          break;
        }
        preDate = proDate;
      }
      if (weatherFlag) {
        $(".busker-show-enroll__form-column:nth-child(2) .enroll-form-column__content").html("날씨정보를 가져올 수 없습니다.");
      }
    });
}

export let items = {};

function mapInit(lat, lon) {
  const infowindow = new daum.maps.InfoWindow({ zIndex: 1 });
  items["infowindow"] = infowindow;
  const mapContainer = document.getElementById("map"), // 지도를 표시할 div
    mapOption = {
      // center: new daum.maps.LatLng(37.5642135, 127.0016985), // 지도의 중심좌표
      center: new daum.maps.LatLng(lat, lon), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
    };
  // 지도를 생성합니다
  const map = new daum.maps.Map(mapContainer, mapOption);
  items["map"] = map;
  // 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
  map.addControl(
    new daum.maps.MapTypeControl(),
    daum.maps.ControlPosition.TOPRIGHT
  );

  // 지도의 우측에 확대 축소 컨트롤을 추가한다
  map.addControl(new daum.maps.ZoomControl(), daum.maps.ControlPosition.RIGHT);

  let geocoder = new daum.maps.services.Geocoder(map);
  items["geocoder"] = geocoder;
  // 장소 검색 객체를 생성합니다
  const ps = new daum.maps.services.Places(map);
  items["ps"] = ps;
  // 지도를 클릭한 위치에 표출할 마커입니다
  const marker = new daum.maps.Marker({
    // 지도 중심좌표에 마커를 생성합니다
    position: map.getCenter(),
    draggable: true
  });
  // // 지도에 마커를 표시합니다
  marker.setMap(map);

  daum.maps.event.addListener(marker, "dragend", function() {
    const lat = marker.getPosition().getLat();
    const lon = marker.getPosition().getLng();
    map.setCenter(new daum.maps.LatLng(lat, lon));
    console.log(lat, lon);
    getWeather(lat,lon,$(".busker-enroll__date").val());
    searchDetailAddrFromCoords(marker.getPosition(), function(result, status) {
      if (status === daum.maps.services.Status.OK) {
        let detailAddr = !!result[0].road_address
          ? "<div>도로명주소 : " +
            result[0].road_address.address_name +
            "</div>"
          : "";
        detailAddr +=
          "<div>지번 주소 : " + result[0].address.address_name + "</div>";
        items["address"] = result[0].address.address_name;
        let content =
          '<div class="daumMap__bAddr">' +
          '<span class="daumMap__title">법정동 주소정보</span>' +
          detailAddr +
          "</div>";
        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
        infowindow.setContent(content);
        infowindow.open(map, marker);
      }
    });
  });

  // 지도에 클릭 이벤트를 등록합니다
  // 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
  daum.maps.event.addListener(map, "click", function(mouseEvent) {
    // 클릭한 위도, 경도 정보를 가져옵니다
    const latlng = mouseEvent.latLng;

    // 마커 위치를 클릭한 위치로 옮깁니다
    marker.setPosition(latlng);

    let message = "클릭한 위치의 위도는 " + latlng.getLat() + " 이고, ";
    message += "경도는 " + latlng.getLng() + " 입니다";
    const lat = latlng.getLat();
    const lon = latlng.getLng();
    map.setCenter(new daum.maps.LatLng(lat, lon));
    const value = $(".busker-enroll__date").val();
    if (value === "") {
      $(".busker-show-enroll__form-column:nth-child(2) .enroll-form-column__content").html("날짜를 입력해주세요.");
    } else {
      getWeather(lat, lon, value);
    }

    // const resultDiv = document.getElementById("clickLatlng");
    // resultDiv.innerHTML = message;
    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
      if (status === daum.maps.services.Status.OK) {
        let detailAddr = !!result[0].road_address
          ? "<div>도로명주소 : " +
            result[0].road_address.address_name +
            "</div>"
          : "";
        detailAddr +=
          "<div>지번 주소 : " + result[0].address.address_name + "</div>";

        let content =
          '<div class="daumMap__bAddr">' +
          '<span class="daumMap__title">법정동 주소정보</span>' +
          detailAddr +
          "</div>";

        // 마커를 클릭한 위치에 표시합니다
        marker.setPosition(mouseEvent.latLng);
        marker.setMap(map);

        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
        infowindow.setContent(content);
        infowindow.open(map, marker);
      }
    });
  });
}
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
    items["map"].setBounds(bounds);
  }
}

function searchAddrFromCoords(coords, callback) {
  // 좌표로 행정동 주소 정보를 요청합니다
  items["geocoder"].coord2RegionCode(
    coords.getLng(),
    coords.getLat(),
    callback
  );
}

function searchDetailAddrFromCoords(coords, callback) {
  // 좌표로 법정동 상세 주소 정보를 요청합니다
  items["geocoder"].coord2Address(coords.getLng(), coords.getLat(), callback);
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
  const map = items["map"];
  const infowindow = items["infowindow"];
  // 마커를 생성하고 지도에 표시합니다
  const marker = new daum.maps.Marker({
    map: map,
    position: new daum.maps.LatLng(place.y, place.x)
  });

  // 마커에 클릭이벤트를 등록합니다
  daum.maps.event.addListener(marker, "click", function() {
    // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
    infowindow.setContent(
      '<div class="daumMap__marker-content" style="padding:5px;font-size:12px;">' +
        place.place_name +
        "</div>"
    );
    infowindow.open(map, marker);
    const lat = marker.getPosition().getLat();
    const lon = marker.getPosition().getLng();
    map.setCenter(new daum.maps.LatLng(lat, lon));
    const val = $(".busker-enroll__date").val();
    if (val === "") {
      $(".busker-show-enroll__form-column:nth-child(2) .enroll-form-column__content").html("날짜를 입력해주세요.");
    } else {
      getWeather(lat, lon, val);
    }
  });
}

$(".weather-search").on("submit", event => {
  event.preventDefault();
  let ps = items["ps"];
  // showMarker($(".weather-search__input").val());
  const val = $(".weather-search__input").val();
  ps.keywordSearch(val, placesSearchCB);
  // ps.categorySearch(val, placesSearchCB, {
  //   useMapBounds: true
  // });
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

/*
전체적인 로직에 따라서 하나씩 완성할 것!


지도에서 검색을 만듬. (ok)
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

$(".busker-enroll__date").flatpickr({
  enableTime: true,
  onChange: function(selectedDates, dateStr, instance) {
    const todayDate = new Date();
    if (selectedDates[0] < todayDate) {
      alert("현재 날짜 이후로 선택이 가능합니다.");
      return false;
    }
  }
});
