<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="./css/mypage.css" />
<jsp:include page="/view/includes/header.jsp" /> 
<script src="./js/jquery.js"></script>
<div class="clear"></div>
<Body>
<br>
<br>

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





<!-- mypage 본문-->
<div class="mypage">

<div> 
<div class="mypageMain">
		<div class="box">
			<img class="profileImg" src="./images/member/blank_profile.png">
		</div>
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			${id}님 로그인을 환영합니다.<br/>
			${id}님의 랭킹은 ___
			
			</c:if>
			</div>
</div>
<div class="mypageMain">
	
			<h2>신청한 강의</h2>
	
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			${id}님 로그인을 환영합니다.<br/>
			${id}님의 랭킹은 ___
			</c:if>
			</div>
</div>
<div class="mypageMain">
	
			<h2>랭킹</h2>
	
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			${id}님 로그인을 환영합니다.<br/>
			${id}님의 랭킹은 ___
			
			<div class="ind_prof">
			<strong id="ind_id">${id }</strong> 님은
			</div>
			<div class="ind_prof">
			<img id="tier_img" src="${tierURL }" alt="티어이미지">
			<strong style="font-color:red">${tierStr }</strong> 등급입니다
			</div>
			
			
			</c:if>
			</div>
</div>
<div class="mypageMain">
		
			<h2>예약 현황</h2>
	
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			${id}님 로그인을 환영합니다.<br/>
			${id}님의 랭킹은 ___
			
			</c:if>
			</div>
</div>
</div>

</div>
</Body>