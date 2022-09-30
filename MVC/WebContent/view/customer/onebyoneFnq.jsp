<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/customer.css?after" />
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<jsp:include page="/view/includes/header.jsp" /> 
<div class="clear"></div>
<style>
#content {
	margin: 130px 0px 0px 0px;
	padding: 0;
}

li {
	list-style: none;
}
</style>


<script>
	function check() {
		if ($.trim($('#question_title').val()) == '') {
			alert('제목을 입력하세요!');
			$('#question_title').val('').focus();
			return false;
		}
	}

	function check() {
		if ($.trim($('#question_contents').val()) == '') {
			alert('내용을 입력해주세요');
			$('#question_contents').val('').focus();
			return false;
		}
	}

	function check() {
		if ($.trim($('#question_email').val()) == '') {
			alert('이메일을 꼭 입력해주세요');
			$('#question_email').val('').focus();
			return false;
		}
	}
</script>
<%--<jsp:include page="./include/header.jsp" /> --%>
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

	<%-- 1:1 문의--%>
	<div class="consultForm">
		<H3>1:1 문의하기</H3>
		<br>

		<ul class="consultMemo">

			<li>언제든 궁금하신 점을 남겨주세요. 고객센터 운영시간 내에 확인 후 최대한 빠르고 정확하게 답변 드리겠습니다.<br>
				(운영시간 : 오전 9:30 ~ 오후 6:00)
			</li>

			<li>답변은 고객센터 1:1문의 또는 회원가입 시 등록한 이메일을 통해 확인하실 수 있습니다.</li>

			<li>문의글 작성 후에는 수정, 삭제가 되지 않습니다.</li>

		</ul>

		<form id="qna_form" action="#" method=post>

			<dl class=consultQForm>

				<dt>문의 유형</dt>
				<dd>
					<select id="consult_type" name="consult_type" title="consult_type">
						<option value>문의유형을 선택해 주세요</option>
						<option value="101">골프장 예약</option>
						<option value="102">수강</option>
						<option value="103">결제</option>
						<option value="104">환불</option>
					</select>
				</dd>
				<dt>제목</dt>

				<dd>
					<input name="question_title" id="question_title" class="textField"
						placeholder="제목을 입력하세요."><br>
				</dd>

				<dt>내용</dt>

				<dd>
					<textarea name="question_contents" id="question_contents"
						class="textField" placeholder="내용을 입력하세요."></textarea>
				</dd>

				<dt>파일첨부</dt>

				<dd>
					<input type="file" name="question_file" id="question_file" /> <label
						for="question_file" class="file-upload-button">파일 등록</label> <span
						class="file-upload-button-text">*첨부파일 용량은 최대 5Mbyte입니다.</span>
				</dd>

				<dt>휴대폰</dt>

				<dd>
					<input name="phone01" id="phone01" size="5px"> - <input
						name="phone02" id="phone02" size="5px"> - <input
						name="phone03" id="phone03" size="5px">
				</dd>

				<dt>이메일</dt>

				<dd>
					<input type="email" name="question_email" id="question_email"
						class="textField" placeholder="aaa@google.net"> <span>*이메일로
						답변을 드립니다.</span>
				</dd>
				<div class="question_title"></div>
				<br>

				<div>
					<button type="reset" id="questionBtn" class="etcBtn">취소</button>
					<button type="submit" id="questionBtn2" class="submitBtn">확인</button>
				</div>


			</dl>
		</form>
	</div>
		<div id="footer" style="margin: 10% 0% 0% 0%">

	</div>
</body>
 <jsp:include page="/view/includes/footer.jsp" /> 

