<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일정등록</title>
<script type="text/javascript" src="/resources/jqueryui/jquery-ui.js"></script>
<script src="./"></script>
 <script>
 $(function(){
 	$("#pdate").datepicker({
 	 changeMonth: true,
 	 changeYear: true
 	});
 });
 
 </script>
</head>

<style>
 body{
 	font-size:10pt;
 	font-family: 'Noto Sans KR';
 	color:#333333;
 }
 table{
  width:380px;
  border-collapse:collapse;
 }
 th,td{
  border:1px solid #cccccc;
  padding:5px;
 }
 caption {
  font-size:14pt;
  font-weiht:bold;
  margin-bottom:5px;
 }
 .div1{
  width:380px;
  text-align:center;
  margin-top:10px;
 }
</style>

<body>

<form name="frm" method="post" action="planWriteresult.do" style="width:100px;height:100px;">

<table>
	<caption>예약등록</caption>
	<tr>
		<th width="40%">체크인 날짜</th>
		
		<td width="60%"><input type="date" name="pdate"  id="pdate"  style="width:98%" ></td>
	</tr>
	
	<tr>
	 <th width="40%">체크아웃 날짜</th>
	  <td width="60%"><input type="date" name="t" id="t" style="width:98%"> </td>
	  
	</tr>
	<tr>
	

		<th>예약자명</th>
		<td><input type="tel" class="form-control m-input" name="tel"  required maxlength="3" placeholder="예)홍길동"></td>
	</tr>
	
	<tr>
	<th>연락처</th>
		<td>
		<input
 			 type="tel"
 			 class="form-control m-input"
 			 name="tel"
 			 id="telInput"
  			 required
  			 pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}"
 			 maxlength="13"
  			 placeholder="예) 010-1234-5678"
				/>
		</td>
	</tr>
	
	<tr>
		<th>예약시 요구사항</th>
		<td><textarea name="content" style="width:98%;height:150px;"></textarea></td>
	</tr>
</table>
<div class="div1">
	<button type="submit" >예약</button>&nbsp;&nbsp;<button type="submit">취소</button>
</div>
 
</form>
</body>
</html>