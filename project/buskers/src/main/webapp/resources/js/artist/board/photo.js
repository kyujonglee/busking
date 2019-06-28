
//사진등록
$(document).on("click","#regBtn",function(){
	let title = $("#title").val();
	let file = $("#photo")[0].files[0];
	let formData = new FormData();
	formData.append("file", file);
	formData.append("buskerNo",paramBuskerNo);
	formData.append("title", title);

	//글등록 유효성 검사
	if(title==""){
		alert("타이틀을 입력해주세요.")
		return;
	}
	if(title.length>21){
		alert("제목의 길이가 너무 깁니다. 20자 이하로 입력해주세요")
		return;
	}
	if(file == undefined){
		alert("파일을 첨부해주세요")
		return;
	}
	
	//파일 유효성 검사
	let fileName = $("#photo")[0].files[0].name;	
	fileName = fileName.slice(fileName.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.
	if(fileName != "jpg" && fileName != "jpeg" && fileName != "png" &&  fileName != "gif" &&  fileName != "bmp"){ //확장자를 확인합니다.
		alert('썸네일은 이미지 파일(jpg, png, gif, bmp,jpeg)만 등록 가능합니다.');
		return;
	}
	//파일등록 에이작스
	$.ajax({
		type : "post",
		data: formData,
		processData: false,
		contentType: false,
		cache : false,
		url : artistPhotoInsert,
	}).done(function(retsult){
		$(".photo_body_wrapper").html("");
		beginPage = 0;
		showList(0);
		$("#title").val("");
		$("#photo").val("");
		$("#photoModal").hide();
		//사진숫자 새로고침
		$.ajax({
			url : mainAjax,
			dateType : "json",
			data : "buskerNo="+paramBuskerNo
		}).done(map => {
			
			const photoCount = map.photoCount;
			$("#photoCount").text(photoCount);
		});
	})
})


//사진 디테일
$(document).on("click",".artist__photo__img img",function(){
	let fileNo = $(this).data("pno");
	$("#delNum").val(fileNo);
	$.ajax({
		data:{fileNo:fileNo},
		url : "select-photo-no-ajax.do",
	}).done(function(result){
		$(".modal_title").html("<input id='title_text' class='select_title_text title_text' value='"+result.title+"' readonly/>");
		$(".modal-body-photo").html(`<img src=`+fileDownload+result.path+result.sysname+`/>`)
		$("#photoModalDetail").show();
		$("#photoModalDetail").modal();
	})
})


//사진삭제
$(document).on("click","#delBtn",function(){
	if(confirm("정말로 삭제하시겠습니까?") == true){
		let fileNo = $(this).find("#delNum").val();
		$.ajax({
			data:{fileNo:fileNo},
			url : "delete-photo.do",
		}).done(function(){
			$("#photoModalDetail").hide();
			$(".photo_body_wrapper").html("");
			$(".photo_body_wrapper").css("height","710px");
			beginPage = 0;
			showList(0);
			
			//사진숫자 새로고침
			$.ajax({
				url : mainAjax,
				dateType : "json",
				data : "buskerNo="+paramBuskerNo
			}).done(map => {
				const photoCount = map.photoCount;
				$("#photoCount").text(photoCount);
			});
		})
	}
})

let beginPage = 0;
//목록보여주기 전체
function showList(){
	$.ajax({
		type : "post",
		data : {buskerNo: paramBuskerNo,beginPage : beginPage},
		url:'select-photo-ajax.do',
	}).done(function(result){
		if(result.length == 0 && beginPage == 0){
			$(".photo_body_wrapper").html("<div class='no__result'>버스커가 등록한 사진이 없습니다.</div>")
		}else{
			list(result.length,result,0);
		}
	})
}

//목록보여주기 추가되는부분
 	
let maxHeight = 0;
function list(length,result,f){
	setTimeout(function(){
		let i = $(".artist__photo__img").length;	// 이전 사진의 갯수
		let k = i%4;								// 몇번째 세로라인인지 알수있음 (1,2,3,4 번째 시작중 몇번째라인인지)
		let t = Math.floor(i/4);					// 몇번째 가로라인인지 알수있음 바로 전 가로라인까지 바놉ㄱ해야함
		let height = 0;
		for(let j=0; j<t ; j++){
			height += $(".artist__photo__img:eq("+k+")").outerHeight();
			k = k+4;
		};
		$(".photo_body_wrapper").append(`
			 <div class="artist__photo__img" style="top:`+height+`px;"  >
			 	<img data-pno="`+result[f].fileNo+`" src=`+fileDownload+result[f].path+result[f].sysname+` />
			 </div>`);
		f++;
		i++; 
		
		
		if(f==length){
			i = $(".artist__photo__img").length;	// 이전 사진의 갯수
			let maxHeight = 0;
			for(let p=0; p<4 ;p++){
				divLength = i-p;
				k = divLength%4;								// 몇번째 세로라인인지 알수있음 (1,2,3,4 번째 시작중 몇번째라인인지)
				t = Math.floor(divLength/4);					// 몇번째 가로라인인지 알수있음 바로 전 가로라인까지 바놉ㄱ해야함
				height = 0;
				for(let j=0; j<t ; j++){
					height += $(".artist__photo__img:eq("+k+")").outerHeight();
					k = k+4;
				};
				if(height > maxHeight){
					maxHeight= height;
				}
			}
			$(".photo_body_wrapper").css("height",maxHeight+"px");
			return;
		}
		list(length,result,f);
	},100);
}

	
//화면실행후 500의 시간을 갖고실행함. 바로실행할경우 사진불러오면서 스크롤이벤트가 실행됨
setTimeout(function(){
	$(".photo_body").data('ajaxready',true).scroll(function(e){
		if($(".photo_body").data('ajaxready') == false){
			return;
		}
// 		console.log("wrapper의 height : "+$(".photo_body_wrapper").height())
// 		console.log("body의 height : "+$(".photo_body").height())
// 		console.log("body의 height :: "+$(".photo_body").scrollTop());
//		console.log($(".photo_body_wrapper").height()-($(".photo_body").height()+$(".photo_body").scrollTop()));
		if($(".photo_body_wrapper").height()-($(".photo_body").height()+$(".photo_body").scrollTop()) < -10){
			$(".photo_body").data('ajaxready',false);				
			beginPage += 20;
			showList(beginPage);
			setTimeout(function(){
				$(".photo_body").data('ajaxready',true);
			},500);
		}
	});
},500)


showList(0);

