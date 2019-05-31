<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/header/header.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/main-map.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/main.css'/>" />
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic|Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>        
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
<link href="https://fonts.googleapis.com/css?family=Italianno&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="http://d3js.org/d3.v3.min.js"></script>
<script src="http://d3js.org/topojson.v1.min.js"></script>
    <title>Buskers</title>
		<section id="mu-slider">
			<div class="mu-slider-area">
				<div class="mu-top-slider">
		
					<div class="mu-top-slider-single">
						<img src="<c:url value='/resources/img/busker2.jpg'/>" alt="img">
						<div class="mu-top-slider-content">
							<h2 class="mu-slider-title">오늘 하루, 200건의 버스킹 공연이 있습니다.</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Itaque voluptatem accusamus non quidem, deleniti optio.</p>
							<a href="#" class="mu-readmore-btn">더 알아보기</a>
						</div>
					</div>
		
					<div class="mu-top-slider-single">
						<img src="<c:url value='/resources/img/busker4.jpg'/>" alt="img">
						<div class="mu-top-slider-content">
							<h2 class="mu-slider-title">오늘 하루, 200건의 버스킹 공연이 있습니다.</h2>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Itaque voluptatem accusamus non quidem, deleniti optio.</p>
							<a href="#" class="mu-readmore-btn">더 알아보기</a>
						</div>
					</div>
		
					<div class="mu-top-slider-single">
						<img src="<c:url value='/resources/img/busker5.jpg'/>" alt="img">
						<div class="mu-top-slider-content">
							<h2 class="mu-slider-title">오늘 하루, 200건의 버스킹 공연이 있습니다.</h2>
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
					<div>Performance Stage</div>
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
								<p class="calendar">30<em>5월</em></p></div>
								<div class="date_calendar_button">
									<i class="fas fa-caret-right"></i>
								</div>
							
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
			        </div>
				</div>
			</div>
		</div>

 		
 		<!-- 스크롤 버튼 -->
 		<button type="button" class="view-main-top-btn">
	    	<i class="fas fa-angle-up fa-2x"></i>
	    </button>
	    
	    
		<!-- Start Footer -->
		<footer id="mu-footer">
		  <div class="container">
		    <div class="row">
		      <div class="col-md-12">
		      <div class="mu-footer-area">
		         <div class="mu-footer-social">
		          <a href="#"><span class="fa fa-facebook"></span></a>
		          <a href="#"><span class="fa fa-twitter"></span></a>
		          <a href="#"><span class="fa fa-google-plus"></span></a>
		          <a href="#"><span class="fa fa-linkedin"></span></a>
		          <a href="#"><span class="fa fa-youtube"></span></a>
		        </div>
		        <div class="mu-footer-copyright">
		          <p>Bukers</p><a>Copyright 2019. koo. hoo. kyu. hyun.</a>
		        </div>         
		      </div>
		    </div>
		    </div>
		  </div>
		</footer>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <script>
	  let date = new Date();
	  let year = date.getFullYear(); 
	  let month = new String(date.getMonth()+1); 
	  let day = new String(date.getDate()); 
	  
		if(month.length == 1) { 
			month = "0" + month; 
		} 
		if(day.length == 1) { 
			day = "0" + day; 
		} 
		
		$(".performance__info_date").text(year + ". " + month + ". " + day);
	  
	  $('.day-up').click((e)=> {
		  let $target = $(e.target);
		  date.setDate(date.getDate() + 1);
		  let year = date.getFullYear(); 
		  let month = new String(date.getMonth() + 1); 
		  let day = new String(date.getDate()); 
		  if(month.length == 1) { 
			month = "0" + month; 
		  } 
		  if(day.length == 1) { 
				day = "0" + day; 
			} 
		  $(".performance__info_date").text(date.getFullYear() + '. ' + month + '. ' + day);
		  $(".calendar").html(day + "<em>" + month + "월" + "</em>");
	  });
	  
	  $('.day-down').click((e)=> {
		  let $target = $(e.target);
		  date.setDate(date.getDate() - 1);
		  let year = date.getFullYear(); 
		  let month = new String(date.getMonth() + 1); 
		  let day = new String(date.getDate()); 
		  if(month.length == 1) { 
			month = "0" + month; 
		  } 
		  if(day.length == 1) { 
				day = "0" + day; 
			} 
		  $(".performance__info_date").text(date.getFullYear() + '. ' + month + '. ' + day);
		  $(".calendar").html(day + "<em>" + month + "월" + "</em>");
	  });
	  
	  $(".performance_info_date_wrapper").mouseenter(function () {
		 $(".day-up").css({visibility: "visible"});
		 $(".day-down").css({visibility: "visible"});
	  });
	  
	  $(".performance_info_date_wrapper").mouseleave(function () {
		  $(".day-up").css({visibility: "hidden"});
		  $(".day-down").css({visibility: "hidden"});
	  });
	  
	  
	  	$(".header_background").css({"display": "none"});
	  	
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
	  	} );
	  	$(".view-main-top-btn").click(function(){
	  	  $('html,body').stop().animate({scrollTop:0},700);
	  	})

	  	
	  	
	  	
	  	
	  	// 전국지도
	  	  var width = '550',
        height ='590'
        ,centered;

    var projection = d3.geo.mercator()
            .center([126.9795, 37.5651])
            .scale(70000)
            .translate([width/2, height/2]);

    var path = d3.geo.path().projection(projection);

    var svg = d3.select("#chart").append("svg")
                        .attr("width", width)
                        .attr("height", height);

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

    d3.csv("<c:url value='/resources/etc/places.csv' />", function(data) {
        places.selectAll("circle")
            .data(data)
          .enter().append("circle")
            .attr("cx", function(d) { return projection([d.lon, d.lat])[0]; })
            .attr("cy", function(d) { return projection([d.lon, d.lat])[1]; })
            .attr("r", 10)
            .attr("id", function(d) { return (d.id) });

        places.selectAll("text")
            .data(data)
          .enter().append("text")
            .attr("x", function(d) { return projection([d.lon, d.lat])[0]; })
            .attr("y", function(d) { return projection([d.lon, d.lat])[1] + 8; })
            .text(function(d) { return d.name });
    });
/////////////////////////////////줌
function seoulclicked(d) {
  var x, y, k;
// console.dir(path.centroid(d));
// console.dir(d.name);

let gu = d.properties.name;


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

  map.selectAll("path")
      .classed("active", centered && function(d) { return d === centered; });

  map.transition()
      .duration(750)
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")scale(" + k + ")translate(" + -x + "," + -y + ")")
      .style("stroke-width", 1.5 / k + "px");

  places.transition()
      .duration(750)
      .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")scale(" + k + ")translate(" + -x + "," + -y + ")")
      .style("stroke-width", 1.5 / k + "px");

  /* 클릭시 지역값 넘겨줌 */
  $.ajax({
  		type:"POST",
		data: "gu="+gu,
		url:"mainmap-ajax.do",

    }).done(function(result){
    	console.log(result);
    	$(".perfomance__info_wrapper").html("");
    	for(let i = 0; i < result.length; i++){
    	$(".perfomance__info_wrapper").append(`
    	        <div class="perfomance_info">`+""+result[i].title+""+`</div>
    			`);
    	}
    	
    	
	  }).fail(function(xhr){
			alert("서버 처리중 에러발생")
			console.dir(xhr);
	  })

}

/* 전국지도 */
var width = 550,
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
    .attr("width", width)
    .attr("height", height);

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

	  </script>
	  