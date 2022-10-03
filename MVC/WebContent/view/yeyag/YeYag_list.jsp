<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/view/includes/header.jsp" /> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> </title>
<link rel="stylesheet" type="text/css" href="./css/YeYag_list.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
</head>
<style type="text/css">

.searchtable{
	overflow: hidden;
	padding:10px;
	padding-left:60%;
}

div .search-box {
  
  margin-left:75%;
  background-color: #56F569;
  height: 40px;
  width:400px;
  padding-left: 10px;
  line-height: 40px;
  float: right;
}

form #search{
  background-color: #56F569;
  width:100%;
}

.search-btn {
  padding:2px;
  color: #fff;
  float: right;
  width: 40px;
  height: 40px;
  line-height: 60px;
  border:none;
  background-color: #56F569;
  display: flex;
  align-items: center;
  justify-content: center;
}

.search-txt {
  padding: 0;
  background: none;
  border: none;
  outline: none;
  color: white;
  display: inline-block;
  width: 80%;
  font-size: 1.15em;
}

</style>

<body>
<br />
   <div class="clear" style="margin-top: 135px"></div>
<div>
		<h1 id="name-tag">골프장 목록</h1>
	
	 <table class="searchtable" >
	 	<tr>
	 	<th> 	
	 	<div class="search-box">	
	 	 <form  name="search" role="search" method="get" action="YeYag_list_ok.do">
	 	 <input type="search" name="y_name" class="search-txt" placeholder="검색어를 입력해 주세요"/>
	 	 <button type="submit" name="find_btn" class="search-btn">
	 	 <i class="fas fa-search fa-2x"></i>
		</button>
	 	 </form>
	 	 </div>
	 	 </th>
	 	</tr>
	 </table>
</div>
	
		<hr style="padding: 0.01px; background-color: grey; width: 88%; margin-left: 4%"/>
  
	
	
 
 <div class="ground-cont" style="margin-bottom:200px;">

 <div class="GolfCourse"> 
 

 <div class="GolfCourselist"> <%--list.ok css와 충돌이 있어서 클래스명 변경 --%>
 <button class="golf1" type="button">
  <a href="./YeYag_main.do"><img src="images/yeyag/Qcc.jpg"></a>
  <p>해슬리 나인브릿지</p>
  <p>HAESLEY NINE BRIDGE</p>
  <p>경기도</p>
  </button>
 </div>
  
  <div class="GolfCourselist">
 
 <button class="golf1" type="button">
  <a href="./YeYag_main1.do"><img src="images/yeyag/goldlakecc.jpg"></a>
  <p>골드레이크</p>
  <p>GOLD LAKE CC</p>
  <p>전라도</p>
  </button>
 </div>
 
 <div class="GolfCourselist">
 <button class="golf1" type="button">
  <a href="./YeYag_main2.do"><img src="images/yeyag/JACK.jpg"></a>
  <p>잭 니클라우스 GC 코리아</p>
  <p>JACK NICKLAUS GOLF CLUB KOREA</p>
  <p>인천</p>
  </button>
 </div> 

 
 <div class="GolfCourselist">
 <button class="golf1" type="button">
  <a href="./YeYag_main3.do"><img src="images/yeyag/SONO.jpg"></a>
  <p>소노 펠리체 CC</p>
  <p>SONO FELICE COUNTRY CLUB</p>
  <p>강원도</p>
  </button>
 </div>
 
 </div>
 </div>
 <br><br>
</body>

<jsp:include page="/view/includes/footer.jsp" /> 
</html>