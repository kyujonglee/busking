<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/header/header.css'/>" />
<link rel="stylesheet" href="<c:url value='/resources/css/main/main-map.css'/>" />
    <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>        
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Italianno&display=swap" rel="stylesheet">
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
					<section id="mu-map">
				        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d9207.358598888495!2d-85.64847801496286!3d30.183918972289003!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0000000000000000%3A0x2320479d70eb6202!2sDillard's!5e0!3m2!1sbn!2sbd!4v1462359735720" width="100%" height="100%" frameborder="0" allowfullscreen=""></iframe>
					</section> 
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
  
	  <script>
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
	  </script>