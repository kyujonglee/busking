<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="change_info_title">
	결제
</div>
<div class="change_info_title">
	<p>충전할 금액을 선택해주세요(카카오페이)</p>
</div>
<div class="pay_money">
	<select id="cash">
		<option>100</option>
		<option>1000</option>
		<option>5000</option>
		<option>10000</option>
		<option>50000</option>
		<option>100000</option>
	</select>
	<button type="button" id="cashButton" class="info_change_button">섬 충전</button>
</div>



<script src="<c:url value='/resources/js/main/member/pay.js'/>"></script>