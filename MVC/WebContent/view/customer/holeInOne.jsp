<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="./css/customer.css?after" />
<jsp:include page="/view/includes/header.jsp" /> 


</head>
<br>
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

	<article class="holeInOnePage">
		<h3>홀인원 보험</h3>
		<ul class=holeInOneBtn>

			<li><a href="https://www.kbinsure.co.kr/pop/CG205020008.ec"
				target=_blank>KB손해보험 'KB골프보험'</a></li>
			<li><a
				href="https://direct.samsungfire.com/mall/PP030801_001.html"
				target=_blank>삼성화재 '다이렉트 골프 보험'</a></li>
			<li><a
				href="https://direct.hi.co.kr/service.do?m=1e760af7b1&tagtype=9&_BT_tab=PRDD0008&inpath=MB"
				target=_blank>현대해상 ‘골프 보험’</a></li>
			<li><a
				href="https://dbinsure.co.kr/golf?JEHUSA_CD=C5403&utm_medium=cpc&utm_source=naver&utm_campaign=pc&utm_content=golf&utm_term=move"
				target=_blank>DB손해보험‘프로미 다이렉트 골프 보험’</a></li>
			<li><a href="https://www.lotteins.co.kr/index2.jsp"
				target=_blank>롯데손해보험 ‘홀인원 보험’</a></li>
		</ul>
	</article>
	<div id="footer" style="margin: 30% 0% 0% 0%">
	
	</div>
</body>
<jsp:include page="/view/includes/footer.jsp" /> 
</html>