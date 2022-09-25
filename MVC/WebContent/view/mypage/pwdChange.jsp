<%@ page contentType="text/html; charset=UTF-8"%>

<head>
<link rel="stylesheet" type="text/css" href="./css/mypage.css" />

</head>
<script>
function chPw_check(){

	if($.trim($("#mem_password").val())==""){
		alert("현재 비밀번호를 입력하세요");
		$("#mem_password").val("").focus();
		return false;
	}

	if($.trim($("#new_mem_password").val())==""){
		alert("변경할 새 비밀번호을 입력하세요");
		$("#new_mem_password").val("").focus();
		return false;
	}
	
	if($.trim($("#new_mem_password_confirm").val())==""){
		alert("변경할 새 비밀번호를 한번 더 입력하세요");
		$("#new_mem_password_confirm").val("").focus();
		return false;
	}
	

	if($.trim($("#new_mem_password").val())!=$.trim($("#new_mem_password_confirm").val()){
		alert("새 비밀번호와 새 비밀번호 확인에 동일한 비밀번호를 입력해주세요");
		$("#new_mem_password").val("").focus();
		return false;
	}
	
}
</script>
<body><div class="clear"></div>
	<div class="popupBody">
		<h3>비밀번호 변경하기</h3>
		<form id="password_Form" name="password_form" method="post" action="changepwd_ok.do"
			onsubmit="return chPw_check();">
		
			<div class="inputBox">
				<label for="mem_password">현재 비밀번호</label>
				<input type="password" id="mem_password" name="mem_password"
					placeholder="********" autocomplete="on">
			</div>
			
			<div class="inputBox">
			<label for="new_mem_password">새 비밀번호</label>
				<input type="password" id="new_mem_password" name="new_mem_password"
					placeholder="********" autocomplete="on" minlength="8"
					maxlength="20">
			</div>
			
			<div class="inputBox">
			<label for="new_mem_password_confirm">새 비밀번호 확인</label>
				<input type="password" id="new_mem_password_confirm"
					name="new_mem_password_confirm" placeholder="********" autocomplete="on"
					minlength="8" maxlength="20">
			</div>
			<button type="submit" id="btn_change_password" class="checkBtn" >변경하기</button>
		</form>
	</div>


</body>


