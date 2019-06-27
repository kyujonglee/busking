

$(".search__board__wrapper div:eq(1)").addClass("first__board__list__top");
//이미지가 없을경우에 기본이미지로 변경하
if(imgPath == ""){
	$(".artist__search__image img").attr("src", nomalProfile);
}
    	

$.ajax({
	data : {input:input},
	url : "search-ajax.do",
}).done(function(result){
	
	//검색후 아티스트의 결과가 0일경우에 정보없다는 알림을 띄움.
	if(result.length == 0){
		$(".artist__search__list").remove();
		$(".onlyNoResult").append(`
				<div class="no__result">
    	  		<b>`+input +`</b>에 대한 아티스트 정보가 없습니다.
   			</div>
		`);
	}
	
	//검색결과가 정확하게 맞을경우, 아티스트 여러명목록 보여주는창 삭제
	if(result.length == 1 && result[0].activityName == input){
		$(".artist__search__list").remove();
	}
	
	//목록을 추가해줌
	for(let i=0; i<result.length ; i++){
		//검색어와 활동명이 정확하게 일치하는것은 제외
		if(result[i].activityName != input){
			if(result[i].profileImg == null){
	    		$(".artist__search__list_detail").append(`
	    			<div class="artist__search__list__info">
					  	<img src= `+nomalProfile+`>
		            	<div class="artist__search__list_detail-name">
		             		<a href="${artistPage+result[i].buskerNo}" class="artist__search-profile-title">${result[i].activityName}</a>
		             	</div>
		             	<div></div>
	              	</div>
	    		`)
			}else{
	    		$(".artist__search__list_detail").append(`
	    			<div class="artist__search__list__info">
					  	<img src="`+fileDownload+`?path=`+result[i].profileImgPath+result[i].profileImg+`">
		            	<div class="artist__search__list_detail-name">
		             		<a href="${artistPage+result[i].buskerNo}" class="artist__search-profile-title">${result[i].activityName}</a>
		             	</div>
		             	<div></div>
	              	</div>
	    		`)
			}
		}
	}
})