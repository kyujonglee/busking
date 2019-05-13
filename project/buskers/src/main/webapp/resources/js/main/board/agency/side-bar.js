let slideFlag = true;
$(".side-bar__icon:first").click(function(){
    if(!slideFlag){
        $(".side-bar__wrapper").animate({left : "140px"},500);
        $(".side-bar__wrapper").css({"z-index" : 0});
        slideFlag = true;
    }else {
        $(".side-bar__wrapper").animate({left : "0px"},500);
        $(".side-bar__wrapper").css({"z-index" : 1});
        slideFlag = false;
    }
});
