<%@ page contentType="text/html; charset=UTF-8"%>
<head>
<link rel="stylesheet" type="text/css" href="./css/mypage.css" />

</head>
<script src="./js/jquery.js"></script>
<script>
function withdrawal_check(){
	if($.trim($('#del_pwd').val())==''){
		alert('비번을 입력하세요!');
		$('#del_pwd').val('').focus();
		return false;
}

	if($.trim($('#del_cont').val())==''){
		swal.fire('탈퇴 사유를 입력하세요!');
		$('#del_cont').val('').focus();
		return false;
}
	

}
</script>
<body>
	<div class="clear"></div>
	<div class="WithdrawalBody">
		<h3>계정삭제하기</h3>
		<form id="Withdrawal_Form" name="Withdrawal_Form" method="post"
			onsubmit="return withdrawal_check();" action="withdrawal_ok.do">
		<input type="hidden" id="${id }" name="${id }"/>
		<p class="deleteIdTxt01">계정 삭제 시 기존 수강권 및 활동 정보가 삭제됩니다. 단 작성하신 게시글 및 댓글은 삭제되지 않습니다. </p> 
		<p class="deleteIdTxt02"><strong>계정 삭제 사유</strong> </p> 
		<textarea id="del_cont" name="del_cont" 
		cols="30" rows="2" placeholder="계정 삭제 사유를 남겨주시면 보다 나은 서비스를 제공할 수 있도록 노력하는 golForYou가 되겠습니다."></textarea>
		<p class="deleteIdTxt02"><strong>계정 비밀번호</strong> </p> <input type="password" id="del_pwd" name="del_pwd">
		<hr/>
		<p class="deleteIdTxt02"><strong>정말로 계정을 삭제하시겠습니다? </strong></p> 
		<button type="button" id="btn_change_password" class="checkBtn" onClick='window.close()'>계속 사용하기</button>
		<button type="submit" id="RealByeButton" class="checkBtn">계정 삭제하기</button>
		</form>
	</div>
</body>


