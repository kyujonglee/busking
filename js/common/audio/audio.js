let playFlag = true;

$(".busker-audio-wrapper svg").click(function() {
  if (playFlag) {
    $(this)
      .parent()
      .children(".busker-audio")
      .css({ display: "grid" });
    $(this).css({ "margin-right": "20px" });
    $(this)
      .parent()
      .animate({ width: "800px" }, "800");
    playFlag = false;
  } else {
    $(this)
      .parent()
      .children(".busker-audio")
      .css({ display: "none" });
    $(this).css({ "margin-right": "0px" });
    $(this)
      .parent()
      .animate({ width: "50px" }, "600");
    playFlag = true;
  }
});
const audio = document.querySelector("#myAudio");
const player = document.getElementById("music");
const canvas = document.querySelector("#myCanvas");
const ctx = canvas.getContext("2d");

canvas.onclick = function(e) {
  audio.currentTime = (e.offsetX / canvas.clientWidth) * audio.duration;
};

let colorFlag = true;
audio.addEventListener("timeupdate", function() {
  const currentTime = parseInt(audio.currentTime);
  const duration = parseInt(audio.duration);

  const current =
    parseInt(currentTime / 60) >= 10
      ? parseInt(currentTime / 60)
      : "0" + parseInt(currentTime / 60);
  const du =
    parseInt(duration / 60) >= 10
      ? parseInt(duration / 60)
      : "0" + parseInt(duration / 60);
  const time =
    current +
    ":" +
    pad(currentTime % 60) +
    " / " +
    du +
    ":" +
    pad(duration % 60);
  $("#cTime").html(`
  <span id="currentTime"> ${current + ":" + pad(currentTime % 60)} </span> / 
  <span id="duration"> ${du + ":" + pad(duration % 60)} </span>
  `);
  //-----------------------------------------
  // 캔버스 추가된 부분
  //-----------------------------------------
  // 그림을 그릴 컨텍스트
  ctx.clearRect(0, 0, canvas.clientWidth, canvas.clientWidth);
  const rectWidth = (currentTime / duration) * canvas.clientWidth;
  console.log("canvas.clientWidth", canvas.clientWidth);
  console.log("currentTime", currentTime);
  console.log("duration", duration);
  console.log(currentTime / duration);
  console.log("rectWidth : ", rectWidth);
  console.log("canvas.clientHeight", canvas.clientHeight);
  ctx.fillStyle = "#ff8534";
  ctx.fillRect(0, 0, rectWidth, canvas.clientHeight);
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
    player.classList.remove("paused");
    $(".busker-audio-wrapper .busker-audio__btn").css({
      fill: "var(--color-orange)"
    });
    // $("#myCanvas").css({"background-color":"var(--color-white)"});
    audio.play();
  }
  // 플레이 상태일 경우 일시 중지 시킨다.
  else {
    player.classList.add("paused");
    $(".busker-audio-wrapper .busker-audio__btn").css({
      fill: "var(--color-white)"
    });
    // $("#myCanvas").css({"background-color":"var(--color-orange)"});
    audio.pause();
  }
  $(this)
    .toggleClass("fas fa-play fa-lg ")
    .toggleClass("fas fa-pause fa-lg");
});

// $("#stop").click(() => {
//   audio.currentTime = 0;
//   audio.pause();
//   $("#play").attr("class", "fas fa-play fa-lg ");
//   player.classList.add("paused");
// });

// 음소거 이벤트 처리
$("#mute").click(function() {
  audio.muted = !audio.muted;
  $(this)
    .toggleClass("fas fa-volume-mute fa-lg")
    .toggleClass("fas fa-volume-up fa-lg");
});

$("#volumeAudio").on("input", function() {
  audio.volume = this.value;
});

let menuFlag = true;
// 메뉴 슬라이드
$("#menu-btn").click(function() {
    if(menuFlag){
        $(".audio-menu").animate({"right":"70px"},"700");
        menuFlag = false;
    }else {
        $(".audio-menu").animate({"right":"-320px"},"700");
        menuFlag = true;
    }
});