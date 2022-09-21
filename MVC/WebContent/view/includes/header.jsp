<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GolfKong</title>
<link rel="stylesheet" type="text/css" href="./css/header.css" />

</head>
  <header> 

    <nav> 
   
    <c:if test="${empty id}">
    <div id="login"><a href="login.do" class=btn1>로그인</a> | <a href="join.do" class=btn1>회원가입</a></div></c:if>
    <c:if test="${!empty id}"><div id="login"><a href="mypage.do" class=btn1>마이페이지</a> | <a href="logout.do" class=btn1>로그아웃</a></div>
    </c:if>
    
    <div class="clear"></div>  
    
     
    <%-- 회사로고 --%>
    <div id="logo"><a href="index.do"><img src="./images/logo1.png"
    width="70px" height="70px" alt="Golf" /></a></div>
 
     <%--상단 메뉴 --%>
     
     <ul>
      <li><a href="#"class=btn1>랭킹</a>
       <ul>
       <li><a href="#">개인기록</a></li>
       <li><a href="#">전체기록</a></li>
       </ul>
       </li>
      <li><a href="board_list.do"class=btn1>게시판</a>
       <ul>
       <li><a href="#">공지사항</a></li>
       <li><a href="#">팁공유게시판</a></li>
        <li><a href="board_list.do">자유게시판</a></li>
       </ul>
       </li>
      <li><a href="#"class=btn1>장소검색</a>
       <ul>
       <li><a href="#">골프연습장</a></li>
       <li><a href="#">필드</a></li>
       </ul>
       </li>
      <li><a href="#"class=btn1>클래스</a>
       <ul>
       <li><a href="#">수강신청</a></li>
       <li><a href="#">결제</a></li>
       </ul>
       </li>
      <li><a href="customer_main.do"class=btn1>고객센터</a>
       <ul>
       <li><a href="customer_main.do">1:1</a></li>
       <li><a href="customer_holeinone.do">홀인원 보험</a></li>
       </ul>
       </ul>  
    </nav>

    </header>
    <div class="clear"></div>
    
    
