let isSlide = true;
$(".side-bar__icon:first").click(function(){
    if(!isSlide){
        $(".side-bar__wrapper").animate({left : "140px"},500);
        $(".side-bar__wrapper").css({"z-index" : 0});
        isSlide = true;
    }else {
        $(".side-bar__wrapper").animate({left : "0px"},500);
        $(".side-bar__wrapper").css({"z-index" : 1});
        isSlide = false;
    }
});
function init(){
    
}
init();