<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<jsp:include page="/view/includes/header.jsp" /> 
</header>



<body>
   <br />
   <div class="clear" style="margin-top: 135px"></div>
   <div>
      <h1 id="name-tag">골프 클래스</h1>

   </div>
   <hr style="padding: 0.01px; background-color: grey; width: 88%; margin-left: 4%"/>
  
   <br/>
   <div class="category">
      <ul class="province_1">
         <li><a href="ranking.do">전체</a></li>
         <li>서울・경기・인천
            <ul class="province_2" id="province_2">
               <li><i class="fas fa-map-marker-alt"></i><a
                  href="#"> 서울</a></li>
               <li><i class="fas fa-map-marker-alt"></i><a
                  href="#"> 경기</a></li>
               <li><i class="fas fa-map-marker-alt"></i><a
                  href="#"> 인천</a></li>
            </ul>
         </li>
         <li>강원도
            <ul class="province_2" id="province_2">
               <li><i class="fas fa-map-marker-alt"></i> 강릉</li>
               <li><i class="fas fa-map-marker-alt"></i> 원주</li>
               <li><i class="fas fa-map-marker-alt"></i> 춘천</li>
            </ul>
         </li>
         <li>충청도・대전・세종
            <ul class="province_2" id="province_2">
               <li><i class="fas fa-map-marker-alt"></i> 충청도</li>
               <li><i class="fas fa-map-marker-alt"></i> 대전</li>
               <li><i class="fas fa-map-marker-alt"></i> 세종</li>
            </ul>
         </li>
         <li>전라도・광주
            <ul class="province_2" id="province_2">
               <li><i class="fas fa-map-marker-alt"></i> 전라북도</li>
               <li><i class="fas fa-map-marker-alt"></i> 전라남도</li>
               <li><i class="fas fa-map-marker-alt"></i> 광주</li>
            </ul>
         </li>
         <li>경상도・부산・대구・울산
            <ul class="province_2" id="province_2">
               <li><i class="fas fa-map-marker-alt"></i> 경상도</li>
               <li><i class="fas fa-map-marker-alt"></i> 부산</li>
               <li><i class="fas fa-map-marker-alt"></i> 대구</li>
            </ul>
         </li>
         <li>제주도</li>
      </ul>
   </div>
   <div class="subject">
      <button class="golf1" type="button"
         onClick="location.href='class_list.do?state=list&c_no=2'">
         <img src="images/class/online01_01.jpg">
         <h4 id="txt"><c:out value="${data.c_teacher}"/>&nbsp;프로</h4>
         <h3 id="txt"><c:out value="${data.c_title}"/></h3>
         <h2 id="txt2"><c:out value="${data.c_price}"/></h2>
      </button>
      <button class="golf1" type="button"
         onClick="location.href='#'">
         <img src="images/class/online02_01.jpg">
         <h4 id="txt">김지인&nbsp;프로</h4>
         <h3 id="txt">골프 스쿨 12기 1학기 6개월 과정 90대를 보장해 드립니다.</h3>
         <h2 id="txt2">5,700,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online03_01.jpg">
         <h4 id="txt">조소정&nbsp;프로</h4>
         <h3 id="txt">여의도 개인레슨 전문 프로의 SECRET 골프 레슨을 드립니다.</h3>
         <h2 id="txt2">7,200,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online04_01.jpg">
         <h4 id="txt">김민우&nbsp;프로</h4>
         <h3 id="txt">비즈니스 골프 단기속성 A부터 Z까지 가르쳐드립니다.</h3>
         <h2 id="txt2">3,000,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online05_01.jpg">
         <h4 id="txt">양희수&nbsp;프로</h4>
         <h3 id="txt">실력 상승이 멈춘 독학 골퍼를 위한 원포인트 레슨</h3>
         <h2 id="txt2">4,900,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online06_01.jpg">
         <h4 id="txt">김대호&nbsp;프로</h4>
         <h3 id="txt">스윙 점검부터 필드 적용까지 봐드립니다.</h3>
         <h2 id="txt2">1,300,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online07_01.jpg">
         <h4 id="txt">윤성룡&nbsp;프로</h4>
         <h3 id="txt">겨울 골프 프로모션 드립니다.</h3>
         <h2 id="txt2">2,200,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online08_01.jpg">
         <h4 id="txt">김동신&nbsp;프로</h4>
         <h3 id="txt">골프가 어렵다구요? 제가 쉽게 만들어 드립니다.</h3>
         <h2 id="txt2">3,500,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online09_01.jpg">
         <h4 id="txt">최문환&nbsp;프로</h4>
         <h3 id="txt">실질적 경기력 향상으로 골프에 새로운 재미를 드립니다.</h3>
         <h2 id="txt2">10,000,000원</h2>
      </button>
      <button class="golf1" type="button">
         <img src="images/class/online10_01.jpg">
         <h4 id="txt">신호철&nbsp;프로</h4>
         <h3 id="txt">골프 스코어 10타 줄이는 것 쉽습니다.</h3>
         <h2 id="txt2">4,500,000원</h2>
      </button>


   </div>
   <div class="clear" style="margin:200px 0px 0px 0px "></div>

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
   <div class="clear" ></div>
<br><br>
</body>
<jsp:include page="/view/includes/footer.jsp" /> 
</html>