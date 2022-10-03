<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>예약완료</title>
</head>
<style>

@font-face {
	font-family: 'Noto Sans KR';
	font-style: normal;
	
	font-weight: 900;
	src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2)
		format('woff2'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff)
		format('woff'),
		url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf)
		format('opentype');
}
/*전체 범위*/
* {
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0px;
	padding: 10px;
}
#text{
 font-size:25px;
 font-family:15px;
 text-align:center;
 margin-top:100px;
 
 
}
.y_btn{
 background-color:#56F569;
 margin-top:80px;
 font-size:20px;
cursor:pointer;
border: 1px solid gray;
padding: 5px 45px;
  border: none;
}
</style>

<body>
<div id=text>예약이 성공적으로<br/> 완료되었습니다</div>
	<div style=" text-align: center;">
	<button style=" display: inline-block;" class="y_btn"onclick="self.close()">확인</button>
</div>
</body>
</html>