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
		<h1 id="name-tag">골프장목록</h1>
	
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
 

<div class="ground-cont" >
 
 <div class="GolfCourse">
 
 
		<div id="GolfCourse01">
         <c:if test="${!empty list }">
            <c:forEach var="dao" items="${list }">
              <figure class="product" style="display: inline-block">
                  <button class="golf1" type="button"><a href="${dao.getY_url()}"><img
                     src="${dao.getY_img()}" width="460px" height="340px"></a>
                     <div id="golf1">${dao.getY_name()}<br/></div>
                     <div id="golf1">${dao.getY_info()}<br/></div>
                     <div id="golf1">${dao.getY_area()}<br/></div>
                     </button>
                 
               </figure> 
            </c:forEach>
         </c:if>
		</div>
</div>

</div>
<br><br> 
</body>

<jsp:include page="/view/includes/footer.jsp" /> 
</html>