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
       	<c:forEach var="list" items="${followMember}">
       		${list.nickName}
       	</c:forEach>
    </div>
    <div class="tab-pane-follow1" id="follower" style="display: none;" >
		....2
    </div>
</div>

