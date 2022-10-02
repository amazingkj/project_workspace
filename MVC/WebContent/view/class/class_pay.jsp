<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<link rel="stylesheet" type="text/css" href="./css/count2.css" />
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<link rel="stylesheet" type="text/css" href="./css/class_pay.css" />
<%@ include file="../../view/includes/header.jsp"%>

<body>
<form method="post" action="class_pay_ok.do?state=list&c_no=2">
	<%--사이드 -----------------------------------------%>
	<div class=side_a>
		<div class="side_box">
		
			<ul id="side">
				<li><h2>결제정보</h2></li>
				<li>주문 상품금액</li>
				<hr />
				<li>총 프로모션 할인금액</li>
				<hr />
				<li>총 쿠폰 할인금액</li>
				<hr />
				<li>총 보유금 사용</li>
				<hr />
				<li>총 배송비</li>
			</ul>
			<ul id="side2">
				<li><input type="text" value="${data.c_price}" name="c_price" size="6" readonly style="border:none; font-size:16px; width:70px;" ></li>
				<hr />
				<li>+0원</li>
				<hr />
				<li>+0원</li>
				<hr />
				<li>+0원</li>
				<hr />
				<li>+0원</li>
			</ul>
			<hr class="line"
				style="padding: 2px; background-color: grey; width: 85%; margin-left: 11%">
			<h2 id="price4" style="margin-left:10px;">&emsp;총 결제 금액 :</h2>
			<h2 id="price3"><c:out value="${data.c_price}"/></h2>
			<input type="submit" value="결제하기" class="pay_button">
			
		
		</div>
	</div>
	<%--사이드 ------------------------------------------%>
	<%--주문상품,장바구니,주문서작성,주문완료 -----------------%>

	<div class="order_list">
		<div id="order_list1">
			<h2>결제하기</h2>
		</div>
		<div id="order_list2">
			<h3>장바구니&emsp;▶&emsp;결제하기&emsp;▶&emsp;결제완료</h3>
		</div>
		<hr
			style="padding: 0.3px; background-color: grey; width: 100%; margin-left: -2%; margin-top: -12px;">
	</div>
	<%--주문상품,장바구니,주문서작성,주문완료 -----------------%>
	<div class="pdinfor">
		<div>
			<h3 id="pdinfor_1">상품정보</h3>
			<h4 id="pdinfor_2">판매
				금액&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; 수량
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;총 결제 금액</h4>
			<hr
				style="padding: 0.3px; background-color: grey; width: 100%; margin-left: -2%; margin-top: -12px;">

		</div>
	</div>
	<div class="pd">
		<div id="pd1">
			<img src="images/class/online01_01.jpg">
		</div>
		<div>
			<h3 id="pd2"><c:out value="${data.c_price}"/></h3>
			<h3 id="pd3">1개</h3>
			<h3 id="pd4"><c:out value="${data.c_price}"/></h3>
		</div>
		<div id="order_1">
			<h2><input type="text" value="${data.c_info}" name="c_info" readonly style="border:none; font-size:20px; font-weight:bold;"></h2>
			<ul>
				<li><h4>1회당 레슨시간(분):<input type="text" value="${data.c_time}" name="c_time" readonly style="border:none; text-align:right; font-size:16px;">분</h4></li>
				<li><h4>레슨 횟수: <input type="text" value="${data.c_count}" name="c_count" readonly style="border:none; text-align:right; font-size:16px;margin-left:60px;" >회</h4></li>
				<li><h4>강의실 제공 포함</h4></li>
			</ul>
			<hr
				style="padding: 0.3px; background-color: grey; width: 1400px;; margin-left: -80%; margin-top: 60px;">

		</div>
		<hr
			style="padding: 1px; background-color: grey; width: 103%; margin-left: -1%; margin-top: 480px;">
	</div>

	<div class="member_1">
		<h3 id="meeaa">주문고객 / 문의 정보</h3>
		<br />
		<div id="memberbox_1_1">
			<ul>
				<br />
				<li><h4>주문고객</h4></li>
				<br />
				<li><h4>받는 분</h4></li>
				<br />

				<li><h4>휴대폰</h4></li>
				<br />

				<li><h4>전화번호</h4></li>
				<br />

				<li><h4>문의 사항</h4></li>
			</ul>
		</div>
		<div id="memberbox_1_2">
			<ul>

				<li><INPUT id="text_1" TYPE="TEXT"></li>
				<hr />

				<li><INPUT class="text_1" TYPE="TEXT"></li>
				<hr />

				<li><INPUT class="text_1" TYPE="TEXT"></li>
				<hr />


				<li><INPUT class="text_1" TYPE="TEXT"></li>
				<hr />



				<li><textarea id="text_2" cols="57" rows="6"></textarea></li>
			</ul>
		</div>
	</div>
	<div class="box4">
		<br />
		<h3 id="c1">주문 상품 금액</h3>
		<h3 id="cc1">&emsp;<c:out value="${data.c_price}"/>&emsp;</h3>
		<h2 id="c2">+</h2>
		<h3 id="c3">총 배송비 0원</h3>
		<h2 id="c4">ㅡ</h2>
		<h3 id="c5">총 할인 금액 0원</h3>
		<h2 id="c6">=</h2>
		<h3 id="c7">총 주문 금액</h3>
		<h3 id="c8"><c:out value="${data.c_price}"/></h3>
	</div>
	</form>
</body>
</html>