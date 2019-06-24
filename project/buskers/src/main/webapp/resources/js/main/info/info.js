// 곡 추가에 대한 function 
function add(obj) {
    const fileNo = obj.parentNode.parentNode.getAttribute("value");
    $.ajax({
      url: musicItemUrl,
      type: "post",
      data: "fileNo=" + fileNo
    }).done(musicFile => {
      audioItemList.push(musicFile);
      const index = audioItemList.length - 1;
      $(".audio-menu ul").prepend(
        `
    	<li class="audio-menu__content-column" data-index="` +
          index +
          `">
        <div class="audio-menu__content-colum-sbox">
          <div class="audio-menu__sbox">삭제</div>
        </div>
        <div class="audio-menu__music">
          <span class="audio-menu__title">` +
          musicFile.title +
          `</span>
          <span class="audio-menu__writer">` +
          musicFile.writer +
          `</span>
        </div>
        <div class="audio-menu__submenu">
          <span class="audio-menu__duration">` +
          musicFile.time +
          `</span>
          <i class="fas fa-ellipsis-v"></i>
        </div>
      </li>
  	`
      );
      list = document.querySelectorAll(".audio-menu > ul > li");
      $(".audio-menu > ul > li:first-child .audio-menu__music").click(function(
        e
      ) {
        const index = $(this)
          .parent()
          .data("index");
        const audioItem = audioItemList[index];
        list.forEach(ele => {
          ele.classList.remove("audio-menu__selected");
        });
        $(this)
          .parent()
          .addClass("audio-menu__selected");
        audio.src = audioItem.path;
        $(".music .music-title").text(audioItem.title);
        $(".music .music-writer").text(audioItem.writer);
        $(".music-box .music-box__img").attr({src:"/buskers/file/download.do?path="+audioItem.imgPath});
        $("#play").trigger("click");
      });
      $(".audio-menu__header .audio-menu__header-cnt").text(list.length + "곡");

      $(".audio-menu__content-column:first-child .audio-menu__submenu i").click(
        function() {
          $(this)
            .parent()
            .parent()
            .children(".audio-menu__content-colum-sbox")
            .fadeToggle("ease-in-out");
        }
      );

      $(
        ".audio-menu__content li:first-child .audio-menu__content-colum-sbox .audio-menu__sbox"
      ).on("click", function(e) {
        const li = e.target.parentNode.parentNode;
        audioList.removeChild(li);
        list = audioList.querySelectorAll("li");
        $(".audio-menu__header .audio-menu__header-cnt").text(
          list.length + "곡"
        );
      });
    });
  }
  let swiper;
  
// video를 가져오는 ajax
  $(document).ready(()=>{
	  swiper = new Swiper(".swiper-container", {
	      slidesPerView: 1.3,
	      spaceBetween: 50,
	      centeredSlides: true,
	      pagination: {
	        el: ".swiper-pagination",
	        clickable: true
	      },
	      navigation: {
	        nextEl: ".swiper-button-next",
	        prevEl: ".swiper-button-prev"
	      }
	  });
	  $.ajax({
		  url : videoListUrl,
		  dataType : "json"
	  }).done((videoList)=>{
		  $(".swiper-wrapper").html(video(videoList));
		  swiper.update();
	  });
  })
  
  $(".info-busker__profile-img").click(function(){
	  const no = $(this).parent().parent().attr("value");
	  $.ajax({
		  url : videoItemUrl,
		  dataType : "json",
		  data : "buskerNo="+no
	  }).done((videoList)=>{
		  $(".swiper-wrapper").html(video(videoList));
		  swiper.update();
		  swiper.slideTo(0);
	  })
  });
  
function video(videoList){
	  let html = "";
	  if(videoList.length === 0){
		html = "<div class='busker-content__empty'>버스커가 올린 영상이 존재하지 않습니다.</div>";  
	  }else {
		  for(let i = 0; i<videoList.length ; i++){
		 	html +=		
	            `
	          <div class="swiper-slide">
	            <iframe
	              width="540px"
	              height="360px"
	              src="`+videoList[i].url+`"
	              frameborder="0"
	              allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture"
	              allowfullscreen
	            ></iframe>
	          </div>
			 `;			  
		  }
     }
     return html;
}