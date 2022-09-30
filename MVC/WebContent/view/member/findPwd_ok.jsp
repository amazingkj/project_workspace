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


<body class="findPwd">

<div class="loginForm">
<H3>이메일 발송 완료</H3><br><br>
이메일이 발송되었습니다.
<a href="login.do"><br>로그인 하기</a>
</div>
</body>


