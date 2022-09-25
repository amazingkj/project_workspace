<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/mypage.css" />
<jsp:include page="/view/includes/header.jsp" />
<script src="./js/jquery.js"></script>
<div class="clear"></div>
<br>



<%-- 마이페이지 - 회원 수정 페이지 --%>
<html>
<body id="profile">

	<div id="content" style="margin:200px 0px 0px 0px">
		<!-- left navigation -->
		<div class="left_navi">
			<h3>고객센터</h3>

			<dl class="sub_menu">
			
				<dd>
					<a href="mypage.do">홈</a>
				</dd>
				<dd>
					<a href="#">내 랭킹보기</a>
				</dd>
				<dd>
					<a href="#">수강내역</a>
				</dd>
				<dd>
					<a href="customer_fnq.do">1:1문의</a>
				</dd>
				<dd>
					<a href="profile.do">회원정보수정</a>
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




<div class="mypage">
	<div class="profileForm">
		<div class="box">
			<img class="profileImg" src="./images/member/blank_profile.png">
		</div>
		<div class="inputBoxVertical">
			<span>아이디</span><input type="text" name="id" class="textField"
				placeholder="본인 아이디 표시 될 것"><br>

			<div class="inputBoxVertical">
				<span>닉네임</span><input type="text" name="nickname" class="textField"
					placeholder="이메일"><br>
			</div>

			<div class="inputBoxVertical">
				<span>휴대폰 번호</span><input type="tel" name=tel class="textField"
					pattern="^[0][1][0]-\d{4}-\d{4}$"
					placeholder="휴대폰 번호를 입력해주세요"><br> <input
					type="button" name=button class="checkBtn" value="인증전송">
			</div>
			<div class="inputBoxVertical">
				<span>인증번호 입력</span><input type="tel" name=tel class="textField"><br>
				<input type="button" name=button class="checkBtn" value="인증하기">
			</div>

			<input type=submit class="submitBtn" value=회원정보수정>
			<div class="links">
				<a href="javascript:openPasswordPop();">비밀번호 변경하기</a> 
				<a href="javascript:openWithdrawalPop();">회원 탈퇴하기</a>

			</div>
		</div>
	</div>
	</div>
</body>
</html>

<script>

function openPasswordPop(){
	var w =window.screen.width/2 - 200;
	var h =window.screen.height/2 - 200;
	
    var url = "changepwd.do";
    var name = "pwdChangePop";
    var option = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=504, height=370, left="+w+",top="+h+""; 

    window.open(url, name, option);
}


function openWithdrawalPop(){
	var w =window.screen.width/2 - 200;
	var h =window.screen.height/2 - 200;
	  
    var url = "withdrawal.do";
    var name = "WithdrawalPop";
    var option = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no,width=600, height=508, left="+w+",top="+h+""; 

    window.open(url, name, option);
}


</script>




