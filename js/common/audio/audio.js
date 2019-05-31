// $(".busker-audio").click(function() {
//   $(this).animate(
//     {
//       width: "50%"
//     },
//     "fast"
//   );
//   $(this).html(`
//     <audio id="myAudio" controls="controls" loop="loop">
//          <source src="MyType.mp3" type="audio/mpeg">
//     </audio>
//     <p>
// 		<span id="cTime">0</span>
// 	</p>
//     `);
// });

const audio = document.querySelector("#myAudio");
audio.addEventListener("timeupdate", function() {
  const currentTime = parseInt(audio.currentTime);
  const duration = parseInt(audio.duration);

  const time =
    parseInt(currentTime / 60) +
    ":" +
    pad(currentTime % 60) +
    " / " +
    parseInt(duration / 60) +
    ":" +
    pad(duration % 60);
  $("#cTime").text(time);
});

function pad(time) {
  return time < 10 ? "0" + time : time;
}

$("#play").click(function() {
  // audio.paused : true(중지된 경우), false(플레이중)
//   console.log(audio.paused);
  // 중지된 상태일 경우 플레이 시키기
  if (audio.paused) {
    // 오디오 실행
    audio.play();
  }
  // 플레이 상태일 경우 일시 중지 시킨다.
  else {
    audio.pause();
  }
  $(this)
    .toggleClass("fas fa-play fa-lg ")
    .toggleClass("fas fa-pause fa-lg");
});
