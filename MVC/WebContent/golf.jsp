<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet" type="text/css" href="./css/main.css" />
<link rel="stylesheet" type="text/css" href="./css/footer.css" />
</head>

<body>

  <header> 
    <div id="login"><a href="#" class=btn>로그인</a>  <a href="#" class=btn>회원가입</a></div>
    <div class="clear"></div>  
    
     
    <%-- 회사로고 --%>
    <div id="logo"><a href="golf.jsp"><img src="./images/logo1.png"
    width="90" height="90" alt="Golf" /></a></div>
   
   <div class="clear"></div>  
     <%--상단 메뉴 --%>

     <div class="clear"></div>  
     <%--메인 본문 이미지 --%>
     
     <div id="banner">
     <img src="./images/3.png" class="prev"  alt="slide" width="60px" height="80px" onclick=" btn_m()">
     <img src="./images/main0.jpg" id="mainImage"  alt="slide" width="100%" height="900" >
	 <img src="./images/1.png" class="next"  alt="slide" width="60px" height="80px" onclick=" btn_s()">
	 </div>


       <nav>
     <ul>
      <li><a href="#"class=btn1>랭킹</a>
       <ul>
       <li><a href="#">개인기록</a></li>
       <li><a href="#">전체기록</a></li>
       </ul>
       </li>
      <li><a href="#"class=btn1>게시판</a>
       <ul>
       <li><a href="#">공지사항</a></li>
       <li><a href="#">팁공유게시판</a></li>
        <li><a href="#">자유게시판</a></li>
       </ul>
       </li>
      <li><a href="#"class=btn1>장소검색</a>
       <ul>
       <li><a href="#">골프연습장</a></li>
       <li><a href="./jsp/golf_01.jsp">필드</a></li>
       </ul>
       </li>
      <li><a href="#"class=btn1>클래스</a>
       <ul>
       <li><a href="#">수강신청</a></li>
       <li><a href="#">결제</a></li>
       </ul>
       </li>
      <li><a href="#"class=btn1>문의</a>
       <ul>
       <li><a href="#">1:1</a></li>
       <li><a href="#">홀인원 보험</a></li>
       </ul>
       </li>
     </ul>
    </nav>

<script>
   var myImage = document.getElementById("mainImage");
   var imageArray = [ "./images/main0.png",
         "./images/main1.png", "./images/main2.png" , "./images//main3.png" ];
   var imageIndex = 0;

   function changeImage() {
      myImage.setAttribute("src", imageArray[imageIndex]);
      imageIndex++;
      if (imageIndex >= imageArray.length) {
         imageIndex = 0;
   }   
   }
   function btn_s(){
	  myImage.setAttribute("src", imageArray[imageIndex]);
 	  imageIndex++;
 	  if (imageIndex >= imageArray.length) {
         imageIndex = 0;
 	  }
   }
   function btn_m(){
	   myImage.setAttribute("src", imageArray[imageIndex]);
	 	  imageIndex--;
  if( imageIndex<0){
		 imageIndex = 3;
	  }
   }
   setInterval(changeImage, 3000);
</script>
</header>


<footer>
<div id="foot_main">
<div id="foot_menu">
<ul>
<li>FOR YOU</li>
<li>GolForYou</li>
<li>SOCIAL</li>
</ul>
</div>

<div id="menu_bottom1">
<ul>
<li>고객센터</li>
<li>김캐디홈페이지</li>
</ul>
</div>

<div id="menu_bottom2">
<ul>
<li>채용안내</li>
<li>골프장안내</li>
</ul>
</div>

<div id="menu_bottom3">
<ul>
<li>유튜브</li>
<li>인스타그램</li>
</ul>
</div>
<br/><br/><br/>

<div id="logo_main">
<div id="logo_1"><img src="./images/logo4.png" width="200" height="100"/>
</div>
</div>
<br/>
<div id="message">
2022 GolForYou. ALL RIGHTS RESERVED.<br/><br/>
SOME INFORMATION ON THIS SITE MAY VARY SLIGHTLY BY<br/>
                     LOCATION AND IN STADIUMS, <br/>
                     EVENT VENUES AND INTERNATIONAL SHACKS.
</div>
</div>
</footer>

</body>
</html>