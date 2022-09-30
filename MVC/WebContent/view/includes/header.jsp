<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolForYou</title>
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
</head>
  <header> 

    <nav class="headerNav"> 
   
    <c:if test="${empty id}">
    <div id="login"><a href="login.do" class=btn1>로그인</a> | <a href="join.do" class=btn1>회원가입</a></div></c:if>
    
    <c:if test="${!(empty id) && !(id=='admin')}"><div id="login"><a href="mypage.do" class=btn1>마이페이지</a> | <a href="logout.do" class=btn1>로그아웃</a></div>
    </c:if>
     
    <c:if test="${!(empty id) && id=='admin'}"><div id="login"><a href="admin_main.do" class=btn1>관리자페이지</a> | <a href="logout.do" class=btn1>로그아웃</a></div>
    </c:if>
    
    <div class="clear"></div>  
    
     
    <%-- 회사로고 --%>
    <div id="logo"><a href="index.do"><img src="./images/logo1.png"
    width="70px" height="70px" alt="Golf" /></a></div>
 
     <%--상단 메뉴 --%>
     
     <ul>
      <li><a href="ranking.do"class=btn1>랭킹</a>
       <ul>
       <li><a href="ranking.do">전체기록</a></li>
       <li><a href="indivrank.do">개인기록</a></li>
       </ul>
       </li>
      <li><a href="board_list.do" class=btn1>게시판</a>
       <ul>      
       <li><a href="board_list.do">자유게시판</a></li>
       <li><a href="scorecard_list.do">스코어카드<br>게시판</a></li>
       </ul>
       </li>
      <li><a href="YeYag_list.do" class=btn1>골프장</a>
       <ul>
       <li><a href="field_search.do">골프장 검색</a></li>
       <li><a href="YeYag_list.do">골프장 예약하기</a></li>
       </ul>
       </li>
      <li><a href="class_main.do" class=btn1>클래스</a>
       <ul>
       <li><a href="class_main.do">필드 클래스</a></li>
       <li><a href="class_online.do">온라인 클래스</a></li>
       </ul>
       </li>
      <li><a href="customer_main.do" class=btn1>고객센터</a>
       <ul>
       <li><a href="customer_main.do">1:1</a></li>
       <li><a href="customer_holeinone.do">홀인원 보험</a></li>
       </ul>
       </ul>  
    </nav>

    </header>
    <div class="clear"></div>
    
    
