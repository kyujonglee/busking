<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="<c:url value='/resources/css/main/miniprofile.css'/>" />
<header class="header">
	<div class="board_container">
		<div class="header-columns">
			<i class="fas fa-search fa-lg"></i> <input type="text"
				placeholder="search" />
		</div>
		<div class="header-columns">
			<span class="header__title">Buskers</span>
		</div>
		<div class="header-columns">
			<c:if test="${sessionScope.user eq null}">
				<span class="header__user">
						<a href="<c:url value='/main/member/loginform.do'/>">로그인</a><br>
				</span>
			</c:if>
			<c:if test="${sessionScope.user ne null}">
				<span class="header__user">
					<div class="header-a">
				        <div class="header-b1">
				        	<i class="fas fa-bell fa-lg"></i>
				        </div>
				        <div class="header-b2">
				        	${sessionScope.user.nickName} 님
				        </div>
				        <div class="header-b3">
				            <div class="header-c">
				                <a class="header-d" role="button" tabindex="0" title="계정: ${sessionScope.user.id}  (${sessionScope.user.email})" aria-expanded="true">
				                <span class="header-e" aria-hidden="true"></span>
				                </a>
				                <div class="header-f h-toggle"></div>
				                <div class="header-g h-toggle"></div>
				            </div>
				            <div class="header-h h-toggle" aria-label="계정 정보" aria-hidden="false" img-loaded="1">
				                <div class="header-i">
				                    <a class="header-i2" aria-label="프로필 사진 변경" href="#">
				                        <div class="header-i3" style="position:relative">
				                            <div class="header-i4" title="프로필"></div>
				                            <span class="header-i5">변경</span>
				                        </div>
				                    </a>
				                    <div class="header-i6">
				                        <div class="header-i7">${sessionScope.user.id}</div>
				                        <div class="header-i8">${sessionScope.user.email}</div>
				                        <div class="header-i9">
				                            <span>${sessionScope.user.nickName} 님 안녕하세요!</span>
				                        </div>
				                        <a class="header-i10" href="#">나의소셜 계정</a>
				                    </div>
				                </div>
				                <div class="header-j">
				                    <div>
				                        <a class="header-j2" href="#">마이 페이지</a>
				                    </div>
				                    <div>
				                        <a class="header-j3" id="logout" href="<c:url value='/main/member/logout.do'/>" target="_top">로그아웃</a>
				                    </div>
				                </div>
				            </div>
				        </div>
				    </div>
				</span>
			</c:if>
		</div>
	</div>
	<script>
        $(".header-c").click(function() {
            $(".h-toggle").toggle();
        });
    </script>
</header>