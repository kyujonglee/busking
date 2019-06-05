<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="post" enctype="multipart/form-data"
	action="<c:url value="/file/music-upload.do" />">
	<input type="hidden" name="buskerName" value="">
	title : <input type="text" name="title"><br>
	writer : <input type="text" name="writer"><br>
	time : <input type="text" name="time"><br>
	<input type="file" name="attach"><br>
<!-- 	<input type="text" name="buskerNo" value=""><br> -->
	<button>업로드 </button>
</form>

<marquee behavior="scroll" direction="left">shit</marquee>