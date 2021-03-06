# busking

<h1 align="center"> 😆Welcome to buskers 😆</h1>
<p>
  <img src="https://img.shields.io/badge/version-0.0.1-pink.svg" />
  <img src="https://img.shields.io/badge/spring-5.1.6-blue.svg" />
  <a href="https://github.com/kyujonglee/busking#readme">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-none-red.svg" target="_blank" />
  </a>
  <a href="https://github.com/demetoir/day3-challenge/graphs/commit-activity">
    <img alt="Maintenance" src="https://img.shields.io/badge/Maintained%3F-nope-green.svg" target="_blank" />
  </a>
  <a href="https://github.com/demetoir/day3-challenge/blob/master/LICENSE">
    <img alt="License" src="https://img.shields.io/badge/License-Apache_Lisense_2.0-yellow.svg" target="_blank" />
  </a>
</p>

## 기획의도 
평소 버스킹에 관한 정보를 각각의 버스킹 그룹의 sns등을 찾아봐야하는 불편함을 해소함과 동시에 의사소통도 원활하게 하는 것.
각각 찾아봐야했던 정보를 한곳에 취합함으로써, 버스커들은 홍보, 정보제공, sns공유, 팬들과의 의사소통 등이 편해지게 됩니다.
또한 일반사용자들은 다양한 버스커들에 대한 정보를 얻을 수 있고, 버스커와의 의사소통이 가능한 게시판등을 통해 흥미를 느끼게 됩니다.
이를 통하여 버스킹 문화를 활성화시키는 것이 프로젝트의 목적입니다.

## 프로젝트 기간
> 약 7주간 진행(2주: 데이터 모델링, 기획 등, 4주: 개발기간, 1주: 발표준비 및 코드 리팩토링)
  팀원별로 풀스텍으로 프로젝트를 진행함.

## 프로젝트 영상
[![Video Label](https://img.youtube.com/vi/sqvoI1b5tx0/0.jpg)](https://www.youtube.com/watch?v=sqvoI1b5tx0)
```
이미지를 클릭하시면 영상을 볼 수 있습니다.
(https://www.youtube.com/watch?v=sqvoI1b5tx0)
```

## 사용 기술
- backend(spring, node.js, mybatis, mysql)
- frontend(jsp, jQuery, html/css/javascript, d3.js, daum map, openweathermap 등 여러 api)
- 협업도구(sourcetree, trello, google drive, google hangout)

## 주요 기능
- 여러 버스커들을 회원들에게 자연스럽게 보여지게 함으로써 버스커와 회원간에 접근성을 높힘. 자연스러운 홍보효과도 제공.

1. 지도
  - 버스커들의 공연일정을 한눈에 알아보기 쉽게 하였습니다. 지역, 날짜별로 조회가능.

2. 피드
  - 최근에 버스커들이 올린 영상, 이미지, 공연일정 등을 살펴볼 수 있으며, 팔로우한 버스커들의 공연일정, 영상, 이미지 또한 볼 수 있음.

3. 버스커 소개
  - 버스커와 버스커들의 영상이 랜덤으로 보여지며, 버스커들이 최근에 올린 음악을 뮤직플레이어를 통해 자동으로 들을 수 있음.

4. 알람, 쪽지
  - 자신이 팔로우한 버스커의 공연일정을 실시간으로 받아볼 수 있으며, 다른 사용자가 보낸 쪽지도 실시간으로 받아볼 수 있음. ( 업체가 보낸 쪽지의 경우 쪽지에 업체정보가 들어있음. )

5. 뮤직플레이어
  - 버스커 소개 페이지, 버스커 개인 페이지에 들어가면 뮤직플레이어를 통해 버스커의 음악을 들을 수 있음. 버스커의 이미지를 클릭하면 해당 버스커의 영상들을 볼 수 있음.

6. 소셜 로그인
  - 카카오, 구글, 네이버 소셜로그인을 구현

7. 채팅
  - 버스커 채널 별로 버스커, 회원들이 서로 채팅을 할 수 있음. 편리한 귓속말 기능 제공. 의사소통 공간 제공

8. 공연일정
  - 다음지도 api, openweathermap api 를 이용하여, 해당 지역에 대한 날씨를 볼 수 있음. 

9. 버스커 음악등록
  - 버스커는 자신의 음악, 이미지를 등록할 수 있음.

10. 자유게시판, qna 게시판, 공지게시판
  - 좋아요, 댓글, 대댓글 ( @사용자이름을 자동으로 생성),추천, 정렬, 무한스크롤 기능 제공. 

### 내가 맡은 부분
```
조장으로써 프로젝트 일정관리, 환경설정 등을 진행함.
뮤직플레이어 (퍼블리싱부터 시작해서  api 를 전혀 이용하지 않고, html audio 태그를 이용하여 직접 구현),
버스커 소개 페이지, 공연일정 페이지, 버스커 음악등록, 업체 게시판 구현, 버스커 개인 메인 페이지 -> 풀스텍으로 개발
```

### 소감
```
이 프로젝트는 spring을 이용한 첫 프로젝트이자, 내가 했던 것 중에 규모가 제일 큰 프로젝트였다. 1달밖에 개발을 안했지만…
이런 프로젝트를 해보니 예전에 했던 프로젝트들은 정말 규모가 작았던 것으로 생각이 들었다. 
그만큼 물론 내가 성장한 것이라고 생각이 들었다.
이전에는 여러 api 들을 이용하든 것에 대한 두려움도 있었고, 직접 만드는 것에 대한 두려움도 있었다.
즉, web 개발을 두려워했던 것 같다. 하지만, 이번에 여러 api 들도 이용하고 퍼블리싱부터 백엔드 구현까지 모든 걸 다 경험해보니
자신감이 많이 생겼다. 파일 업로드, 날씨 api, html audio를 이용한 뮤직플레이어, ajax 등을 직접 해보니 다음에는 더 잘해낼 수 있다고 생각이 들었다.
이번 프로젝트에서 조장을 하면서, 이런 결과물을 만들어 낸 것에 대해서 뿌듯하지만, 이번 경험을 통해 더 조장 역할을 잘 할 수 있을 것 같았고, 조장이 아니더라도 조장의 마음을 잘 알게 되어서 훌륭한 조원이 될 수 있을 것 같았다. 

백엔드에서는 spring을 사용하여 만족도가 높았지만, 프론트(jsp, jQuery)에서는 그렇지 못했다. 따라서 지금 배우고 있는 리액트의 필요성이 더욱 절실하게 느껴졌다. 그리고 다음에 개발할 때에는 이번에 이용한 것들을 제외하고, spring boot, JPA, react, graphql, apollo 등을 이용하여 개발을 하고 싶다는 생각이 들었다. 
```


### 메인페이지

[![Main](/img/메인페이지1.png)](메인페이지)

[![Main](/img/메인페이지2.png)](메인페이지)

[![Main](/img/메인페이지3.png)](메인페이지)

[![Main](/img/메인페이지4.png)](메인페이지)

`지도, 피드, 알람, 쪽지 기능 제공`

[![](/img/버스커소개페이지.png)](버스커소개페이지)

`뮤직플레이어, 랜덤한 버스커와 버스커들의 영상을 보여줌`

[![](/img/버스커_개인_메인_페이지.png)](버스커개인페이지)

`채팅, 뮤직플레이어, 도움말 등이 있으며, 버스커의 정보를 한눈에 볼 수 있음.`

[![](/img/공연일정.png)](버스커개인페이지)

[![](/img/공연상세.png)](버스커개인페이지)

[![](/img/버스커음악등록.png)](버스커개인페이지)

[![](/img/업체조회.png)](업체게시판)

`업체 등록을 하게 되면 관리자가 승인을 해줄 수 있음. 업체 등록이 허가될시 쪽지에 업체 정보가 추가되며 Bold 처리가 됨. 업체 허가를 받게 되면 업체 고유번호를 받게 되는데 이를 이용하여, 같은 업체 사람이 업체 등록을 다시 하게 됨을 방지함.`

[![](/img/업체등록.png)](업체게시판)

[![](/img/업체등록(관리자).png)](업체게시판)

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
