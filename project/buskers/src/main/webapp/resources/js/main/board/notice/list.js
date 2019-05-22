


/*a
        $(".notice-board-main__view-item").mouseenter(function(e){
          // $(".mouse-active").css("bottom",t+sh);
          // $(this).Parent().offset().top;
          // console.log("부모좌표"+pindex);
          let index = $(this).position().top;
          console.log("자식좌표"+$(this).position().top);
          $(".mouse-active").animate({top:index},500);
        });
*/


  //스크롤 위로
$(".notice-board-main__view-top-btn").click(function(){
  $("#notice_board_main__view-list").stop().animate({scrollTop:0},1000);
})

