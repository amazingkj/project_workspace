<%@ page contentType="text/html; charset=UTF-8"%>
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<div class="clear"></div>
<style>

#wrap{
	clear:both;
	display:none; 
	margin: 0; auto;
	overflow: hidden;
}
.findPwd{
    display: flex;
    align-items: center;
    justify-content: center;
    background: url(./images/member/login3.png) no-repeat center center fixed; 
    -webkit-background-size: cover;
  	-moz-background-size: cover;
 	-o-background-size: cover;
 	background-size: cover;
	
}
.loginForm, .findPwdForm{
    width: 300px;
    background-color: #EEEFF1;
    margin:auto;
    padding: 20px;
    text-align: center;
    border: none;
	vertical-align: middle;
    align-items: center;
    justify-content: center;

	
}

</style>


<script>
   function check() {
      if ($.trim($('#email').val()) == '') {//trim()함수는 양쪽 공백을 제거
         alert('이메일을 입력하세요!');
         $('#id').val('').focus();
         return false;
      }
   }
</script>

<%-- 비밀번호 찾기--%>
<body class="findPwd">
<script src="./js/jquery.js"></script>
<div class="findPwdForm">

<div>
<H3>비밀번호 찾기</H3><br>
<span>계정에 연결된 이메일 주소를 입력하시면,<br>비밀번호를 변경할 수 있는 경로를<br>발송해드립니다.</span><br><br>
<hr/>
<br>
</div>

<div>
<form action="#" method=post>
<input type="email" name="email" class="textField" placeholder="example aaa@google.net"><br>
<button type="button" id="btn_change_password" class="submitBtn">인증메일 전송</button>
</form> 
</div>

</div>
</body>


