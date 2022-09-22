<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
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
<script src="./js/jquery.js"></script>
<script>
   function emailAuthentication() { //이메일 입력 유효검증 후, emailValCheck() 호출 후 결과값 확인,
	   //결과값이 true라면 새 창에 email정보를 get방식으로 전송
      if ($.trim($('#email').val()) == '') {
         alert('이메일을 입력하세요!');
         $('#email').val('').focus();
         return false;
      }
	
   /*
	if (!emailValCheck()){
    	 return false;
    	}
    var url = "confirmEmail.do?email=" + document.signUpForm.email.value;
    open(url, "confirm",
    "toolbar=no, location=no,menubar=no,scrollbars=no,resizable=no,width=300,height=200");
    }

    	  
      
   const form = document.signUpForm;  //const form : email을 포함하는 form의 위치
   
   function emailValCheck(){ //emailPattern : 이메일 정규식 패턴
		var emailPattern= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email = form.email.value;
		if(!check(emailPattern, email, "유효하지 않은 이메일 주소입니다.")) {
			return false; //check(pattern, target, message)를 호출하고 결과알림(새창)
		}
	    return true;
	}
   
  
   function check(pattern, target, message) { 
	   //target을 pattern으로 검사해서 유효하면 true
   	if(pattern.test(target)) {
       	return true;
       }
       alert(message);
       target.focus();
       return false;
   }
   */

</script>

<%-- 비밀번호 찾기--%>
<body class="findPwd">


<c:if test="${empty email}">

<div class="findPwdForm">

<div>
<H3>비밀번호 찾기</H3><br>
<span>계정에 연결된 이메일 주소를 입력하시면,<br>비밀번호를 변경할 수 있는 경로를<br>발송해드립니다.</span><br><br>
<hr/>
<br>
</div>

<div>
<form name="signUpForm" action="findPwd_ok.do" method="post" accept-charset="UTF-8">
<input type="email" name="email" class="textField" id="inputEmailForm" placeholder="example aaa@google.net"><br>
<button type="submit" id="btn_change_password" class="submitBtn" onclick="emailAuthentication()">인증메일 전송</button>
</form> 
</div>

</div>

</c:if>

<c:if test="${!empty email}">
<div class="findPwdForm">

<div>
<H3>인증번호 입력</H3><br>
<span>메일로 확인한 인증 번호를<br>입력하세요.</span><br><br>
<hr/>
<br>
</div>

<div>
<form name="signUpForm" action="findPwd_ok.do" method="post" accept-charset="UTF-8">
<input type="email" name="email" class="textField" id="inputEmailForm" placeholder="인증 번호"><br>
<button type="submit" id="btn_change_password" class="submitBtn" onclick="emailAuthentication()">인증번호 전송</button>
</form> 
</div>
</div>

</c:if>
</body>


