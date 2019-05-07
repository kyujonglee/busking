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
	<a href="<c:url value='/main/board/agency/agency_list.do'/>">업체등록게시판</a><br>
	<a href="<c:url value='/main/board/free/list.do'/>">자유게시판</a><br>
	<a href="<c:url value='/main/board/qna/qnaboardwrite.do'/>">qna게시판</a><br>
</body>
</html>