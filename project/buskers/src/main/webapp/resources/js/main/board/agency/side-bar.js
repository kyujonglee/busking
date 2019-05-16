let slideFlag = true;
$(".side-bar__column .side-bar__icon:first").click(function(){
    if(!slideFlag){
    	console.log("사이드바 사라짐");
    	$(".side-bar").animate({width : "60px"},300);
    	$(".side-bar .side-bar__column:nth-child(2)").fadeOut(200);
        slideFlag = true;
    }else {
    	console.log("사이드바 나타남");
        $(".side-bar").animate({width : "200px"},300);
        $(".side-bar .side-bar__column:nth-child(2)").fadeIn('slow');
        slideFlag = false;
    }
});
