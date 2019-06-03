//import { openweathermapKorean } from "./forecast.js";
const API_KEY = "d3bf0d7d2d5b1152cc9ad6fde52607b6";
$(document).ready(() => {
  $(".busker-side__info-btn i").trigger("click");
});

//async function weatherApi(lat, lon, API_KEY){
//	const result = await fetch(
//		    `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
//	);
//	return result;
//}

  $.ajax({
	  type : "POST",
	  url : "/buskers/artist/board/list-ajax.do",
	  dateType : "json",
	  async: true
  })
  .done((list)=>{
	  console.log(list);
	  for(let show of list){
		  
		  const lat = show.lat;
		  const lon = show.lon;
		  const selDate = new Date(show.enrollDate);
		  let end = "";
		  if(selDate < new Date()){
	    	  end = `<div class="busker-show-list__item-end"> 버스킹 종료 </div>`;
	      }
		  if(show.genre === null) {
			  show.genre.name = "";
		  }
		  $(".busker-show-list__main").append(`
    			  <div class="busker-show-list__item" id="busker-show${show.showNo}">
    				<div class="busker-show-list__item-title">
					  <a href="detail.do?showNo=${show.showNo}" class="busker-show-list__detail-link">
	    					<span>${show.title}</span>
						  ${end}
					  </a>
					  <a href="updateForm.do?showNo=${show.showNo}">
				  		<i class="fas fa-pen"></i>
				  	  </a>
    				</div>
    				<div class="busker-show-list__item-content">
    					<div class="busker-show-list__item-row">
    						<i class="far fa-clock fa-lg"></i>
    						<div class="busker-show-list__item-row-content">
    							${new Date(show.enrollDate).format('yy.MM.dd a/p hh시mm분 E')}
    						</div>
    					</div>
    					<div class="busker-show-list__item-row">
    						<i class="fas fa-map-marker-alt fa-lg"></i>
    						<div class="busker-show-list__item-row-content">${show.place}</div>
				  			<div class="busker-show-list__item-row-content">
				  				<span class="busker-show-list__item-row-content-sub"> 장르 : </span> &nbsp;${show.genre.name}
				  			</div>
    					</div>
    					<div class="busker-show-list__item-row">
    						<span> <i class="fas fa-temperature-high fa-lg"></i>
    						</span> 
    					</div>
    					<div class="busker-show-list__item-row">
    						<i class="far fa-sticky-note fa-lg"></i>
    						<div class="busker-show-list__item-row-content">${show.content}</div>
    					</div>
    				</div>
    			</div>
    		   `);
		  
		  fetch(
		    `https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`
		  )
		    .then(response => response.json())
		    .then(json => {
		      let weatherFlag = true;
		      let preDate = new Date(json.list[0].dt_txt);
		      let weatherIcon,weather,temp;
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
		          weatherIcon = `<img src="http://openweathermap.org/img/w/${ele.weather[0].icon}.png" />`;
		          weather = weatherKorean;
		          temp = `${ele.main.temp}`;
		          
		          weatherFlag = false;
		          break;
		        }
		        preDate = proDate;
		      }
		      if (weatherFlag) {
		    	if(selDate < new Date()){
		    		weatherIcon = show.weatherIcon;
		    		weather = show.weather;
		    		temp = show.temperature;
		    	}else {
		    		weather = "날씨정보를 가져올 수 없습니다.";
		    	}
		      }
		      if(weather !== "날씨정보를 가져올 수 없습니다."){
		    	  $(`#busker-show${show.showNo} .busker-show-list__item-row:nth-child(3)`).append(`<span> ${temp}°C </span> <span> ${weatherIcon} </span> 
		    	  <span> ${weather} </span>`);
		      }else {
		    	  $(`#busker-show${show.showNo} .busker-show-list__item-row:nth-child(3)`)
		    	  .append(`<span> ${weather} </span>`);
		      }
		  });
	}
  })
  .fail();
  
  Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    const weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    let d = this;
	    let h;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	 
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
  
  