<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<div class="clear"></div>
<html>
<head>

<%-- favicon --%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="apple-touch-icon" sizes="57x57" href="/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60" href="/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72" href="/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76" href="/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114" href="/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120" href="/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144" href="/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152" href="/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180" href="/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"  href="/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96" href="/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage" content="/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<%-- favicon 끝 --%>
<title></title>
</head>
<body class="login">
<script src="./js/jquery.js"></script>
<script>
   function login_check() {
      if ($.trim($('#id').val()) == '') {//trim()함수는 양쪽 공백을 제거
         alert('아이디를 입력하세요!');
         $('#id').val('').focus();
         return false;
      }

      if ($.trim($('#pw').val()) == '') {
         alert('비밀번호를 입력하세요!');
         $('#pw').val('').focus();
         return false;
         
      }
   }
</script>
<c:if test="${empty id}"> <%--id가 비어 있다면~ 로그인 전 화면 --%>
<div class="loginForm">
<form method="post" class="loginFormin" action="login_ok.do" onsubmit="return login_check();">
<input type="text" name="id" id="id" class="textField" placeholder="아이디"><br>
<input type="password" name="pw" id="pw" class="textField" placeholder="비밀번호"><br>
<input type=submit class="submitBtn" value=로그인>
<input type=checkbox name="maintainlogin" class="checkbox" value=로그인상태유지><span>로그인 상태 유지</span><br>
</form> 
<div class="links">
<input type="button" class="a" value="회원가입" onclick="location='join.do';" />
<input type="button" class="a" value="비밀번호 찾기" onclick="location='findPwd.do';" />
</div>
</div>
</c:if>

<c:if test="${!empty id}"> 
${id}님 로그인을 환영합니다.<br/>
<a href="logout.do">[로그아웃]</a>


<a href="board_list.do">[게시판]</a><br>
<a href="mypage.do">[마이페이지]</a><br>
<a href="customer_main.do">[고객센터]</a><br>
  </c:if>

</body>
</html>

