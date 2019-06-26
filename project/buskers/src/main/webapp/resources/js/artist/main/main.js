  // 메인 공연일정 스크립트
  $(".busker-content__show-row .busker-content__show-column:last-child i").click(function(){
  	$(this).parent().parent().next().slideToggle(100);
  	$(this).toggleClass("fas fa-angle-down").toggleClass("fas fa-angle-up");
  });
  
  $(document).ready(()=>{
		infoFlag = true;
		$(".busker-side__info-btn i").attr({class:"fas fa-angle-left fa-2x"});
		$(".busker-info").css({display:"block"});
	  
	  // 메인 영상 스크립트
	  $.ajax({
		  url : videoItemUrl,
		  data : "buskerNo="+paramBuskerNo
	  }).done((video)=>{
		  if(video.length === 0){
			  $(".busker-content__item:first-child").html(`
				  <div class="busker-content__empty">버스커가 올린 영상이 존재하지 않습니다.</div>  
		      `); 
		  }else {
			  $(".busker-content__item:first-child").html(`
				  <iframe
				      width="100%"
				      height="100%"
				      src="${video.url}"
				      frameborder="0"
				      allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
				      allowfullscreen
				    ></iframe>	  
			  `);
		  }
	  });
  });