<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
 <%
  String yy= request.getParameter("year");
  String mm= request.getParameter("month");
  
 Calendar cal = Calendar.getInstance();
 
 int y= cal.get(Calendar.YEAR);
 int m= cal.get(Calendar.MONTH);
 
 if(yy !=null && mm != null && !yy.equals("") && !mm.equals("")){
    y= Integer.parseInt(yy);
    m= Integer.parseInt(mm)-1;
 }
 
 cal.set(y,m,1);
 
 int dayOfweek =cal.get(Calendar.DAY_OF_WEEK);
 
 int lastday= cal.getActualMaximum(Calendar.DATE);
 %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>골프장예약등록창</title>
</head>
<style>
 body{
  font-size:9pt;
  font-family: 'Noto Sans KR';
  color:#555555;
 }
 table{
  border-collapse:collapse;
 }
 th,td{
  border:1px solid #cccccc;
  width:70px;
  height:30px;
  text-align:center;
  margin-top:200px;
 }
 caption{
  margin-bottom:10px;
  font-size:15px;
 }
 .t_div1{
  float:left;
  width:30%;
 
 }
 .t_div2{
  float:left;
  width:40%;
   font-size:20px;
  font-family:20px;
 
 }
 .t_div3{
  float:left;
  width:30%;
 }
 #color1{
 color:blue;
 }
 #color2{
 color:red;
 }
</style>

<script>
function fn_planWrite(){

   <%--
   String USERID = (String) session.getAttribute("SessionUserId");
   if(USERID ==null ){
   %>
    alert("로그인 이후에 이용가능합니다.");
    location="../member/login.jsp"
   <%
   }else{
   --%>
  var w =window.screen.width/2 - 200;
  var h =window.screen.height/2 -200;
  var url= "./planwrite.do"
  window.open(url,"planWrite","width=400, height=400,left="+w+",top="+h);
   <%--
   }
   --%>
   }
</script>

<body>
<form name="frm" method="post" action="./planlist.do">원하는 날짜를 입력하세요:&nbsp; 
<input type="text" name="year" size="3">년
<input type="text" name="month"size="3">월
&nbsp;&nbsp; <input type="submit" value="입력">
</form>
<br/>
 <div style="width:390px;">
   <div class="t_div1">&nbsp;</div>
   <div class="t_div2">&nbsp;
   <%=y %>년 <%=m+1 %>월  
   </div>
   <div class="t_div3"> 
   &nbsp;&nbsp;&nbsp;<button type="button" onclick="fn_planWrite()">예약등록</button>
   </div>
 </div>
 <br/><br/>
<table>
 <tr>
  <th><font color ="#F79DC2">일</th>
  <th>월</th>
  <th>화</th>
  <th>수</th>
  <th>목</th>
  <th>금</th>
  <th><font color ="skyblue">토</th>
 </tr>
 <tr>
 <%
 
  int day=169000;
  int jumal=200000;
 
  int nalcount=0;
  int count = 0;
  int status = 1;
  
  
  
  
 for(int s=1; s<dayOfweek; s++){
    out.print("<td id='"+(m+1)+s+"'></td>");
    count++;
    nalcount++;
 }
 
 for(int d=1; d<=lastday; d++){
    count++;
    nalcount++;

    if(nalcount%7==0 || nalcount%7==1){
    
    	if(status == 1) {
    		%><td><%=d %><h3 id=color1>신청</h3><br><%=jumal %>원</td><%
    		
    	} else{
    		%><td><%=d %><h3 id=color2>완료</h3><br><%=jumal %>원</td><%
    		}
    	      
     }else{
    	 
    	 if(status == 1) {
     		%><td><%=d %><h3 id=color1>신청</h3><br><%=day%>원</td><%
     		
     	} else{
     		%><td><%=d %><h3 id=color2>완료</h3><br><%=day%>원</td><%
     		}
    	 
    	 
         }
        if(count%7 == 0){
            out.print("</tr><tr>");
         }
       }	
    		
    		
    		
    		
    	
    	
 /*	%>
       <td><%=d %><br><%=jumal %></td>
    <%      
    }else{
    %>
       <td><%=d %><br><%=day %></td>
    <%
    }
    if(count%7 == 0){
        out.print("</tr><tr>");
     }
   }
   */  %>
    
    
 </tr>
</table>

</body>
</html>