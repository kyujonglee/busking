<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>	
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href="<c:url value='/test/test.do'/>">테스트 </a><br>
	<a href="<c:url value='/main/board/agency/list.do'/>">업체 등록게시판</a><br>
	<a href="<c:url value='/main/board/free/list.do'/>">자유게시판</a><br>
	<a href="<c:url value='/main/board/qna/list.do'/>">qna게시판리스트</a><br>
	<c:if test="${sessionScope.user eq null}">
		<a href="<c:url value='/main/member/loginform.do'/>">로그인</a><br>
	</c:if>
	<c:if test="${sessionScope.user ne null}">
		<p>${member.id}</p>
		<a id="logout" href="<c:url value='/main/member/logout.do'/>">로그아웃</a><br>
	</c:if>
	
	<script>
		$("#logout").click(function() {
			alert("로그아웃 하셨습니다.");
		});
	</script>
</body>
</html>