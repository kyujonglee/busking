<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="form profile">
	<div class="profile__img__title">
		<h3>프로필 사진</h3>
	</div>	
	<div class="profile__img__box">
		<div class="profile__img__row">
			<div class="profile__img__setting">
				<div class="img__box1">
					<div class="img__box2">
						<img class="img__box3" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" title="프로필 사진" onError="this.src='<c:url value='/resources/img/profile.png' />';"/>
 					</div>
	   			</div>
  				<div class="img__update">
  					<div class="img__update__box">
  						<button type="button" class="img__update__button" id="profileBtn">프로필 사진 업데이트</button>
  					</div>
  					<div class="img__update__ment">
  						<p>JPEG, PNG, GIF 중 하나여야 하며 5MB를 초과할 수 없습니다.</p>
  					</div>
  				</div>
	   		</div>
	   	</div>
	</div>
  	<div class="profile__introduce__title">
  		<h3>프로필 소개</h3>
  	</div>
	<form name="member__profile__introduce"  id="member__introduce" action="memberProfileIntroduce.do"  method="post">
	    <div class="profile__introduce__box">
	    	<textarea class="introduce__textarea" name="profileIntroduce" id="introduce__textarea" placeholder="소개글을 써주세요!(50자 이내)" maxlength="50"></textarea>
	    </div>
		<input type="hidden" name="memberNo" value="${sessionScope.user.memberNo }"/>
		<div class="modifyWrapper">
			<button id="modify_intorduce" type="button" class="info_change_button">변경</button>
		</div>
	</form>
</div>
