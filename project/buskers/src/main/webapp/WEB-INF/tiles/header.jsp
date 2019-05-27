<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="google-signin-client_id" content="711343291168-unua7itp9em5gms7up15sl5rn2ei80vj.apps.googleusercontent.com">  
   <link rel="stylesheet" href="<c:url value='/resources/css/main/header/header.css'/>" />
    <!-- Main style sheet -->
    <link href="<c:url value='/resources/css/main/miniprofile.css'/>" rel="stylesheet">    
    <!-- Google Fonts -->
    <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>        
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/css?family=Italianno&display=swap" rel="stylesheet">
  
  <!-- Start header section -->
  <header class="main_header_wrapper">  
    <nav class="main_menu_navigation" role="navigation">  
      <div class="main_container">
        <div class="main-header">

          <!-- 로고 -->      
          <a class="main_logo" href="<c:url value='/main/main.do'/>"><img src="<c:url value='/resources/img/logo.png'/>"><span>Buskers</span></a> 
        </div>

        <div class="main_menu_list">
          <ul id="top-menu" class="nav navbar-nav main_menu">
            <li><a href="<c:url value='/main/main.do'/>">HOME</a></li>                       
            <li class="dropdown">
              <a>BOARD <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">                
                <li><a href="<c:url value='/main/board/notice/list.do'/>">NOTICE</a></li>
                <li><a href="<c:url value='/main/board/free/list.do'/>">FREE</a></li>
                <li><a href="<c:url value='/main/board/qna/list.do'/>">QnA</a></li>                                            
                <li><a href="<c:url value='/main/board/agency/list.do'/>">AGENT</a></li>                                            
              </ul>
            </li>
            <li class="dropdown">
              <a>ARTIST <span class="caret"></span></a>
              <ul class="dropdown-menu" role="menu">                
                <li><a href="#">ARTIST INFO</a></li>
                <li><a href="<c:url value='/artist/main/main.do'/>">ARTIST CHANNEL</a></li>
              </ul>                    
            <li><a href="#">ABOUT</a></li>
          </ul>                            
        </div>
        <div class="login_menu">
        <c:if test="${sessionScope.user eq null}">
          <a href="<c:url value='/main/member/loginform.do'/>">Log In</a>
          <a href="<c:url value='/main/member/signupform.do'/>">Join</a>
        </c:if>
        <c:if test="${sessionScope.user ne null}">
			<span class="header__user">
				<div class="header-a">
				<i class="far fa-bell fa-lg"></i>
				<i class="far fa-envelope fa-lg"><span class="message_count">2</span></i>
					<div class="header-b2">${sessionScope.user.nickName}  님</div>
					<div class="header-b3">
						<div class="header-c">
							<a class="header-d" role="button" 
							   tabindex="0" title="계정: ${sessionScope.user.id}  (${sessionScope.user.email})"
							   aria-expanded="true">
							   <span class="header-e" aria-hidden="true"><img class="profile_img" src="<c:url value='/resources/img/boyoung.jpg'/>"/></span>
							</a>
							<div class="header-f h-toggle"></div>
							<div class="header-g h-toggle"></div>
						</div>
						<div class="header-h h-toggle" aria-label="계정 정보"
							aria-hidden="false" img-loaded="1">
							<div class="header-i">
								<a class="header-i2" aria-label="프로필 사진 변경" href="#">
									<div class="header-i3" style="position: relative">
										<div class="header-i4" title="프로필">
											<img class="miniprofile_img" src="<c:url value='/resources/img/boyoung.jpg'/>"/>
										</div>
										<span class="header-i5">변경</span>
									</div>
								</a>
								<div class="header-i6">
									<div class="header-i7">${sessionScope.user.id}</div>
									<div class="header-i8">
										${sessionScope.user.email}
									</div>
									<div class="header-i9">
										<span>${sessionScope.user.nickName} 님</span><br>
										<span> 안녕하세요!</span>
									</div>
									<a class="header-i10" href="<c:url value='/main/member/profile.do'/>">프로필 설정</a>
								</div>
							</div>
							<div class="header-j">
								<div>
									<a class="header-j2" href="#">나의 페이지</a>
								</div>
								<div>
									<a class="header-j3" id="logout" target="_top">로그아웃</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</span>
		</c:if>
        </div>
      </div> 
      
    </nav> 
  </header>

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script>


	$(".header-c").click(function() {
	    $(".h-toggle").toggle();
	 });
	 
	 /*
	 $(document).click(function(e) { 
	    console.log($(e.target).prop("class"));
	    if ( $(e.target).prop("class") != "profile_img" ) {
	       if ( $(e.target).prop("class") != "header-h" ) {
	          $(".h-toggle").hide();
	       }
	    }
	 }); 
	 */
	 

	$("#logout").click(function() {
		var result = confirm("로그아웃 하시겠습니까?");
		if(result) {

			//구글로그아웃
			$.ajax({
			        type : "POST",
			        dataType : 'text',
			        url : 'https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=http://localhost/application-name/logoutUser',
			        crossDomain : true,
			        xhrFields : {
			           withCredentials : true
			        }
		     })
		     /*
		     function onLoad() {
		         gapi.load('auth2', function() {
		           gapi.auth2.init();
		         });
		       }
		     function signOut() {
		    	    var auth2 = gapi.auth2.getAuthInstance();
		    	    auth2.signOut().then(function () {
		    	    	alert("사인아웃실행됨");
	    	        console.log('User signed out.');
	    	    });
	    	  }
		   
			onLoad();
		    signOut();
		    */
			var naverLogin = new naver.LoginWithNaverId(	
					{
						clientId: "SPRQERrB_l9ca0FeJSNq",
						callbackUrl: "http://localhost/buskers/main/member/loginform.do",
						isPopup: false,
						callbackHandle: true,
					}
			);
			naverLogin.init();
			// 네이버 세션 로그아웃 처리
			naverLogin.logout();
			// 네이버 로그아웃처리
			 $.ajax({
			        type : "POST",
			        dataType : 'text',
			        url : "http://nid.naver.com/nidlogin.logout",
			        crossDomain : true,
			        xhrFields : {
			           withCredentials : true
			        }
		     })
			location.href="<c:url value='/main/member/logout.do'/>";
			alert("로그아웃 되셨습니다!");
		}
	});
	
	/*
	$(document).click(function(e) { 
		console.log($(e.target).prop("class"));
		if ( $(e.target).prop("class") != "profile_img" ) {
			if ( $(e.target).prop("class") != "header-h" ) {
				$(".h-toggle").hide();
			}
		}
	}); 
	*/
	
	let popupX = (window.screen.width / 2) - (500 / 2);
	let popupY = (window.screen.height / 2) - (500 / 2);
	
	$(".fa-envelope").click(function () {
		window.open('<c:url value="/main/header/message/list.do"/>', '', 'top=' + popupY + ', left=' + popupX + ', scrollbars=no, resizable=no, width=500, height=500');
	});
	
</script>
