  $(function(){
    $('#tourBtn').on('click', function() {
      let url = document.location.href;
      url = url.split("?")[0].split("//")[1];
      url = url.substring(url.indexOf("/")+1);
      if(url !== "buskers/artist/main/main.do") {
    	  Swal.fire({
              title : "버스커의 개인페이지 메인에서만 사용가능합니다.",
              type : 'info',
              timer : 2000
          })
    	  return;
      }
      $.ptJs({
        autoStart: true,
        "size.width" : "350px",
        position:{
          relocate: true
        },
        templateData: {
          title: '버스커 페이지 도움말'
        },
        steps: [
          {
            el: '#busker-header',
            templateData: {
              content: '버스커 페이지의 헤더입니다. 메인페이지로 돌아갈 수 있고, 도움말, 로그인 상태 등을 알 수 있습니다.'
            }
          },
          {
	          el: '#music-player',
	          templateData: {
	            content: '뮤직플레이어입니다. 버스커가 등록한 음악을 들을 수 있습니다.'
	          }
          },
          {
	          el: '#busker-profile',
	          templateData: {
	            content: '버스커의 프로필입니다. 팔로우를 할 수 있으며, sns 버튼을 클릭하면 버스커가 지정한 링크로 갈 수 있습니다.'
	          }
          },
          {
	          el: '#side-menu',
	          templateData: {
	            content: '버스커의 공연일정, 영상, 사진, 후원게시판 등을 볼 수 있습니다.'
	          }
          },
          {
	          el: '#busker-recommend',
	          templateData: {
	            content: '버스커와 관련된 버스커들을 추천받을 수 있습니다.'
	          }
          },
          {
	          el: '#busker-info',
	          templateData: {
	            content: '버스커에 대한 소개를 볼 수 있습니다.'
	          }
          },
          {
	          el: '#busker-content',
	          templateData: {
	            content: '버스커에 대한 여러 정보를 한 눈에 볼 수 있습니다.'
	          }
          },
          {
	          el: '#chat-icon',
	          templateData: {
	            content: '버스커 채널에 들어와 있는 회원들과 채팅을 할 수 있습니다.'
	          }
          }
        ]
      });
    });
  });

