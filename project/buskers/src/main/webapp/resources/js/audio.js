let playFlag = true;

$(".busker-audio-wrapper svg:last").click(function() {
  if (playFlag) {
    $(this)
      .parent()
      .children(".busker-audio")
      .css({ display: "grid" });
    $(this)
      .parent()
      .children(".music")
      .css({ display: "flex" });
    $(this).css({ "margin-right": "20px" });
    $(this)
      .parent()
      .animate({ width: "900px" }, "800");
    playFlag = false;
  } else {
    $(this)
      .parent()
      .children(".busker-audio")
      .css({ display: "none" });
    $(this)
      .parent()
      .children(".music")
      .css({ display: "none" });
    $(".audio-menu").css({ right: "-320px" });
    menuFlag = true;
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

function whenPaused() {
  player.classList.remove("paused");
  $(".busker-audio-wrapper .busker-audio__btn").css({
    fill: "var(--color-orange)"
  });
  $("#play")
    .removeClass("fas fa-play fa-lg")
    .addClass("fas fa-pause fa-lg");
}

function whenPlayed() {
  player.classList.add("paused");
  $(".busker-audio-wrapper .busker-audio__btn").css({
    fill: "var(--color-white)"
  });
  $("#play")
    .removeClass("fas fa-pause fa-lg")
    .addClass("fas fa-play fa-lg");
}

$(document).ready(() => {
	audio.addEventListener("canplay", function(){
		  this.play();
		  whenPaused();
	});
});

canvas.onclick = function(e) {
  console.log(e.offsetX / canvas.clientWidth);
  console.log(audio.duration);
  console.log((e.offsetX / canvas.clientWidth) * audio.duration);
  console.log("audio.currentTime ",audio.currentTime);
  audio.addEventListener("canplay", function(){
		  audio.currentTime = (e.offsetX / canvas.clientWidth) * audio.duration;
		  console.log("audio.currentTime ",audio.currentTime);
          this.removeEventListener("canplay",arguments.callee);
  });
  audio.currentTime = (e.offsetX / canvas.clientWidth) * audio.duration;
  console.log("audio.currentTime ",audio.currentTime);
};

let colorFlag = true;
audio.addEventListener("timeupdate", function() {
  console.log("timeupdate ",audio.currentTime);
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
  if (isNaN(duration)) {
    $("#cTime").html(`
    <span id="currentTime"> 00:00 </span> / 
    <span id="duration"> 00:00 </span>
    `);
  } else {
    $("#cTime").html(`
    <span id="currentTime"> ${current + ":" + pad(currentTime % 60)} </span> / 
    <span id="duration"> ${du + ":" + pad(duration % 60)} </span>
    `);
  }
  //-----------------------------------------
  // 캔버스 추가된 부분
  //-----------------------------------------
  // 그림을 그릴 컨텍스트
  ctx.clearRect(0, 0, canvas.clientWidth, canvas.clientWidth);
  const rectWidth = (currentTime / duration) * canvas.clientWidth;
  ctx.fillStyle = "#ff8534";
  ctx.fillRect(0, 0, rectWidth, canvas.clientHeight);
});

function pad(time) {
  return time < 10 ? "0" + time : time;
}

$("#play").click(function() {
  console.log("click");
  if (audio.paused) {
    whenPaused();
    const play = audio.play();
    if (play !== undefined) {
      play
        .then(() => {
          console.log("shit");
          whenPaused();
        })
        .catch(error => {});
    }
  } else {
    whenPlayed();
    audio.pause();
  }
});

// 음소거 이벤트 처리
$("#mute").click(function() {
  audio.muted = !audio.muted;
  $(this)
    .toggleClass("fas fa-volume-mute")
    .toggleClass("fas fa-volume-up");
});

$("#volumeAudio").on("input", function() {
  audio.volume = this.value;
});

let menuFlag = true;
// 메뉴 슬라이드
$("#menu-btn").click(function() {
  if (menuFlag) {
    $(".audio-menu").animate({ right: "70px" }, "700");
    menuFlag = false;
  } else {
    $(".audio-menu").animate({ right: "-320px" }, "700");
    menuFlag = true;
  }
});

// 오디오 메뉴에 추가하기!!
//const audioItemList = [
//  { title: "심쿵해", writer: "aoa", data: "../../resources/sound/MyType.mp3", duration: "03:36" },
//  {
//    title: "트와이스",
//    writer: "FANCY",
//    data: "../../resources/sound/트와이스 - FANCY.mp3",
//    duration: "03:22"
//  },
//  {
//    title: "다비치",
//    writer: "너에게 못했던 내 마지막 말은",
//    data:
//      "../../resources/sound/다비치 (DAVICHI) - 너에게 못했던 내 마지막 말은.mp3",
//    duration: "03:11"
//  },
//  { title: "위아래", writer: "aoa", data: "../../resources/sound/MyType.mp3", duration: "03:36" }
//];

$(".audio-menu__header .audio-menu__header-cnt").text(
  `${audioItemList.length} 곡`
);

const audioList = document.querySelector(".audio-menu .audio-menu__content");

$(audioItemList).each((index, element) => {
  $(".audio-menu > ul").append(
    `
    <li class="audio-menu__content-column" data-index=${index}>
        <div class="audio-menu__content-colum-sbox">
          <div class="audio-menu__sbox">삭제</div>
        </div>
        <div class="audio-menu__music">
          <span class="audio-menu__title">${element.title}</span>
          <span class="audio-menu__writer">${element.writer}</span>
        </div>
        <div class="audio-menu__submenu">
          <span class="audio-menu__duration">${element.duration}</span>
          <i class="fas fa-ellipsis-v"></i>
        </div>
      </li>
  `
  );
});

let list = document.querySelectorAll(".audio-menu > ul > li");
list[0].classList.add("audio-menu__selected");
$(".audio-menu > ul > li .audio-menu__music").click(function(e) {
  const index = $(this)
    .parent()
    .data("index");
  const audioItem = audioItemList[index];
  list.forEach(ele => {
    ele.classList.remove("audio-menu__selected");
  });
  $(this)
    .parent()
    .addClass("audio-menu__selected");
  audio.src = audioItem.path;
  $(".music .music-title").text(audioItem.title);
  $(".music .music-writer").text(audioItem.writer);
  $("#play").trigger("click");
});

// 해야할 일!
//
// 1. 현재 재생중인 것 class 추가하기
// 2. 삭제 하는 div 만들기

$(".busker-audio__column:eq(1) svg:first-child").click(() => {
  for (let idx = 0; idx < list.length; idx++) {
    if (list[idx].classList.contains("audio-menu__selected")) {
      const previousElement = list[idx].previousElementSibling;
      console.log(previousElement);
      if (previousElement) {
        console.log("정상실행");
        previousElement.getElementsByClassName("audio-menu__music")[0].click();
      } else {
        list[list.length - 1]
          .getElementsByClassName("audio-menu__music")[0]
          .click();
      }
      return;
    }
  }
  list[list.length - 1].getElementsByClassName("audio-menu__music")[0].click();
});
$(".busker-audio__column:eq(1) svg:last-child").click(() => {
  for (let idx = 0; idx < list.length; idx++) {
    if (list[idx].classList.contains("audio-menu__selected")) {
      const nextElement = list[idx].nextElementSibling;
      console.log(nextElement);
      if (nextElement) {
        nextElement.getElementsByClassName("audio-menu__music")[0].click();
      } else {
        list[0].getElementsByClassName("audio-menu__music")[0].click();
      }
      return;
    }
  }
  list[0].getElementsByClassName("audio-menu__music")[0].click();
});

$(".audio-menu__content-column .audio-menu__submenu i").click(function() {
  console.log("i 눌림");
  $(this)
    .parent()
    .parent()
    .children(".audio-menu__content-colum-sbox")
    .fadeToggle("ease-in-out");
});

document
  .querySelectorAll(".audio-menu__content-colum-sbox .audio-menu__sbox")
  .forEach(ele => {
    ele.addEventListener("click", e => {
      const li = e.target.parentNode.parentNode;
      audioList.removeChild(li);
      list = audioList.querySelectorAll("li");
      $(".audio-menu__header .audio-menu__header-cnt").text(
        `${audioList.childElementCount} 곡`
      );
    });
  });
