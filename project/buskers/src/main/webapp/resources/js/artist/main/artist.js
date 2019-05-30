// busker_info 를 접는 버튼 동작
let infoFlag = true;
$(".busker-side__info-btn i").click(function() {
    if(infoFlag) {
        $(".busker-info").fadeOut(50);
        $(this).attr("class","fas fa-angle-right fa-2x");
        infoFlag = false;
    }else {
        $(".busker-info").fadeIn(50);
        $(this).attr("class","fas fa-angle-left fa-2x");
        infoFlag = true;
    }
//   $(".busker-info").fadeToggle(50);
});

// 챗팅창을 접는 버튼 동작
let chatFlag = true;
$(".busker-header__member i:last-child").click(function(){
    if(chatFlag) {
        $(".busker-chat").hide("slide", {direction: "right"});
        $(this).attr("class","far fa-comment-dots fa-lg");
        chatFlag = false;
    }else {
        $(".busker-chat").show("slide", {direction: "right"});
        $(this).attr("class","fas fa-comment-dots fa-lg");
        chatFlag = true;
    }
    // $(".busker-chat").fadeToggle(50);
})

