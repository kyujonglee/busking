<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="category-wapper">
	<ul class="category__ul">
		<li class="category__tab">
			<a class="current" onclick="tab_menu_follow(0);" >팔로우 ${followCount}</a>
		</li>
		<li class="category__tab">
			<a class="" onclick="tab_menu_follow(1);" >팔로워 ${followerCount}</a>
		</li>
	</ul>
</div>
<div class="profile_content">
    <div class="tab-pane-follow0" id="follow" style="display: block;">
    	<ul class="follow__list">
	       	<c:forEach var="list" items="${followMember}">
       			<li class="follow__list__items" value="${list.memberNo},${list.buskerNo}" >
       				<div class="follow__cancel__div">
       					<button class="follow__cancel">
       						<span aria-hidden="true">&times;</span>
       					</button>
       				</div>
       				<a href="<c:url value='/artist/main/main.do?buskerNo='/>${list.buskerNo}">
       					<img class="follow__list__img" src="<c:url value='/file/download.do'/>?path=${list.profileImgPath}${list.profileImg}" title="프로필" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
       				</a>
       				<div class="follow__list__nickName">
       					<a href="<c:url value='/artist/main/main.do?buskerNo='/>${list.buskerNo}">
	       					<span>${list.activityName}</span>
	       				</a>
       				</div>
       			</li>
    	   	</c:forEach>
    	</ul>
    </div>
    <div class="tab-pane-follow1" id="follower" style="display: none;" >
    	<ul class="follow__list">
			<c:forEach var="list" items="${followerMember}">
       			<li class="follow__list__items" >
       				<div class="follow__cancel__div">
       				</div>
       				<c:if test="${list.activityName eq null}">
	       				<a class="follow_list_noneBuskerNo">
	       					<img class="follow__list__img" src="<c:url value='/file/download.do'/>?path=${list.profileImgPath}${list.profileImg}" title="프로필" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
	       				</a>
       				</c:if>
       				<c:if test="${list.activityName ne null}">
	       				<a href="<c:url value='/artist/main/main.do?buskerNo='/>${list.followerBuskerNo}">
	       					<img class="follow__list__img" src="<c:url value='/file/download.do'/>?path=${list.profileImgPath}${list.profileImg}" title="프로필" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
	       				</a>
       				</c:if>
       				<div class="follow__list__nickName">
       					<c:if test="${list.activityName eq null}">
       						<a class="follow_list_noneBuskerNo">
	       						<span>${list.nickName}</span>
	       					</a>
	       				</c:if>
	       				<c:if test="${list.activityName ne null}">
	       					<a href="<c:url value='/artist/main/main.do?buskerNo='/>${list.followerBuskerNo}">
	       						<span>${list.activityName}</span>
	       					</a>
	       				</c:if>
       				</div>
       			</li>
    	   	</c:forEach>
    	</ul>
    </div>
</div>

