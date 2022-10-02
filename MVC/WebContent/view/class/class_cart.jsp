<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 클래스 - 장바구니</title>
<script src="./js/jquery.js"></script>
<script src="./js/class_cart.js"></script>
<link rel="stylesheet" type="text/css" href="./css/class_cart.css" />
<body>
	<div id="header">
	<h1>헤더입니다</h1>
	</div>

	<%-- header와 footer를 제외한 전체 --%>
	<div id="wrap">
		<%-- 윗부분 --%>
		<div class="cart_wrap">
			<div class="cart">장바구니</div>
			<div class="cart_process"><strong>장바구니</strong>&emsp;>&emsp;결제하기&emsp;>&emsp;결제완료</div>
		</div>
		
		<%-- 아래 왼쪽 주문 정보 박스 --%>
		<div id ="order_wrap">
		
		
		</div>
		
		<%-- 아래 오른쪽 bill 박스 --%>
		<div id="bill_wrap">
		
		</div>
	</div>
</body>
</html>