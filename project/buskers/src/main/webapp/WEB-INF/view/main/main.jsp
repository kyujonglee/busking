<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/header/header.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/main-map.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/main-feed.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/main/main.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/common/waitMe.css'/>" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.css" />
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Tangerine'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Prata'
	rel='stylesheet' type='text/css'>
<link
	href="https://fonts.googleapis.com/css?family=Italianno&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/dark.css">
<link
	href="https://fonts.googleapis.com/css?family=Lobster&display=swap"
	rel="stylesheet">
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="http://d3js.org/topojson.v1.min.js"></script>

<section id="mu-slider">
	<div class="mu-slider-area">
		<div class="mu-top-slider">

			<div class="mu-top-slider-single">
				<img src="<c:url value='/resources/img/busker2.jpg'/>" alt="img">
				<div class="mu-top-slider-content">
					<h2 class="mu-slider-title">오늘 하루, ${fn:length(artistShow)}건의
						버스킹 공연이 있습니다.</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Itaque voluptatem accusamus non quidem, deleniti optio.</p>
					<a href="#" class="mu-readmore-btn">더 알아보기</a>
				</div>
			</div>

			<div class="mu-top-slider-single">
				<img src="<c:url value='/resources/img/busker4.jpg'/>" alt="img">
				<div class="mu-top-slider-content">
					<h2 class="mu-slider-title">팔로우한 아티스트의 소식을 확인해보세요.</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Itaque voluptatem accusamus non quidem, deleniti optio.</p>
					<a href="#" class="mu-readmore-btn">더 알아보기</a>
				</div>
			</div>

			<div class="mu-top-slider-single">
				<img src="<c:url value='/resources/img/busker5.jpg'/>" alt="img">
				<div class="mu-top-slider-content">
					<h2 class="mu-slider-title">가장 인기있는 버스킹 공연 장소는?</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Itaque voluptatem accusamus non quidem, deleniti optio.</p>
					<a href="#" class="mu-readmore-btn">더 알아보기</a>
				</div>
			</div>

		</div>
	</div>
</section>

<div class="main_body_container">
	<div class="buskers_map">
		<div class="buskers_map_title">
			<div>Buskers</div>
			<div class="neon">
				<b>Per<span>for</span>man<span>ce st</span>age
				</b>
			</div>
		</div>

		<div class="buskers_map_detail">
			<!--     추가부분      -->
			<div class="mapwrapper">
				<div id="container"></div>
				<div id="chart"></div>
			</div>

			<div class="performance__info_wrapper">
				<div class="performance__info">
					<div class="performance__info_calendar">
						<div class="date_calendar_button">
							<i class="fas fa-caret-left"></i>
						</div>
						<p class="calendar">
							<em></em>
						</p>
					</div>
					<div class="date_calendar_button">
						<i class="fas fa-caret-right"></i>
					</div>
					<input class="date_picker" />

					<div class="performance_info_date_wrapper">
						<div class="date_up_button">
							<i class="fas fa-caret-up day-up"></i>
						</div>
						<div class="performance__info_date"></div>
						<div class="date_down_button">
							<i class="fas fa-caret-down day-down"></i>
						</div>

					</div>

				</div>
				<br>
				<div class="performance_info_list">
					<c:forEach var="list" items="${artistShow}">
						<section>
							<div class="img-btn">
								<img
									src="<c:url value='/file/download.do'/>?path=${list.profileImgPath}${list.profileImg}" />
								<div class="artist_name">${list.activityName}</div>
							</div>
							<div class="details-btn">
								<h1>${list.title}</h1>
								<h3>
									<i class="fas fa-map-marker-alt">&nbsp;${list.place}</i>
									&nbsp;&nbsp; <i class="fas fa-calendar-day">&nbsp;<fmt:formatDate
											value="${list.enrollDate}" pattern="yyyy.MM.dd HH:mm" /></i>
								</h3>
								<p>${list.content}</p>
							</div>
							<div class="SM-btn"></div>
							<div class="layer"></div>
						</section>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>

	<div class="buskers_feed_wrapper">
		<div class="buskers_feed_title">
			<div class="neon">
				<b>Fol<span>low</span>ers n<span>ews</span> feed
				</b>
			</div>
		</div>

		<div class="buskers_feed_list">
			<c:if test="${sessionScope.user ne null}">
				<div class="buskers_feed_show">
					<div class="buskers_feed_follow">
						공연일정 <span>팔로우 채널</span>
					</div>
					<div class="swiper-container swiper-container-show">
						<div class="swiper-wrapper">
							<c:forEach var="list" items="${followArtistShow}">
								<div class="feed-card swiper-slide">
									<div class="feed-card-header">
										<img
											src="<c:url value='/file/download.do'/>?path=${list.profileImgPath}${list.profileImg}"
											onError="this.src='<c:url value='/resources/img/profile.png' />';" />
									</div>
									<div class="feed-card-content">
										<div class="title">
											<div class="title_header">
												<c:if test="${fn:length(list.title) gt 19}">
													<a
														href="<c:url value='/artist/board/detail.do?showNo=${list.showNo}&buskerNo=${list.buskerNo}'/> ">${fn:substring(list.title, 0, 19)}..</a>
												</c:if>
												<c:if test="${fn:length(list.title) le 19}">
													<a
														href="<c:url value='/artist/board/detail.do?showNo=${list.showNo}&buskerNo=${list.buskerNo}'/> ">${list.title}</a>
												</c:if>
											</div>
											<a class="title_header_activity_name"
												href="<c:url value='/artist/main/main.do?buskerNo=${list.buskerNo}'/> ">${list.activityName}</a>
											<c:if test="${fn:length(list.place) gt 9}">
												<i class="fas fa-map-marker-alt">&nbsp;${fn:substring(list.place, 0, 9)}..</i> &nbsp;&nbsp;
						                	</c:if>
											<c:if test="${fn:length(list.place) le 9}">
												<i class="fas fa-map-marker-alt">&nbsp;${list.place}</i> &nbsp;&nbsp;
						                	</c:if>
											<i class="fas fa-calendar-day">&nbsp;<fmt:formatDate
													value="${list.enrollDate}" pattern="MM-dd HH:mm" /></i>
										</div>
										<div class="summary">
											<p>${list.content}</p>
										</div>
									</div>
									<div class="feed-card-footer">
										<div class="time">
											<a> <jsp:useBean id="currDate" class="java.util.Date" />

												<fmt:formatDate var="currDay" value="${currDate}"
													pattern="yyyy-MM-dd" /> <fmt:formatDate var="regDay"
													value="${list.regDate}" pattern="yyyy-MM-dd" /> <fmt:parseNumber
													var="currDateTime"
													value="${currDate.time / (1000*60*60*24)}"
													integerOnly="true"></fmt:parseNumber> <fmt:parseNumber
													var="regDateTime"
													value="${list.regDate.time / (1000*60*60*24)}"
													integerOnly="true"></fmt:parseNumber> <fmt:formatDate
													var="currTime" value="${currDate}" pattern="HHmm" /> <fmt:formatDate
													var="regTime" value="${list.regDate}" pattern="HHmm" /> <fmt:parseNumber
													value="${(currTime - regTime)}" integerOnly="true"
													var="result"></fmt:parseNumber> <fmt:parseNumber
													value="${(currTime - regTime) / 60}" integerOnly="true"
													var="hours"></fmt:parseNumber> <fmt:parseNumber
													value="${(currTime - regTime) % 60}" integerOnly="true"
													var="minutes"></fmt:parseNumber> <c:if
													test="${currDay eq regDay}">
													<c:choose>
														<c:when test="${result < 60}">
										                	${result}분 전
									                	</c:when>
														<c:when test="${result >= 60}">
										                	${hours}시간 ${minutes}분 전
									                	</c:when>
													</c:choose>
												</c:if> <c:if test="${currDate ne regDate}">
							                		${currDateTime - regDateTime}일 전
							                	</c:if>
											</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>

						<div class="swiper-pagination swiper-pagination-artist-show"></div>

					</div>
				</div>

				<div class="buskers_feed_video">
					<div class="buskers_feed_follow">
						아티스트 영상 <span>팔로우 채널</span>
					</div>
					<div class="swiper-container swiper-container-video">
						<div class="swiper-wrapper swiper-wrapper-video"></div>

						<div class="swiper-pagination"></div>

						<div class="swiper-button-next swiper-button-white"></div>
						<div class="swiper-button-prev swiper-button-white"></div>
					</div>
				</div>

				<div class="buskers_feed_photo">
					<div class="buskers_feed_follow">
						아티스트 사진 <span>팔로우 채널</span>
					</div>
					<div class="buskers_feed_photo_container">
						<div class="swiper-wrapper swiper-wrapper-photo"></div>

						<div class="swiper-pagination"></div>

					</div>
				</div>
			</c:if>
		</div>
	</div>
</div>

<!-- 스크롤 버튼 -->
<button type="button" class="view-main-top-btn">
	<i class="fas fa-angle-up fa-2x"></i>
</button>

<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="<c:url value='/resources/js/waitMe.js'/>"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.js"></script>
<script>


	let date = new Date();
	let year = date.getFullYear(); 
	let month = new String(date.getMonth()+1); 
	let day = new String(date.getDate()); 
	let week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
	let dayOfWeek = week[date.getDay()];
	let selDate = year + "-" + month + "-" + day;
	  
	$(".date_picker").flatpickr({
	    enableTime: false,
	    dateFormat: "Y-m-d",
	});
	
	$(".date_picker").change(function () {
		console.log($(".date_picker").val());
		let setYear = $(".date_picker").val().split("-")[0];
		let setMonth = $(".date_picker").val().split("-")[1];
		let setDate = $(".date_picker").val().split("-")[2];
		date.setFullYear(setYear, new String(parseInt(setMonth) - 1), setDate);
		
		let year = new String(date.getFullYear()); 
		let month = new String(date.getMonth() + 1); 
		let day = new String(date.getDate()); 
		let dayOfWeek = week[date.getDay()];
		selDate = year + "-" + month + "-" + day;
		if(month.length == 1) { 
			month = "0" + month; 
		} 
		if(day.length == 1) { 
			day = "0" + day; 
		} 
		$(".performance__info_date").hide().html(date.getFullYear() + '. ' + month + '. ' + day + " " + "<day>" + dayOfWeek + "</day>").fadeIn();
		$(".calendar").html(day + "<em>" + month + "月" + "</em>");
		if (dayOfWeek == 'SUN') {
			$("day").css({"color": "hotpink"});
			$("em").css({"background": "hotpink"});
		} else if (dayOfWeek == 'SAT') {
			$("day").css({"color": "deepskyblue"});
			$("em").css({"background": "skyblue"});
		}
		
		showDetail();
		
	});
	
	if(month.length == 1) { 
		month = "0" + month; 
	} 
	if(day.length == 1) { 
		day = "0" + day; 
	} 
		
	$(".performance__info_date").html(year + '. ' + month + '. ' + day + " " + "<day>" + dayOfWeek + "</day>");
	$(".calendar").html(day + "<em>" + month + "月" + "</em>");
	if (dayOfWeek == 'SUN') {
		$("day").css({"color": "hotpink"});
		$("em").css({"background": "hotpink"});
	} else if (dayOfWeek == 'SAT') {
		$("day").css({"color": "deepskyblue"});
		$("em").css({"background": "skyblue"});
	}
	  
	$('.day-up').click((e) => {
		let $target = $(e.target);
		date.setDate(date.getDate() + 1);
		let year = new String(date.getFullYear()); 
		let month = new String(date.getMonth() + 1); 
		let day = new String(date.getDate()); 
		let dayOfWeek = week[date.getDay()];
		selDate = year + "-" + month + "-" + day;
		if(month.length == 1) { 
			month = "0" + month; 
		} 
		if(day.length == 1) { 
			day = "0" + day; 
		} 
		$(".performance__info_date").hide().html(date.getFullYear() + '. ' + month + '. ' + day + " " + "<day>" + dayOfWeek + "</day>").fadeIn();
		$(".calendar").html(day + "<em>" + month + "月" + "</em>");
		if (dayOfWeek == 'SUN') {
			$("day").css({"color": "hotpink"});
			$("em").css({"background": "hotpink"});
		} else if (dayOfWeek == 'SAT') {
			$("day").css({"color": "deepskyblue"});
			$("em").css({"background": "skyblue"});
		}
		showDetail();
		/*
		let enrollDate = year + month + day;
		$.ajax({
			type: "POST",
			url: "map-ajax.do",
			data: {enrollDate : enrollDate},
			success: function (result) {
				mapView();
				$("#chart").waitMe({
					effect: "ios",
					text: "처리중입니다.",
					color: "pink"
				});
				setTimeout(function() {
					$("#chart").waitMe("hide");
				}, 4500);
			}
		});
		*/
	});
	
	function showDetail() {
		let enrollDate = new Date(selDate);
		$.ajax({
			type:"POST",
			data: {enrollDate: enrollDate},
			url:"show-ajax.do",
		
		}).done(function (result) {
			console.log(result);
			let html = "";
			for (let i = 0; i < result.length; i++) {
				let list = result[i];
				let genre = "";
				switch(list.genreNo) {
				case 1:
					genre = '<div class="third" style="background-color: #BAE1FF; "><img src="<c:url value='/resources/img/1.png'/>"></div>';
					break;
				case 2:
					genre = '<div class="third" style="background-color: #FFDFBA; "><img src="<c:url value='/resources/img/2.png'/>"></div>';
					break;
				case 3:
					genre = '<div class="third" style="background-color: #FFFFBA; "><img src="<c:url value='/resources/img/3.png'/>"></div>';
					break;
				case 4:
					genre = '<div class="third" style="background-color: #FFB3BA; "><img src="<c:url value='/resources/img/4.png'/>"></div>';
					break;
				case 5:
					genre = '<div class="third" style="background-color: #BAFFC9; "><img src="<c:url value='/resources/img/5.png'/>"></div>';
					break;
				}
				html += '<section>';
    			html += 	'<div class="img-btn">';
  				html += 		'<img src="<c:url value='/file/download.do'/>?path=' + list.profileImgPath + list.profileImg + '"/>';
  				html += 		'<div class="artist_name">' + list.activityName + '</div>';
   				html +=    '</div>';
				html +=     '<div class="details-btn">';
  				html +=    		'<h1>' + list.title + '</h1>';
   				html +=    	'<h3><i class="fas fa-map-marker-alt">&nbsp;' + list.place + '</i> &nbsp;&nbsp;<i class="fas fa-calendar-day">&nbsp;' + new Date(list.enrollDate).format('yyyy.MM.dd') + '</i></h3>';
   				html +=   		'<p>' + list.content +'</p>';
   				html +=     '</div>';
   				html +=     '<div class="SM-btn">';
  				html += genre;
  				html +=     '</div>';
  				html += 	'<div class="layer"></div>';
   				html += '</section>';
			}
			$(".performance_info_list").html(html);
		    	
		}).fail(function (xhr) { 
			console.dir(xhr);
		})
	}
	  
	$('.day-down').click((e) => {
		let $target = $(e.target);
		date.setDate(date.getDate() - 1);
		let year = date.getFullYear(); 
		let month = new String(date.getMonth() + 1); 
		let day = new String(date.getDate()); 
		let dayOfWeek = week[date.getDay()]; 
		selDate = year + "-" + month + "-" + day;
		if(month.length == 1) { 
			month = "0" + month; 
		} 
		if(day.length == 1) { 
			day = "0" + day; 
		} 
		$(".performance__info_date").hide().html(date.getFullYear() + '. ' + month + '. ' + day + " " + "<day>" + dayOfWeek + "</day>").fadeIn();
		$(".calendar").html(day + "<em>" + month + "월" + "</em>");
		if (dayOfWeek == '일') {
			$("day").css({"color": "hotpink"});
			$("em").css({"background": "hotpink"});
		} else if (dayOfWeek == '토') {
			$("day").css({"color": "deepskyblue"});
			$("em").css({"background": "skyblue"});
		}
		showDetail();
		/*
		let enrollDate = year + month + day;
		$.ajax({
			type: "POST",
			url: "map-ajax.do",
			data: {enrollDate : enrollDate},
			success: function (result) {
				mapView();
				$("#chart").waitMe({
					effect: "ios",
					text: "처리중입니다.",
					color: "pink"
				});
				setTimeout(function() {
					$("#chart").waitMe("hide");
				}, 4500);
			}
		});
		*/
	});
	  
	$(".performance__info").mouseenter(function () {
		$(".day-up").css({visibility: "visible"});
		$(".day-down").css({visibility: "visible"});
	});
	
	$(".performance__info").mouseleave(function () {
		$(".day-up").css({visibility: "hidden"});
		$(".day-down").css({visibility: "hidden"});
	});
	  
	/*
	$('.third').hover(function() {
		$(this).css({"width": "385px", "opacity": "0.3"});
	});
	$('.third').mouseleave(function() {
		$(this).css({"width": "50px", "opacity": "1"});
	});
	
	$(".header_background").css({"display": "none"});
	*/
	  	
	let topbol = true;
		$(document).on("click",".mu-readmore-btn",function(){
		let index = $(".main_body_container").offset().top-10;
		if(topbol){
			$('html,body').stop().animate({scrollTop:index},1000);
			topbol=false;	  			
		}else{
			$('html,body').stop().animate({scrollTop:index-60},1000);
		}
	});
	 	
	$( window ).scroll( function() {
		if ( $( this ).scrollTop() > $(".main_body_container").position().top-80) {
			$( '.buskers_map'  ).fadeIn();
		} 
	});
	$(".view-main-top-btn").click(function(){
		$('html,body').stop().animate({scrollTop:0},700);
	})
		
	function mapView() {
		d3.select("#chart").html("");
		/** 서울지도 */
		var width = '520', height ='590' ,centered;
	
	    var projection = d3.geo.mercator().center([126.9795, 37.5651]).scale(70000).translate([width/2, height/2]);
	
	    var path = d3.geo.path().projection(projection);
	
	    var svg = d3.select("#chart").append("svg").attr("width", width).attr("height", height);
	
	    var map = svg.append("g").attr("id", "map")
	        places = svg.append("g").attr("id", "places");
	    
	    d3.json("<c:url value='/resources/etc/seoul.json' />", function(error, data) {
	    	var features = topojson.feature(data, data.objects.seoul_municipalities_geo).features;
	      	map.selectAll('path')
	       		.data(features)
	        	.enter().append('path')
	          	.attr('class', function(d) { console.log(); return 'municipality c' + d.properties.code })
	         	.attr('d', path)
	          	.on("click", seoulclicked);
	
			map.selectAll('text')
	        	.data(features)
	        	.enter().append("text")
	         	.attr("transform", function(d) { return "translate(" + path.centroid(d) + ")"; })
	         	.attr("dy", ".35em")                              //dy 추가
	          	.attr("class", "municipality-label")      //클래스 추가
	          	.text(function(d) { return d.properties.name; })
	    });
	    
    	setTimeout(function() {
		    d3.csv("<c:url value='/resources/etc/places.csv' />", function(data) {
				places.selectAll("circle")
		        	.data(data)
		         	.enter().append("image")
		            .attr("class","marker").attr("width","25").attr("height","25")
		    		.attr("xlink:href","<c:url value='/resources/img/marker.png'/>")
		            .attr("x", function(d) { return projection([d.lon, d.lat])[0] - 17; })
		            .attr("y", function(d) { return projection([d.lon, d.lat])[1] - 17; })
		            .attr("r", 10)
		            .attr("id",function(d) {return d.id});
				
		        places.selectAll("text")
		            .data(data)
		            .enter().append("text")
		            .attr("x", function(d) { return projection([d.lon, d.lat])[0]; })
		            .attr("y", function(d) { return projection([d.lon, d.lat])[1] + 8; })
		            .text(function(d) { return d.name });
		        /** 마커에 마우스 오버시 아티스트 프로필 사진 출력 */
		        $(".marker").hover(function () {
		        	let showNo = $(this).attr("id");
		        	let profileImg = "";
		        	let profileImgPath = "";
		        	let x = $(this).attr("x");
		        	let y = $(this).attr("y");
		        	$.ajax({
		    			type:"POST",
		    			data: {showNo: showNo},
		    			url:"marker-hover-ajax.do",
		    			async: false
		    		}).done(function (result) {
		    			profileImg = result.profileImg;
	    				profileImgPath = result.profileImgPath;
		    		}).fail(function (xhr) { 
		    			console.dir(xhr);
		    		})
		        	$(this).css({"width": "30", "height": "30", "transition": "0.3s"});
		        	places.selectAll("circle")
		        	.data(data)
		         	.enter().append("image")
		            .attr("class","thumbnail").attr("width","40").attr("height","40")
		    		.attr("xlink:href","<c:url value='/file/download.do'/>?path=" + profileImgPath + profileImg)
		            .attr("x", function(d) { return parseFloat(x) - 5; })
		            .attr("y", function(d) { return parseFloat(y) - 50; })
		            .attr("r", 10);
		        	$(".thumbnail").css({"border-radius": "50%"});
		        	
			        $(this).mouseleave(function () {
			        	$(this).css({"width": "25", "height": "25"});
			        	$(".thumbnail").fadeOut("200");
			        });
		        });
		        
		        $(".marker").click(function () {
		    		let showNo = $(this).attr("id");
		    		$.ajax({
		    			type:"POST",
		    			data: {showNo: showNo},
		    			url:"marker-ajax.do",
		    		
		    		}).done(function (result) {
		    			console.log(result);
		    			let html = "";
	    				let list = result;
	    				let genre = "";
	    				switch(list.genreNo) {
	    				case 1:
							genre = '<div class="third" style="background-color: #BAE1FF; "><img src="<c:url value='/resources/img/1.png'/>"></div>';
							break;
	    				case 2:
	    					genre = '<div class="third" style="background-color: #FFDFBA; "><img src="<c:url value='/resources/img/2.png'/>"></div>';
	    					break;
	    				case 3:
	    					genre = '<div class="third" style="background-color: #FFFFBA; "><img src="<c:url value='/resources/img/3.png'/>"></div>';
	    					break;
	    				case 4:
	    					genre = '<div class="third" style="background-color: #FFB3BA; "><img src="<c:url value='/resources/img/4.png'/>"></div>';
	    					break;
	    				case 5:
	    					genre = '<div class="third" style="background-color: #BAFFC9; "><img src="<c:url value='/resources/img/5.png'/>"></div>';
	    					break;
	    				}
	    				html += '<section>';
	        			html += 	'<div class="img-btn">';
	      				html += 		'<img src="<c:url value='/file/download.do'/>?path=' + list.profileImgPath + list.profileImg + '"/>';
	      				html += 		'<div class="artist_name">' + list.activityName + '</div>';
	       				html +=    '</div>';
	    				html +=     '<div class="details-btn">';
	      				html +=    		'<h1>' + list.title + '</h1>';
	       				html +=    	'<h3><i class="fas fa-map-marker-alt">&nbsp;' + list.place + '</i> &nbsp;&nbsp;<i class="fas fa-calendar-day">&nbsp;' + new Date(list.enrollDate).format('yyyy.MM.dd') + '</i></h3>';
	       				html +=   		'<p>' + list.content +'</p>';
	       				html +=     '</div>';
	       				html +=     '<div class="SM-btn">';
	      				html += genre;
	      				html +=     '</div>';
	      				html += 	'<div class="layer"></div>';
	       				html += '</section>';
		    			$(".performance_info_list").html(html);
		    		    	
		    		}).fail(function (xhr) { 
		    			console.dir(xhr);
		    		})
		    	});
    		});
		}, 3000);
    	
    	function seoulclicked(d) {
    		var x, y, k;
    		let gu = d.properties.name;
    		console.log(gu);
    	
    		if (d && centered !== d) {
    		    var centroid = path.centroid(d);
    		    x = centroid[0];
    		    y = centroid[1];
    		    k = 4;
    		    centered = d;
    		} else {
    		    x = width / 2;
    		    y = height / 2;
    		    k = 1;
    		    centered = null;
    		}
    	
    		map.selectAll("path").classed("active", centered && function(d) { return d === centered; });
    	
    		map.transition()
    	    	.duration(750)
    	      	.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")scale(" + k + ")translate(" + -x + "," + -y + ")")
    	     	.style("stroke-width", 1.5 / k + "px");
    	
    	    places.transition()
    	        .duration(750)
    	      	.attr("transform", "translate(" + width / 2 + "," + height / 2 + ")scale(" + k + ")translate(" + -x + "," + -y + ")")
    	      	.style("stroke-width", 1.5 / k + "px");
    	
    	    /*
    	   $.ajax({
    			type: "POST",
    			url: "show-list-ajax.do",
    			data: {gu : gu, enrollDate : enrollDate},
    			success: function (result) {
	    			console.log(result);
    			}
    		});
    	    */
    	    
    	    /* 클릭시 지역값 넘겨줌 */
    	    console.log(selDate);
    		$.ajax({
    			type:"POST",
    			data: {gu : gu},
    			url:"show-ajax.do",
    		
    		}).done(function (result) {
    			console.log("=====");
    			console.log(result);
    			console.log("=====");
    			let html = "";
    			for (let i = 0; i < result.length; i++) {
    				let list = result[i];
    				let genre = "";
    				switch(list.genreNo) {
    				case 1:
						genre = '<div class="third" style="background-color: #BAE1FF; "><img src="<c:url value='/resources/img/1.png'/>"></div>';
						break;
    				case 2:
    					genre = '<div class="third" style="background-color: #FFDFBA; "><img src="<c:url value='/resources/img/2.png'/>"></div>';
    					break;
    				case 3:
    					genre = '<div class="third" style="background-color: #FFFFBA; "><img src="<c:url value='/resources/img/3.png'/>"></div>';
    					break;
    				case 4:
    					genre = '<div class="third" style="background-color: #FFB3BA; "><img src="<c:url value='/resources/img/4.png'/>"></div>';
    					break;
    				case 5:
    					genre = '<div class="third" style="background-color: #BAFFC9; "><img src="<c:url value='/resources/img/5.png'/>"></div>';
    					break;
    				}
    				html += '<section>';
        			html += 	'<div class="img-btn">';
      				html += 		'<img src="<c:url value='/file/download.do'/>?path=' + list.profileImgPath + list.profileImg + '"/>';
      				html += 		'<div class="artist_name">' + list.activityName + '</div>';
       				html +=    '</div>';
    				html +=     '<div class="details-btn">';
      				html +=    		'<h1>' + list.title + '</h1>';
       				html +=    	'<h3><i class="fas fa-map-marker-alt">&nbsp;' + list.place + '</i> &nbsp;&nbsp;<i class="fas fa-calendar-day">&nbsp;' + new Date(list.enrollDate).format('yyyy.MM.dd') + '</i></h3>';
       				html +=   		'<p>' + list.content +'</p>';
       				html +=     '</div>';
       				html +=     '<div class="SM-btn">';
      				html += genre;
      				html +=     '</div>';
      				html += 	'<div class="layer"></div>';
       				html += '</section>';
    			}
    			$(".performance_info_list").html(html);
    		    	
    		}).fail(function (xhr) { 
    			console.dir(xhr);
    		})
    	}
	}	  	
	mapView();
    
	/* 전국지도 */
	var width = 530,
	    height = 590,
	    initialScale = 5500,
	    initialX = -12000,
	    initialY = 4050,
	    centered,
	    labels;
	
	var countryprojection = d3.geo.mercator()
	    .scale(initialScale)
	    .translate([initialX, initialY]);
	
	var qpath = d3.geo.path()
	    .projection(countryprojection);
	
	var zoom = d3.behavior.zoom()
	    .translate(countryprojection.translate())
	    .scale(countryprojection.scale())
	    .scaleExtent([height, 800 * height])
	    .on("zoom", zoom);
	
	var svg = d3.select("#container").append("svg")
	    .attr("width", width)
	    .attr("height", height)
	    .attr('id', 'map');
	
	var states = svg.append("g")
	    .attr("id", "states")
	    .call(zoom);
	
	states.append("rect")
	    .attr("class", "background")
	
	d3.json("<c:url value='/resources/etc/korea.json' />", function(json) {
		states.selectAll("path")
	    .data(json.features)
	    .enter().append("path")
	   	.attr("d", qpath)
	    .attr("id", function(d) { return 'path-'+d.id; })
	    .on("click", click);
	      
	labels = states.selectAll("text")
	    .data(json.features)
	    .enter().append("text")
      	.attr("transform", labelsTransform)
      	.attr("id", function(d) { return 'label-'+d.id; })
      	.attr('text-anchor', 'middle')
      	.attr("dy", ".35em")
      	.on("click", click)
      	.text(function(d) { return d.properties.Name; });
	
      	$("#path-15").addClass("active");
	});



	states.selectAll("path")
    	.classed("active", centered && function(d) { return d === centered; });
	
	function click(d) {
  		var x, y, k;
	
  		let localName = d.properties.id;
	
	if (d && centered !== d) {
	    var centroid = qpath.centroid(d);
	    x = centroid[0];
	    y = centroid[1];
	    k = 4;
	    centered = d;
  	} else {
	    x = width / 2;
	    y = height / 2;
	    k = 1;
	    centered = null;
  	}
  		states.selectAll("path")
      		.classed("active", centered && function(d) { return d === centered; });
	}
	
	function labelsTransform(d) {
  		if (d.id == 8) {
	    var arr = qpath.centroid(d);
	    arr[1] += (d3.event && d3.event.scale) ? (d3.event.scale / height + 20) : (initialScale / height + 20);
	    return "translate(" + arr + ")";
  		} else {
	    	return "translate(" + qpath.centroid(d) + ")";
		}
	}
	
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
    
	new Swiper('.swiper-container-show', {
	    slidesPerView: 5,
	    spaceBetween: 30,
	    slidesPerGroup: 5,
	    loop: true,
      	loopFillGroupWithBlank: true,
    	pagination: {
  	      el: '.swiper-pagination',
  	      clickable: true,
  	    },
  	  	autoplay: {
	        delay: 10000,
	        disableOnInteraction: false,
    	}
    });
	
	$.ajax({
		type: "POST",
		url: "/buskers/main/feed-photo-ajax.do",
		success: function (result) {
			console.log(result);
			let html = "";
			for (let i = 0; i < result.length; i++) {
				
				html += '<div class="photo_card_wrapper swiper-slide">';
				html += 	'<div class="photo_card">';
				html +=			'<div class="photo_card_image">';
				html +=				'<img src="<c:url value='/file/download.do'/>?path=' + result[i].path + result[i].sysname + '"/>';
				html +=			'</div>';
				html +=			'<div class="photo_card_body">';
				html +=				'<div class="photo_card_body_header">';
				html +=					'<p class="photo_card_title">' + result[i].title + '</p>';
				html +=				'</div>';
				html +=				'<div class="photo_card_body_footer">';
				html +=					'<a href="/buskers/artist/main/main.do?buskerNo=' + result[i].buskerNo + '" class="photo_card_activity_name">By&nbsp' + result[i].activityName + '</a>';
				html +=					'<p class="photo_card_reg_date">' + new Date(result[i].regDate).format('yyyy.MM.dd') + '</p>';
				html +=				'</div>';
				html +=			'</div>';
				html +=		'</div>';
				html +=	'</div>';
			}
			
			$(".swiper-wrapper-photo").html(html);
			
			new Swiper('.buskers_feed_photo_container', {
			    slidesPerView: 4,
			    spaceBetween: 70,
			    loop: true,
			    centeredSlides: true,
			    pagination: {
			      el: '.swiper-pagination',
			      clickable: true,
			    },
			    autoplay: {
			        delay: 2500,
			        disableOnInteraction: false,
		    	}
		    });
		}
	});
	
	$.ajax({
		type: "POST",
		url: "/buskers/main/feed-video-ajax.do",
		success: function (result) {
			console.log(result);
			let html = "";
			for (let i = 0; i < result.length; i++) {
				
				html += '<div class="swiper-slide feed_video">';
			    html +=		'<iframe src="' + result[i].url + '" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>';
		    	html += '</div>';
			}
			
			$(".swiper-wrapper-video").html(html);
			
			new Swiper('.swiper-container-video', {
				loop: true,
				pagination: {
		 			el: '.swiper-pagination',
			  		clickable: true,
				},
				navigation: {
			  		nextEl: '.swiper-button-next',
			  		prevEl: '.swiper-button-prev',
				}
		    });
		}
	});
	
	$(".municipality-label").click(function () {
		alert("afdsfas");
	});
		
</script>
