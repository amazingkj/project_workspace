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
			<h3>마이페이지</h3>

			<dl class="sub_menu">
			
				<dd>
					<a href="mypage.do">홈</a>
				</dd>
				<dd>
					<a href="indivrank.do">내 랭킹보기</a>
				</dd>
				<dd>
					<a href="class_main.do">수강내역</a>
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
		
			<c:if test="${!empty profile}"> 
		<div class="box">
			<img id="image_section" class="profileImg" src="./upload/member${profile}" alt=""/>
			
		</div>
			</c:if>
			
		<c:if test="${empty profile}"> 
		<div class="box">
			<img id="image_section" class="profileImg" src="./images/member/blank_profile.png" alt=""/>
			
		</div>
			</c:if>
		
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			<strong>${id}</strong>님 로그인을 환영합니다.<br/>
			<strong>${id}</strong>님의 주요 이용지역은 <strong>${m_addr}</strong> 입니다. <br/>
			 <br/>
			<a href="profile.do">회원정보 변경하기</a>
			
			</c:if>
			</div>
</div>
<div class="mypageMain">
	
			<h2>수강중인 강의</h2>
	
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			<strong>${id}</strong>님 수강중인 강의가 없습니다. <br/>
		
			</c:if>
			</div>
</div>
<div class="mypageMain">
	
			<h2>랭킹</h2>
	
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			
			<div class="ind_prof">
			<strong id="ind_id">${id }</strong> 님은
			</div>
			<div class="ind_prof">
			<img id="tier_img" src="${tierURL }" alt="티어이미지" width="25" height="25" />
			<strong style="font-color:red">${tierStr }</strong> 등급입니다
			</div>
			
			
			</c:if>
			</div>
</div>
<div class="mypageMain">
		
			<h2>예약 현황</h2>
	
		<div class="inputBoxVertical" style="width:500px"  >
			<c:if test="${!empty id}"> 
			예약하신 내역이 없습니다.
			
			</c:if>
			</div>
</div>
</div>

</div>
<br>
<br>
<br>
</Body>

