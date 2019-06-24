<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://fonts.googleapis.com/css?family=Playball&display=swap" rel="stylesheet">

<aside class="busker-side">
	<section class="busker-side__profile">
		<header class="busker-side__header">
			<a href="<c:url value='/artist/main/main.do'/>?buskerNo=${param.buskerNo}" class="busker-side__header-title">
				Artist Channel
			</a>
			<div class="busker-side__info-btn">
				<i class="fas fa-angle-right fa-2x"></i>
			</div>
		</header>
		<article class="busker-side__profile-info" id="busker-profile">
			<header class="busker-side__profile-header">
				<span class="busker__profile-header-edit">
					<c:if test="${sessionScope.user.busker.buskerNo eq param.buskerNo}">
						<button class="busker__profile-header-edit-button" data-toggle="modal" data-target="#myModal">
							Edit
						</button>
					</c:if>
				</span>
				<c:if test="${sessionScope.user.busker.buskerNo ne param.buskerNo}">	
				
					<button type="button" class="busker__profile-header-follow" >
						팔로우 +
					</button>
				</c:if>
			</header>
			<div class="busker-side__profile-photo">
<%-- 				<img src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" /> --%>
				<span class="busker-side__profile-name" id="activityName"><%-- ${busker.activityName} --%></span>
				<div class="busker-side__profile-social">
					<i class="fab fa-facebook-square fa-lg facebook"></i></a> 
					<img src="https://image.freepik.com/free-vector/instagram-icon_1057-2227.jpg"
						 class="instargram" /> 
					<i class="fab fa-youtube fa-lg youtube"></i>
				</div>
			</div>
		</article>
	</section>
	<ul class="busker-side__menu" id="side-menu">
		<li class="busker-side__menu-item">
			<div class="busker-side__menu-icon">
				<i class="fas fa-video fa-lg"></i>
			</div>
			<div class="busker-side__menu-title">
			<a href="<c:url value='/artist/board/video.do'/>?buskerNo=${param.buskerNo}">영상</a>
				<span class="busker-side__menu-count" id="videoCount"></span>
			</div>
		</li>
		<li class="busker-side__menu-item">
			<div class="busker-side__menu-icon">
				<i class="far fa-images fa-lg"></i>
			</div>
			<div class="busker-side__menu-title">
				<a href="<c:url value='/artist/board/photo.do'/>?buskerNo=${param.buskerNo}">사진</a><span class="busker-side__menu-count" id="photoCount"></span>
			</div>
		</li>
		<li class="busker-side__menu-item">
			<div class="busker-side__menu-icon">
				<i class="fas fa-clipboard fa-lg"></i>
			</div>
			<div class="busker-side__menu-title">팬 게시판</div>
		</li>
		<li class="busker-side__menu-item">
			<div class="busker-side__menu-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24">
                <path
						d="M22 4h-20c-1.104 0-2 .896-2 2v12c0 1.104.896 2 2 2h20c1.104 0 2-.896 2-2v-12c0-1.104-.896-2-2-2zm0 13.5c0 .276-.224.5-.5.5h-19c-.276 0-.5-.224-.5-.5v-6.5h20v6.5zm0-9.5h-20v-1.5c0-.276.224-.5.5-.5h19c.276 0 .5.224.5.5v1.5zm-9 6h-9v-1h9v1zm-3 2h-6v-1h6v1zm10-2h-3v-1h3v1z" />
              </svg>
			</div>
			<div class="busker-side__menu-title">
				<a href="<c:url value='/artist/board/list-support.do'/>?buskerNo=${param.buskerNo}">후원게시판</a>
			</div>
		</li>
		<li class="busker-side__menu-item">
			<div class="busker-side__menu-icon">
				<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
					viewBox="0 0 24 24">
                <path
						d="M24 2v22h-24v-22h3v1c0 1.103.897 2 2 2s2-.897 2-2v-1h10v1c0 1.103.897 2 2 2s2-.897 2-2v-1h3zm-2 6h-20v14h20v-14zm-2-7c0-.552-.447-1-1-1s-1 .448-1 1v2c0 .552.447 1 1 1s1-.448 1-1v-2zm-14 2c0 .552-.447 1-1 1s-1-.448-1-1v-2c0-.552.447-1 1-1s1 .448 1 1v2zm6.687 13.482c0-.802-.418-1.429-1.109-1.695.528-.264.836-.807.836-1.503 0-1.346-1.312-2.149-2.581-2.149-1.477 0-2.591.925-2.659 2.763h1.645c-.014-.761.271-1.315 1.025-1.315.449 0 .933.272.933.869 0 .754-.816.862-1.567.797v1.28c1.067 0 1.704.067 1.704.985 0 .724-.548 1.048-1.091 1.048-.822 0-1.159-.614-1.188-1.452h-1.634c-.032 1.892 1.114 2.89 2.842 2.89 1.543 0 2.844-.943 2.844-2.518zm4.313 2.518v-7.718h-1.392c-.173 1.154-.995 1.491-2.171 1.459v1.346h1.852v4.913h1.711z" />
              </svg>
			</div> <a href="<c:url value='/artist/board/list.do'/>?buskerNo=${param.buskerNo}"
			class="busker-side__menu-title"> 공연일정<span class="busker-side__menu-count" id="showCount"></span> </a>
		</li>
		<c:if test="${sessionScope.user.busker.buskerNo eq param.buskerNo}">
			<li class="busker-side__menu-item">
				<div class="busker-side__menu-icon">
					<i class="fas fa-music fa-lg"></i>
				</div>
				<a href="<c:url value='/artist/music/music-list.do?buskerNo=${param.buskerNo}'/>"
				class="busker-side__menu-title"> 버스커 음악<span class="busker-side__menu-count" id="musicCount"></span></a>
			</li>
        </c:if>
	</ul>
	<section class="busker-side__buskers" id="busker-recommend">
		<header class="buskers-header">
			<div class="buskers-header__title">관련 버스커</div>
		</header>
		<article class="buskers__recommend">
		</article>
	</section>
	<article class="busker-side__settings">
		<i class="fas fa-cog"></i>
		<span class="busker-side__menu-title">설정</span>
	</article>
	<c:if test="${sessionScope.user ne null}">
		<article class="busker-side__logout">
			<span onclick="logout();">logout</span>
		</article>
	</c:if>
</aside>

<!-- 모달창 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
   aria-labelledby="myModalLabel" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
      
         <div class="modal-header">
         	<div class="modal_title">페이스북,인스타,유튜브의 주소를 입력해주세요.</div>
         </div>
         
         <div class="modal-body">
	       	 <form action="" id="social-Url-Form">
		         <div class="form-group">
		         	 <div class="control-label">FaceBook : </div>
			         <input type="text" class="form-control" id="faceBookUrl" name="faceBookUrl" />
		         </div>
		         <div class="form-group">
		         	 <div class="control-label">Instargram : </div>
			         <input type="text" class="form-control" id="instargramUrl" />
		         </div>
		         <div class="form-group">
		         	 <div class="control-label">YouTube : </div>
			         <input type="text" class="form-control" id="youTubeUrl" />
		         </div>
	     	 </form>
         </div>
         
         <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">
               	닫기
            </button>
            <button type="button" class="btn btn-primary" id="myButtons1">
              	 저장
            </button>
         </div>
      </div> 
   </div> 
</div>

<script>
	let paramBuskerNo = "${param.buskerNo}";
	let mainAjax = "<c:url value='/artist/main/main-ajax.do'/>";
	let defaultPhoto = "<c:url value='/resources/img/default.jpg' />";
	let fileDownload = "<c:url value='/file/download.do?path='/>";
	let defaultProfile = '<c:url value="/resources/img/profile.png" />';
	let socialInsert = "<c:url value='/artist/main/social-url.do'/>";
	let followAjax = "<c:url value='/artist/main/follow-ajax.do'/>";
	let mainRecommend = "<c:url value='/artist/main/main-recommend-ajax.do'/>";
	let artistMain = "<c:url value='/artist/main/main.do'/>";
</script>
<script src="<c:url value='/resources/js/artist/main/sidebar.js' />"></script>
