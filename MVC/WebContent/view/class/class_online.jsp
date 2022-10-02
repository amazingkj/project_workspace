<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolforYou</title>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css" href="./css/class_main.css" />
</head>
<header>
	<jsp:include page="../includes/header.jsp" />
</header>
<body>
	<br />
	<div class="clear" style="margin-top: 135px"></div>
	<div>
		<h1 id="name-tag">온라인 클래스</h1>
	</div>
	<hr style="padding: 0.01px; background-color: grey; width: 88%; margin-left: 4%"/>
	<br />
	<div class="category">
		<ul class="province_1">
			<li></li>
			<li>다이아</li>
			<li>플레티넘</li>
			<li>골드</li>
			<li>실버</li>
			<li>브론즈</li>

		</ul>
	</div>
	<div class="subject">
		<button class="golf1" type="button"
			onClick="location.href='#'">
			<img src="images/class/1_1.jpg">
		    <h4 id="txt">이광용&nbsp;프로</h4>
      		<h3 id="txt">스포츠심리학 박사가 알려주는 골프멘탈</h3>
       		<h2 id="txt2">100,000원</h2>
		</button>
		<button class="golf1" type="button"
			onClick="location.href='#'">
			<img src="images/class/2_1.jpg">
			<h4 id="txt">김지인&nbsp;프로</h4>
         	<h3 id="txt">골프를 100프로 이기는 법</h3>
           	<h2 id="txt2">100,000원</h2>
		</button>
		<button class="golf1" type="button">
		<img src="images/class/3_1.jpg">
			<h4 id="txt">조소정&nbsp;프로</h4>
        	<h3 id="txt">비대면 원포인트 골프레슨</h3>
            <h2 id="txt2">16,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/4_1.jpg">
			<h4 id="txt">김민우&nbsp;프로</h4>
        	<h3 id="txt">골프 백돌이 지금 당장 20타 줄이는 핵심 비법책</h3>
        	<h2 id="txt2">50,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/5_1.jpg">
			<h4 id="txt">양희수&nbsp;프로</h4>
       		<h3 id="txt">골프 구술 시험 대비</h3>
        	<h2 id="txt2">49,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/6_1.jpg">
			 <h4 id="txt">김대호&nbsp;프로</h4>
        	 <h3 id="txt">당신의 골프를 분석하고, 최적화하는 프로그램</h3>
       		 <h2 id="txt2">100,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/7_1.jpg">
			<h4 id="txt">김종혁&nbsp;프로</h4>
       		<h3 id="txt">골프, 퍼팅 고수되는 법 VOD 드립니다.</h3>
        	<h2 id="txt2">50,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/8_1.jpg">
			<h4 id="txt">김동신&nbsp;프로</h4>
       		<h3 id="txt">골프 100타 깨는 방법을 속성으로 알려 드립니다.</h3>
        	<h2 id="txt2">30,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/9_1.jpg">
			<h4 id="txt">최문환&nbsp;프로</h4>
         	<h3 id="txt">골프 스윙원리와 핵심스윙스킬 VOD 드립니다.</h3>
         	<h2 id="txt2">50,000원</h2>
		</button>
		<button class="golf1" type="button">
			<img src="images/class/10_1.jpg">
			<h4 id="txt">신호철&nbsp;프로</h4>
        	<h3 id="txt">골프 코스 핵심전략 VOD 드립니다.</h3>
         	<h2 id="txt2">40,000원</h2>
		</button>


	</div>
	<div class="clear"></div>

	<script>
      function navigo() {
         const header = document.querySelector('header');
         const headerheight = header.clientHeight;
         document.addEventListener('scroll', onScroll, {
            passive : true
         });
         function onScroll() {
            const scrollposition = pageYOffset;
            const nav = document.querySelector('nav');
            if (headerheight <= scrollposition) {
               nav.classList.add('fix')
            } else {
               nav.classList.remove('fix');
            }
         }

      }
      navigo()
   </script>
	<div class="clear" style="margin-bottom: 50px"></div>

</body>
</html>
</body>
</html>