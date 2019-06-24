<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<section class="busker-show-list">
	<header class="busker-show__header">
		<div class="busker-show__header-top-menu">
			<a class="header-top-menu__content"> <i class="fas fa-home fa-lg"></i>
				버스커 홈
			</a> &gt <a class="header-top-menu__content"> 공연일정 </a>
		</div>
		<div class="busker-show__header-title">
			<a class="busker-show__header-link">공연일정</a>
			<a href="<c:url value='enrollForm.do?buskerNo=' />${buskerNo}" onclick="return enrollForm();" class="busker-show__header-enroll-btn">등록하기</a>
		</div>
	</header>
	<section class="busker-show-list__main">
	</section>
</section>
<script>
	// 위에서 지정됨.
	/* const buskerNo = ${buskerNo}; */
	const no = ${(sessionScope.user eq null) ? 0 : (sessionScope.user.busker eq null)? 0 : sessionScope.user.busker.buskerNo};
	function enrollForm(){
		if(no === ${param.buskerNo}){
			return true;
		}else {
			alert('버스커만 공연일정을 등록할 수 있습니다.');
			return false;
		}
	}
	
	const update = (showNo, enrollDate) => {
	  if(no === buskerNo) {
		  if(new Date() > enrollDate){
			  alert("현재 날짜 이전의 공연날짜는 수정할 수 없습니다.");
		  }else {
			  location.href = "updateForm.do?showNo="+showNo+"&buskerNo="+buskerNo;
		  }
	  }else {
		  alert("해당 버스커만 공연일정을 수정할 수 있습니다.");
	  }
	};
</script>
<script src="<c:url value='/resources/js/artist/board/forecast.js' />"></script>
<script src="<c:url value='/resources/js/artist/board/list.js' />"></script>