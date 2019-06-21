<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="<c:url value='/resources/css/main/sidebar.css'/>" />
<div class="page-wrapper chiller-theme">
	        <a id="show-sidebar" class="btn btn-sm btn-dark">
	            <i class="fas fa-bars"></i>
	        </a>
	        <nav id="sidebar" class="sidebar-wrapper">
	            <div class="sidebar-content">
	                <div class="sidebar-brand">
	                    <a href="<c:url value='/main/main.do'/>">Buskers</a>
	                    <div id="close-sidebar">
	                        <i class="fas fa-times"></i>
	                    </div>
	                </div>
	                <div class="sidebar-header">
	                    <div class="user-pic">
	                        <img class="profile_img" src="<c:url value='/file/download.do'/>?path=${sessionScope.user.profileImgPath}${sessionScope.user.profileImg}" onError="this.src='<c:url value='/resources/img/profile.png' />';" />
	                    </div>
	                    <div class="user-info">
	                        <span class="user-name">
	                            <strong>${sessionScope.user.id}</strong>
	                        </span>
	                        <span class="user-role">
	                        <c:if test="${sessionScope.user eq null}">
	                        	로그인이 필요합니다.
	                        </c:if>
	                        <c:if test="${sessionScope.user ne null}">
		                        <c:choose>
									<c:when test = "${sessionScope.user.isAdmin eq 'y'}">
										Administrator
									</c:when>
									<c:when test = "${sessionScope.user.isBusker eq 'y'}">
										Artist
									</c:when>
									<c:when test = "${sessionScope.user.isAgency eq 'y'}">
										Agency
									</c:when>
									<c:otherwise>
										Member
									</c:otherwise>
						        </c:choose>
					        </c:if>
							</span>
	                        <span class="user-status">
	                        <c:if test="${sessionScope.user ne null}">
	                            <i class="fa fa-circle"></i>
	                            <span>Online</span>
                            </c:if>
	                        <c:if test="${sessionScope.user eq null}">
	                            <i class="fa fa-circle side_offline"></i>
	                            <span>Offline</span>
                            </c:if>
	                        </span>
	                    </div>
	                </div>
	                <!-- sidebar-header  -->
	                
	                <div class="sidebar-search">
	                    <div>
	                        <div class="input-group">
		                        <form id="integrated_search" action="<c:url value='/main/search/search.do'/>" />
		                            <input type="text" name="input" class="form-control search-menu" placeholder="Search...">
		                            <div class="input-group-append">
		                                <span class="input-group-text">
		                                    <i class="fa fa-search" aria-hidden="true"></i>
		                                </span>
		                            </div>
	                            </form>
	                        </div>
	                    </div>
	                </div>
	                <!-- sidebar-search  -->
	                <div class="sidebar-menu">
	                    <ul>
	                        <li class="header-menu">
	                            <span>Artist Genre</span>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a>
	                                <i class="fas fa-street-view"></i>
	                                <span>Street Dance</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a>
	                                <i class="fas fa-microphone"></i>
	                                <span>Vocal</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a href="#">
	                                <i class="fas fa-theater-masks"></i>
	                                <span>Comedy</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a href="#">
	                                <i class="fas fa-guitar"></i>
	                                <span>Playing Instruments</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a href="#">
	                                <i class="fas fa-headphones"></i>
	                                <span>Magic Show</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a href="#">
	                                <i class="fas fa-hat-wizard"></i>
	                                <span>Hip hop</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="sidebar-dropdown">
	                            <a href="#">
	                                <i class="fas fa-ellipsis-h"></i>
	                                <span>etc</span>
	                            </a>
	                            <div class="sidebar-submenu">
	                                <ul>
	                                    <li>
	                                        <a href="#">Google maps</a>
	                                    </li>
	                                    <li>
	                                        <a href="#">Open street map</a>
	                                    </li>
	                                </ul>
	                            </div>
	                        </li>
	                        <li class="header-menu">
	                            <span>Statics</span>
	                        </li>
	                        <li>
	                            <a>
	                                <img src="<c:url value='/resources/img/online2.png'/>" alt="img">
	                                <span class="current_users">현재 접속한 회원 수</span>
	                                <span class="current_users_number"></span>
	                            </a>
	                        </li>
	                        <li>
                            	<a class="fas fa-users">
                               		<span>오늘 접속한 회원 수</span>
                               	</a>
	                        </li>
	                    </ul>
	                </div>
	                <!-- sidebar-menu  -->
	            </div>
	            <!-- sidebar-content  -->
	            <div class="sidebar-footer">
	                <a href="#">
	                    <i class="fa fa-bell"></i>
	                    <span class="badge badge-pill badge-warning notification alarm__count">3</span>
	                </a>
	                <a href="#">
	                    <i class="fa fa-envelope"></i>
	                    <span class="badge badge-pill badge-success notification message__count"></span>
	                </a>
	                <a href="#">
	                    <i class="fa fa-cog"></i>
	                </a>
	            </div>
	        </nav>
	    </div>