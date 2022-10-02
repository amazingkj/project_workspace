<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 클래스 상세페이지</title>
<script src="./js/jquery.js"></script>
<script src="./js/class_list.js"></script>
<link rel="stylesheet" type="text/css" href="./css/class_list.css" />
<jsp:include page="/view/includes/header.jsp" /> 
</head>
<body>
	<div id="header_body"></div>

	<%-- header와 footer를 제외한 전체 --%>
	<div id="wrap">
		<%-- wrap에서 윗부분 --%>
		<div class="section01">

			<%-- section01의 왼쪽(이미지) --%>
			<div class="left_side">
				<div class="image01">
					<img src="./images/1_2.jpg">
				</div>
			</div>

			<%-- section01의 오른쪽(상세내역) --%>
			<div class="right_side">
				<div class="category">골프 클래스</div>
				<div class="class_name">
					<p>답답한 연습장이 아닌 필드에서 모든 골프 레슨을 펼쳐 드립니다.</p>
				</div>

				<div class="tab_container">
					<!--탭 메뉴 영역 -->
					<div class="tabs">
						<ul>
							<li class="active"><a href="#" rel="tab1">STANDARD</a></li>
							<li><a href="#" rel="tab2">DELUXE</a></li>
							<li><a href="#" rel="tab3">PREMIUM</a></li>
						</ul>
					</div>
					<div id="tab1" class="tab_content">
						<br> <span class="price">640,000원</span> <span class="vat">(VAT
							포함가)</span> <br /> <br /> <span class="class-name">라운딩 골프 레슨 1회</span><br />
						<span class="curriculum">1. 라운딩 시작 1시간전 연습장 레슨<br /> 2.
							비디오 분석<br /> 3.라운딩 후 피드백<br /> 4. 연습방법 고지<br /> <br />
						</span> <span class="order"> 강의실 제공 포함<br /> 1회당 레슨시간 (분)<br />
							레슨 횟수<br />
						</span><br />

						<button class="btn01" type="button" onclick="">구매하기</button>

					</div>

					<div id="tab2" class="tab_content">
						<br> <span class="price">3,500,000원</span> <span class="vat">(VAT
							포함가)</span> <br /> <br /> <span class="class-name">라운딩 골프 레슨 5회</span><br />
						<span class="curriculum">1.STANDARD와 동일<br /> 2. 끝장 레슨 1회
							초대<br />(30만원 상당)<br />
						</span><br /> <span class="order"> 강의실 제공 포함<br /> 1회당 레슨시간 (분)<br />
							레슨 횟수<br />
						</span><br />

						<button class="btn01" type="button" onclick="">구매하기</button>

					</div>

					<div id="tab3" class="tab_content">
						<br> <span class="price">5,700,000원</span> <span class="vat">(VAT
							포함가)</span> <br /> <br /> <span class="class-name">라운딩 골프 레슨
							10회</span><br /> <span class="curriculum">1.STANDARD와 동일<br />
							2. 끝장 레슨 2회 무료 초대<br />(30만원 상당)<br />
						</span><br /> <span class="order"> 강의실 제공 포함<br /> 1회당 레슨시간 (분)<br />
							레슨 횟수<br />
						</span><br />

						<button class="btn01" type="button" onclick="">구매하기</button>

					</div>
				</div>
			</div>
		</div>

		<%-- wrap에서 아랫부분 --%>
		<div class="section02">

			<div class="tab_container">
				<!--탭 메뉴 영역 -->
				<div class="tabs">
					<ul>
						<li class="active"><a href="#" rel="tab4">클래스 설명</a></li>
						<li><a href="#" rel="tab5">가격 정책</a></li>
						<li><a href="#" rel="tab6">리뷰</a></li>
						<li><a href="#" rel="tab7">취소 및 환불 규정</a></li>
					</ul>
				</div>
				<div id="tab4" class="tab_content">
					<h4>
						<br /> <br />클래스 설명
					</h4>
					<br />
					<p>
						안녕하세요.<br />
						<br /> 필드 골프 레슨 전문기업 <strong>ROPAdeORO</strong>입니다.<br />
						<br /> 인도어에서 혹은 실내에서 많은 레슨이 이루어집니다.<br />
						<br /> 이것을 실전에 사용하려면 많은 시간과 노력이 필요합니다.<br />
						<br /> 그래서 저희는 체계적인 레슨 프로그램으로 필드에서 <br />
						<br /> 고객의 요구에 부합하는 레슨 서비스를 제공하고 있습니다.<br />
						<br />
						<br />
						<br /> 본 레슨 서비스는<br />
						<br /> 1. 라운딩 전 60~90분 인도어에서 레슨이 이루어집니다. 이 때 고객님께 필요한 부분을 체크합니다.<br />
						<br /> 2. 라운딩 레슨에서 꼭 필요한 부분을 정확한 설명과 응용방법으로 고객님의 실력 향상에 도움을 드립니다.<br />
						<br /> 3. 레슨이 끝난 후, 개개인의 연습장에서 어떻게 연습을 하여야 되는지 알려드립니다.<br />
						<br /> 4. 라운딩 중 레슨 동영상을 통해 다시 한 번 연습 방법을 찾을 수 있도록 보내드립니다.<br />
						<br /> 5. 레슨인원은 총 3명으로 필드에서 충분한 연습과 레슨이 이루어지도록 합니다. <br />
						<br />
						<br />
					</p>
					<hr />

					<h4>
						<br /> <br />의뢰인 준비사항
					</h4>
					<br />
					<p>
						- 본인 골프 클럽<br /> 1. 필드 레슨은 시작 4일 이후에는 취소가 되지 않습니다.<br /> 2. 우천 및
						천재 지변으로 인해 레슨이 불가할 경우 2주내 다시 진행합니다.<br /> 3. 18홀 레슨 중 중도 정지는 9홀
						단위로 계산합니다.
					</p>
				</div>

				<div id="tab5" class="tab_content">
				<h4>
					<br /> <br />가격 정책
				</h4> <br/>
				<div class=table>
				<table border=1>
				<tr>
				<td></td>
				<td>STANDARD</td>
				<td>DELUXE</td>
				<td>PREMIUM</td>
				</tr>
				<tr>
				<td>가격</td>
				<td>640,000원</td>
				<td>3,500,000원</td>
				<td>5,700,000원</td>
				</tr>
				<tr>
				<td>패키지 설명</td>
				<td>라운딩 골프 레슨 1회<br/><br/>
				1.라운딩 시작 1시간 전 연습장 레슨<br/>
				2.비디오 분석<br/>
				3.라운딩 후 피드백<br/>
				4.연습방법 고지
				</td>
				<td>라운딩 골프 레슨 5회<br/><br/>
				1.STANDARD와 동일<br/>
				2.끝장 레슨 1회 초대<br/>(30만원 상당)
				</td>
				<td>라운딩 골프 레슨 10회<br/><br/>
				1.STANDARD와 동일<br/>
				2.끝장 레슨 2회 무료 초대<br/>
				(60만원 상당)
				</td>
				</tr>
				<tr>
				<td>강의실 제공 포함</td>
				<td>✔</td>
				<td>✔</td>
				<td>✔</td>
				</tr>
				<tr>
				<td>1회당 레슨시간(분)</td>
				<td>360 분</td>
				<td>210 분</td>
				<td>420 분</td>
				</tr>
				<tr>
				<td>레슨 횟수</td>
				<td>1회</td>
				<td>5회</td>
				<td>10회</td>
				</tr>
				</table>
				</div>
				
				</div>
				<div id="tab6" class="tab_content">탭2</div>
				<div id="tab7" class="tab_content">
					<h4>
						<br /> <br />취소 및 환불 규정
					</h4>
					<br />
					<p>
						가. 레슨 환불기준 원칙<br /> 학원의 설립/운영 및 과외교습에 관한 법률 제 18조(교습비 등의 반환 등)<br />
						- 학원설립, 운영자, 교습자 및 개인과외교습자는 학습자가 수강을 계속할 수 없는 경우 또는 학원의 등록말소, 교습소
						폐지 등으로 교습을 계속할 수 없는 경우에는 학습자로부터 받은 교습비를 반환하는 등 학습자를 보호하기 위하여 필요한
						조치를 하여야 한다. <br /> <br /> 1. 레슨을 제공할 수 없거나, 레슨 장소를 제공할 수 없게 된 날
						: 이미 납부한 레슨비 등을 일한 계산한 금액 환불 <br /> <br /> 2. 레슨기간이 1개월 이내의 경우<br />
						- 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br /> - 총 레슨 시간의 1/3 경과전 : 이미 납부한
						레슨비의 2/3에 해당액 환불<br /> - 총 레슨 시간의 1/2 경과전 : 이미 납부한 레슨비용의 1/2에 해당액
						환불<br /> - 총 레슨시간의 1/2 경과후 : 반환하지 않음 <br /> <br /> 3.레슨 기간이
						1개월을 초과하는 경우 - 레슨 시작전 : 이미 납부한 레슨비 전액 환불<br /> - 레슨 시작후 : 반환사유가
						발생한 당해 월의 반환 대상 레슨비(레슨비 징수기간이 1개월 이내인 경우에 따라 산출된 수강료를 말한다)와 나머지 월의
						레슨비 전액을 합산한 금액 환불 <br /> <br /> * 총 레슨 시간의 레슨비 징수기간 중의 총레슨시간을
						말하며, 반환 금액의 산정은 반환 사유가 발생한 날까지 경과 된 레슨시간을 기준으로 함
					</p>
				</div>
			</div>
		</div>
	</div>
</body>
<br/>
<jsp:include page="/view/includes/footer.jsp" /> 
</html>