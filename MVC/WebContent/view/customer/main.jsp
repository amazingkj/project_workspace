<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="./css/customer.css" />
<jsp:include page="/view/includes/header.jsp" /> 
<br>
<br>
</head>
<body>
		<div id="content" style="margin:200px 0px 0px 0px">
		<!-- left navigation -->
		<div class="left_navi">
			<h3>고객센터</h3>

			<dl class="sub_menu">
			
				<dd>
					<a href="customer_main.do">FAQ</a>
				</dd>
				<dd>
					<a href="customer_fnq.do">1:1문의</a>
				</dd>
				<dd>
					<a href="#">공지사항</a>
				</dd>
				<dd>
					<a href="customer_sitepolicy.do">환불규정</a>
				</dd>
				<dd>
					<a href="customer_holeinone.do">홀인원보험</a>
				</dd>
				
			</dl>


			<ul class="sub_menu_bt">

				<li class="callcenter">고객센터</li>
				<li class="callno">1588-0000(유료)</li>
				<li class="callcenter sub">평일 : 09:30~18:00</li>
				<li class="callcenter sub">(토, 일, 공휴일 휴무)</li>
			</ul>
		</div>
	</div>
	<!-- // left navigation -->


	<article class="cscenter">
		<h3>FAQ</h3>
		<!-- tab -->
		<ul class="tab_list">
			<li>랭킹 서비스</li>
			<li>골프장 예약 서비스</li>
			<li>클래스 결제</li>
			<li>회원정보 서비스</li>
			<li>사이트 이용 기타</li>

		</ul>
		<!-- //tab -->

		<h4>자주 묻는 질문</h4>
		<div class="qnaForm">
			<dl class="qnaOn">
				<dt class="ques">
					<span>비회원도 예약이 가능한가요?</span>
				</dt>

				<dd class="answer">
					<span>비회원 예약 절차는 아래와 같습니다.</span>
				</dd>
			</dl>

		</div>

	</article>
	<div id="footer" style="margin: 45% 0% 0% 0%">
		<%-- <jsp:include page="../include/foot.jsp" />--%>
	</div> 
</body>
<Br>

<div class="clear"></div>
</html>
 <jsp:include page="/view/includes/footer.jsp" /> 
