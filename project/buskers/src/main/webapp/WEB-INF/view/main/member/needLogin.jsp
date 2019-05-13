<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<c:url value='/resources/css/common/sweetalert2.min.css'/>" />
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@8"></script>
<title>Insert title here</title>
</head>
<body>
<script>
/* window.alert("${msg}"); */
Swal.fire({
  title:'로그인후에 이용가능합니다',
  type:'info',
  timer: 2000
});
setTimeout(function(){
	window.location.href="/buskers/main/member/loginform.do";
},2000);
</script>
</body>
</html>