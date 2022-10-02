<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프 클래스 상세페이지</title>
<script src="./js/jquery.js"></script>
<script src="./js/class_list.js"></script>
<script src="https://kit.fontawesome.com/7e87ecac1e.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="./css/class_list.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<%@ include file="../../view/includes/header.jsp"%>

</head>
<body>
	<div id="header_body" style="width: 100%;"></div>


	<%-- header와 footer를 제외한 전체 --%>
	<div id="wrap">
		<%-- wrap에서 윗부분 --%>
		<div class="section01">

			<%-- section01의 왼쪽(이미지) --%>
			<div class="left_side">
				<div class="image01">
					<img src="<c:out value="${data.c_image}"/>">
				</div>
			</div>

			<%-- section01의 오른쪽(상세내역) --%>
			<div class="right_side">
				<div class="category">골프 클래스</div>
				<form>
					<div class="class_name">
						<p>
							<c:out value="${data.c_title}" />
						</p>
						<%-- request.setAttribute로 담은 이름의 컬럼명으로 데이터를 뿌림. --%>
					</div>
					<div class="tab_container">
						<div class="tabs">
							<ul>
								<li class="active"><a href="#" rel="tab1">STANDARD</a></li>
								<li><a href="#" rel="tab2">DELUXE</a></li>
								<li><a href="#" rel="tab3">PREMIUM</a></li>
							</ul>
						</div>
						<div id="tab1" class="tab_content">
							<br>
							<div class="price">
								<span class="totalPrice"><c:out value="${data.c_price}" /></span>
								<span class="vat">(VAT 포함가)</span><br /> <br />
							</div>
							<div class="class_detail">
								<div class="class_info">
									<c:out value="${data.c_info}" />
								</div>
								<div class="class_desc">
									<p>${enter}</p>
								</div>
							</div>
							<div class="class_detail2">
								<div class="detail_group">
									<div class="detail_left">강의실 제공 포함</div>
									<div class="detail_right">✔</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">1회당 레슨 시간(분)</div>
									<div class="detail_right">360분</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">레슨 횟수</div>
									<div class="detail_right">1회</div>
								</div>

							</div>
							<button class="btn01" type="button" onclick="">장바구니</button>
							<button class="btn02" type="button"
								onclick="location.href='class_list.do?state=pay&c_no=2'">바로
								결제</button>
						</div>

						<div id="tab2" class="tab_content">
							<br>
							<div class="price">
								<span class="totalPrice">3,500,000원</span> <span class="vat">(VAT
									포함가)</span><br /> <br />
							</div>
							<div class="class_detail">
								<div class="class_info">라운딩 골프 레슨 5회</div>
								<div class="class_desc">
									<p>
										1. STANDARD와 동일<br /> 2. 끝장 레슨 1회 초대<br /> (30만원 상당)
									</p>
								</div>
							</div>
							<div class="class_detail2">
								<div class="detail_group">
									<div class="detail_left">강의실 제공 포함</div>
									<div class="detail_right">✔</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">1회당 레슨 시간(분)</div>
									<div class="detail_right">210분</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">레슨 횟수</div>
									<div class="detail_right">5회</div>
								</div>

							</div>
							<button class="btn01" type="button" onclick="">장바구니</button>
							<button class="btn02" type="button"
								onclick="location.href='class_list.do?state=pay&c_no=2'">바로
								결제</button>
						</div>

						<div id="tab3" class="tab_content">
							<br>
							<div class="price">
								<span class="totalPrice">5,700,000원</span> <span class="vat">(VAT
									포함가)</span><br /> <br />
							</div>
							<div class="class_detail">
								<div class="class_info">라운딩 골프 레슨 10회</div>
								<div class="class_desc">
									<p>
										1. STANDARD와 동일<br /> 2. 끝장레슨 2회 무료 초대<br /> (60만원 상당)
									</p>
								</div>
							</div>
							<div class="class_detail2">
								<div class="detail_group">
									<div class="detail_left">강의실 제공 포함</div>
									<div class="detail_right">✔</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">1회당 레슨 시간(분)</div>
									<div class="detail_right">420분</div>
								</div>
								<div class="detail_group">
									<div class="detail_left">레슨 횟수</div>
									<div class="detail_right">10회</div>
								</div>

							</div>
							<button class="btn01" type="button" onclick="">장바구니</button>
							<button class="btn02" type="button"
								onclick="location.href='class_list.do?state=pay&c_no=2'">바로
								결제</button>
						</div>
					</div>
				</form>
			</div>
		</div>


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
					<div class="tab4_left">
						<h4>
							<br /> <br />클래스 설명
						</h4>
						<br />
						<p>
							안녕하세요.<br /> <br /> 필드 골프 레슨 전문 <strong><c:out
									value="${data.c_teacher}" /> 프로</strong>입니다.<br /> <br /> 인도어에서 혹은
							실내에서 많은 레슨이 이루어집니다.<br /> <br /> 이것을 실전에 사용하려면 많은 시간과 노력이
							필요합니다.<br /> <br /> 그래서 저희는 체계적인 레슨 프로그램으로 필드에서 <br /> <br />
							고객의 요구에 부합하는 레슨 서비스를 제공하고 있습니다.<br /> <br /> <br /> <br /> 본
							레슨 서비스는<br /> <br /> 1. 라운딩 전 60~90분 인도어에서 레슨이 이루어집니다. 이 때 고객님께
							필요한 부분을 체크합니다.<br /> <br /> 2. 라운딩 레슨에서 꼭 필요한 부분을 정확한 설명과
							응용방법으로 고객님의 실력 향상에 도움을 드립니다.<br /> <br /> 3. 레슨이 끝난 후, 개개인의
							연습장에서 어떻게 연습을 하여야 되는지 알려드립니다.<br /> <br /> 4. 라운딩 중 레슨 동영상을 통해
							다시 한 번 연습 방법을 찾을 수 있도록 보내드립니다.<br /> <br /> 5. 레슨인원은 총 3명으로
							필드에서 충분한 연습과 레슨이 이루어지도록 합니다. <br /> <br /> <br />
						</p>

						<h4>
							<br /> <br />의뢰인 준비사항
						</h4>
						<br />
						<p>
							- 본인 골프 클럽<br /> 1. 필드 레슨은 시작 4일 이후에는 취소가 되지 않습니다.<br /> 2. 우천
							및 천재 지변으로 인해 레슨이 불가할 경우 2주내 다시 진행합니다.<br /> 3. 18홀 레슨 중 중도 정지는
							9홀 단위로 계산합니다.
						</p>
					</div>
					<div class="tab4_right">
						<div class="notice">
							<div class="warning">
								<img src="images/class/warning.png" />
							</div>
							<div class="warning2">서비스 제공이 완료된 이후에 전문가에게 결제 대금이 전달됩니다.</div>
						</div>
						<div class="class_teacher">
							<div class="teacher_name">
								<span><c:out value="${data.c_teacher}" />&nbsp;프로</span>
							</div>
							<div class="teacher_career">
								<div class="introduce">
									<span>소개</span>
								</div>
								<div class="introduce_detail">
									<p>
										<c:out value="${data.c_career}" />
									</p>
									<div class="phone">전화번호</div>
									<div class="phone_detail">
										<p>
											<c:out value="${data.c_phone}" />
										</p>
									</div>
									<div class="address">지역</div>

									<div class="address_detail">
										<p>
											<c:out value="${data.c_addr}" />
										</p>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>

				<div id="tab5" class="tab_content">
					<h4>
						<br /> <br />가격 정책
					</h4>
					<br />

					<div class="table_price">
						<div class="detail1">
							<div class="detail1_1"></div>
							<div class="detail_vertical">
								<div class="standard1">STANDARD</div>
								<div class="standard2">
									<c:out value="${data.c_price}" />
								</div>
							</div>
							<div class="detail_vertical">
								<div class="deluxe1">DELUXE</div>
								<div class="deluxe2">3,500,000원</div>
							</div>
							<div class="detail_vertical">
								<div class="premium1">PREMIUM</div>
								<div class="premium2">5,700,000원</div>
							</div>
						</div>
						<div class="detail2">
							<div class="detail2_1">패키지 설명</div>
							<div class="detail_vertical">
								<div class="standard_info">
									<c:out value="${data.c_info}" />
								</div>
								<div class="standard_desc">
									<p>${enter}</p>
								</div>
							</div>
							<div class="detail_vertical">
								<div class="deluxe_info">라운딩 골프 레슨 5회</div>
								<div class="deluxe_desc">
									<p>
										1. STANDARD와 동일<br /> 2. 끝장 레슨 1회 초대<br /> (30만원 상당)
									</p>
								</div>
							</div>
							<div class="detail_vertical">
								<div class="premium_info">라운딩 골프 레슨 10회</div>
								<div class="premium_desc">
									<p>
										1. STANDARD와 동일<br /> 2. 끝장 레슨 2회 초대<br /> (60만원 상당)
									</p>
								</div>
							</div>
						</div>
						<div class="detail3">
							<div class="detail3_1">강의실 제공 포함</div>
							<div class="detail_vertical">✔</div>
							<div class="detail_vertical">✔</div>
							<div class="detail_vertical">✔</div>
						</div>
						<div class="detail4">
							<div class="detail4_1">1회당 레슨시간(분)</div>
							<div class="detail_vertical">
								<c:out value="${data.c_time}" />
								&nbsp;분
							</div>
							<div class="detail_vertical">210&nbsp;분</div>
							<div class="detail_vertical">420&nbsp;분</div>
						</div>
						<div class="detail5">
							<div class="detail5_1">레슨 횟수</div>
							<div class="detail_vertical">
								<c:out value="${data.c_count}" />
								&nbsp;회
							</div>
							<div class="detail_vertical">5&nbsp;회</div>
							<div class="detail_vertical">10&nbsp;회</div>
						</div>
					</div>
				</div>

				<div id="tab6" class="tab_content">
					<h4>
						<br /> <br />클래스 리뷰
					</h4>
					<br />
					<div class="class_review">
						<div class="class_stars">
							<i class="fa-solid fa-star"
								style="color: #56F569; font-size: 3em;"></i> <i
								class="fa-solid fa-star" style="color: #56F569; font-size: 3em;"></i>
							<i class="fa-solid fa-star"
								style="color: #56F569; font-size: 3em;"></i> <i
								class="fa-solid fa-star" style="color: #56F569; font-size: 3em;"></i>
							<i class="fa-solid fa-star"
								style="color: #56F569; font-size: 3em;"></i>
						</div>
						<div class="class_points">
							<span class="points">5.0</span>&nbsp;<span class="counts">|
								5개의 평가</span>
						</div>
						<div class="hr">
							<hr />
						</div>
					</div>
				</div>

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
<div style="margin: 200px 0px 0px 0px;"></div>
<jsp:include page="/view/includes/footer.jsp" />
</html>

