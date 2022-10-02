<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제가 완료되었습니다.</title>
</head>
<link rel="stylesheet" type="text/css" href="./css/class_pay_ok.css" />
<body>
	
	<div class="payok_box">

		<div id="payok_1">
			<img src="./images/class/success.png" height=110px width=110px
				style="margin-top: 38px">
			<div>
				<h2 style="margin-top: 30px">주문이 성공적으로 완료되었습니다</h2>
			</div>
		</div>
		<div id="memberbox_1_1">
			<ul>
				
				<li class="text_3"><h3>강의명</h3></li>
				<hr />
				<li class="text_2"><h3>기본항목</h3></li>
				<hr />
				<li class="text_2"><h3>레슨시간</h3></li>
				<hr />
				<li class="text_2"><h3>레슨횟수</h3></li>
				<hr />
				<li class="text_2"><h3>가격</h3></li>
				<hr />
				<li class="text_2"><h3>문의 사항</h3></li>
				<hr />
			</ul>
		</div>
		<div id="memberbox_1_2">
			<ul>


				<li class="memberbox_1_4"><c:out value="${data.c_title}" />
				</li>
				<hr class="memberbox_1_5">

				<li class="memberbox_1_3"><c:out value="${data.c_info}" /></li>
				<hr />


				<li class="memberbox_1_3"><c:out value="${data.c_time}" />분</li>
				<hr />
				<li class="memberbox_1_3"><c:out value="${data.c_count}" />회</li>
				<hr />
				<li class="memberbox_1_3"><c:out value="${data.c_price}" /></li>
				<hr />
				<li class="memberbox_1_3"></li>
				<hr />



			</ul>

		</div>
		<input type="button" id="submitBtn" value="메인페이지로"
			onclick="location='/MVC/index.do'">

	</div>

</body>
</html>

