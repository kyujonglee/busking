  // list -> ajax 로 바꿀 것!
  function musicList(buskerNo) {
    $.ajax({
      url: musicListUrl,
      dataType: "json",
      data: "buskerNo=" + buskerNo
    }).done(list => {
      let html = "";
      for (let song of list) {
        html +=
          `
          <div class="busker-music__list-item">
            <div class="busker-music__list-item-hidden">
              <div class="busker-music__hidden-item" value='${song.fileNo}'>
                <a class="busker-music__hidden-link">수정</a>
                <span>l</span>
                <a class="busker-music__hidden-link">삭제</a>
              </div>
            </div>
            <div class="busker-music__list-columns">
	               <div class="busker-music__album-img">
	                 <img
	                   src="${downloadPath}${song.imgPath}"
	                   alt="profile"
	                   onError="this.src='${defaultProfileUrl}';"
	                 />
	               </div>
	               <div class="busker-music__content">
	                 <div class="busker-music__content-title">${song.title}</div>
	                 <div class="busker-music__content-writer">${song.writer}</div>
	                 <div class="busker-music__content-time">
	                   <i class="far fa-clock"></i>
	                   <span class="busker-music__content-time-song">${song.time}</span>
	                 </div>
	               </div>
	               <div class="busker-music__submenu">
	                 <i class="fas fa-ellipsis-v fa-lg"></i>
	               </div>
               </div>
            </div>
			`;
      }
      $(".busker-music__list-items").html(html);
      $(".busker-music__submenu").click(function() {
        $(this)
          .parent()
          .parent()
          .find(".busker-music__list-item-hidden")
          .fadeToggle();
      });
      
      // 노래 리스트에서 삭제 눌렀을 때에 이벤트 설정
      $(".busker-music__hidden-item a:last-child").click(function(){
        const fileNo = $(this).parent().attr('value');
        $.ajax({
          url : musicDeleteUrl,
          data : "fileNo="+fileNo 
        })
        .done(()=>{
        	// sidebar count 값 수정!
        	$.ajax({
				url : mainCountUrl,
				dateType : "json",
				data : "buskerNo="+ buskerNo
			}).done((map) => {
				const musicCount = map.musicCount;
				$("#musicCount").text(musicCount);
			});
	        musicList(buskerNo);
	        alertInfo("삭제되었습니다!");
        });
      });
      
      // 노래 리스트에서 수정 눌렀을 때의 이벤트 설정
      $(".busker-music__hidden-item a:first-child").click(function(){
    	  const fileNo = $(this).parent().attr('value');
    	  // 등록버튼을 없애고 수정 버튼이 생기게함!
    	  $(".busker-music__form-row:last-child").html(`
    			<input type="hidden" name="fileNo" value=""/>
  	            <button type="button" class="busker-music__btn" onclick="update(${buskerNo});">수정</button>
    	  `);
    	  $(".busker-music__form-row:last-child input[name='fileNo']").val(fileNo);
    	  // 기존의 값들을 가져와야함!
    	  $.ajax({
    		  url : musicItemUrl,
    		  dataType : "json",
    		  data : "fileNo="+fileNo
    	  })
    	  .done((musicFile)=>{
    		  $("#title").val(musicFile.title);
    		  $("#writer").val(musicFile.writer);
    		  $("#time").val(musicFile.time);
    		  alertInfo("오른쪽 등록메뉴에서 수정해주시기 바랍니다.");
    	  })
       });
    });
  }

  
const update = buskerNo => {
	const formData = new FormData(document.getElementById("musicForm"));
	
    const title = $("#title").val();
    const writer = $("#writer").val();
    const time = $("#time").val();
    const attach = $("#attach").val();
    
    // 유효성 검사!
    if (isEmpty(title, "노래제목을 입력해주세요"))return;
    if (isEmpty(writer, "아티스트를 입력해주세요"))return;
    if (isEmpty(time, "연주시간을 입력해주세요"))return;
    if (isEmpty(attach, "파일을 선택해주세요"))return;
    
    $.ajax({
      url : musicUpdateUrl,
      type : "post",
      data : formData,
      contentType : false,
      processData : false
    })
    .done(()=>{
    	$(".busker-music__form-row:last-child").html(`
	        <button type="button" class="busker-music__btn" onclick="insert(${buskerNo});">등록</button>
    	`);
    	$("#title").val("");
      	$("#writer").val("");
      	$("#time").val("");
        $("#attach").val("");
        $("#attach2").val("");
        musicList(buskerNo);
        alertInfo("수정되었습니다!");
    });
    
};
  
  
const insert = buskerNo => {
  const formData = new FormData(document.getElementById("musicForm"));
  
  const title = $("#title").val();
  const writer = $("#writer").val();
  const time = $("#time").val();
  const attach = $("#attach").val();
  
  if (isEmpty(title, "노래제목을 입력해주세요"))return;
  if (isEmpty(writer, "아티스트를 입력해주세요"))return;
  if (isEmpty(time, "연주시간을 입력해주세요"))return;
  if (isEmpty(attach, "파일을 선택해주세요"))return;
  
  $.ajax({
    url : musicInsertUrl,
    type : "post",
    data : formData,
    contentType : false,
    processData : false
  }).done( () => {
  	musicList(buskerNo);
  	$("#title").val("");
  	$("#writer").val("");
  	$("#time").val("");
    $("#attach").val("");
    $("#attach2").val("");
 	alertInfo("등록되었습니다!");
  	$.ajax({
		url : mainCountUrl,
		dateType : "json",
		data : "buskerNo="+ buskerNo
	}).done((map) => {
		const musicCount = map.musicCount;
		$("#musicCount").text(musicCount);
	});
  });
}

function init() {
  musicList(buskerNo);
}
  init();
  
 function isEmpty(ele, msg) {
	if (ele === "") {
		alertInfo(msg);
		return true;
	}
	return false;
 }
  
  function alertInfo(msg,text){
	Swal.fire({
	  title:msg,
	  text:text,
	  type:'info',
	  timer:2000
	});
  }
  
  function chk_file_type(obj) {
	  const file_kind = obj.value.lastIndexOf('.');
	  const file_name = obj.value.substring(file_kind+1,obj.length);
	  const file_type = file_name.toLowerCase();

	  let check_file_type = ['mp3','wax','wma','m4a'];

	  if(check_file_type.indexOf(file_type) == -1){
	  	   alertInfo('오디오 파일만 선택할 수 있습니다.');	
		   const parent_Obj=obj.parentNode
		   const node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
		   return false;
	  }
  }
  
  function chk_file_type2(obj) {
	  const file_kind = obj.value.lastIndexOf('.');
	  const file_name = obj.value.substring(file_kind+1,obj.length);
	  const file_type = file_name.toLowerCase();

	  let check_file_type = ['jpg','jpeg','png','bmp'];

	  if(check_file_type.indexOf(file_type) == -1){
	  	   alertInfo('이미지 파일만 선택할 수 있습니다.');	
		   const parent_Obj=obj.parentNode
		   const node=parent_Obj.replaceChild(obj.cloneNode(true),obj);
		   return false;
	  }
  }
  
  $(document).ready(function(){
	  $("#attach").on("change",handleImgFileSelect);
  });
  
  function handleImgFileSelect(e) {
	e.preventDefault();
	
	let prvFiles = e.target.files;
	let filesArr = Array.prototype.slice.call(prvFiles);
	
	filesArr.forEach(function (f) {
		if(!f.type.match("audio.*")) {
			alert("확장자는 오디오 확장자만 가능합니다.");
			$("#attach").val("");
			return;
		}
	});
  }
