<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="com.GolForYou.dao.ScoreCardDAO"%>
<%@page import="com.GolForYou.dao.rankDAO"%>
<%@ page import="java.sql.*, java.util.*, javax.sql.*, javax.naming.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" type="text/css" href="./css/admin_insertCard2.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<br/>

<%-- 관리자페이지-스코어카드 입력 본문 --%>
<script src="../js/jquery.js"></script>
<script src="./js/jquery.js"></script>

<script>
	
	function calc_point(){
		var avgpoint = 0;
		for(var i=1 ; i<=18 ; i++){
			var a = $('#point'+i).val();
			a = parseInt(a);
			avgpoint += a;
		}
		
		//avgpoint = avgpoint/18;
		
		document.getElementById('point_avg').value = avgpoint;
	}
	
	function calc_putt(){
		var puttpoint = 0;
		for(var i=1 ; i<=18 ; i++){
			var a = $('#putt'+i).val();
			a = parseInt(a);
			puttpoint += a;
		}
		
		puttpoint = puttpoint/18;
		
		document.getElementById('put_avg').value = puttpoint;
	}


</script>

<article class="adminInsertCard2_main">
<br>
	<form method="post" action="admin_insertCard_ok.do">
		<input type="hidden" name="s_id" value="${id }">
		<input type="hidden" name="s_date" value="${date }">
		<div id="imginfo_wrap">
			<div>
			<h2>스코어카드 이미지</h2> <br>
			<img src="./upload/${folder }/${file }_${id }.png" width="1000" height="300" alt="스코어카드">
					
			</div>
			<br>
			<hr>
			<h2>스코어카드 정보 입력란</h2>  <br>
			<table id="insertT" border="1">
				<tr>
					<td>hole</td>
					<td>1</td>
					<td>2</td>
					<td>3</td>
					<td>4</td>
					<td>5</td>
					<td>6</td>
					<td>7</td>
					<td>8</td>
					<td>9</td>
					<td>10</td>
					<td>11</td>
					<td>12</td>
					<td>13</td>
					<td>14</td>
					<td>15</td>
					<td>16</td>
					<td>17</td>
					<td>18</td>
				</tr>
				<tr>
					<td>par</td>
					<td ><input type="text" name="par" class="insert_info"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
					<td><input type="text" name="par" class="insert_info" size="1"></td>
				</tr>
				<tr>
					<td>점수</td>
					<td><input type="text" name="point" class="insert_info" id="point1" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point2" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point3" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point4" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point5" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point6" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point7" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point8" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point9" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point10" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point11" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point12" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point13" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point14" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point15" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point16" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point17" size="1"></td>
					<td><input type="text" name="point" class="insert_info" id="point18" size="1"></td>
				</tr>
				<tr>
					<td>OB횟수</td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
					<td><input type="text" name="ob" class="insert_info" size="1"></td>
				</tr>
				<tr>
					<td>Hazard횟수</td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
					<td><input type="text" name="hazard" class="insert_info" size="1"></td>
				</tr>
				<tr>
					<td>퍼팅횟수</td>
					<td><input type="text" name="putting" class="insert_info" id="putt1" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt2" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt3" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt4" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt5" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt6" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt7" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt8" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt9" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt10" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt11" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt12" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt13" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt14" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt15" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt16" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt17" size="1"></td>
					<td><input type="text" name="putting" class="insert_info" id="putt18" size="1"></td>
				</tr>
			</table>
			<br>
			<hr>
			<div id="insert_Card">
			점수합 계산하기 : <input type="button" name="cal_point" id="cal_point" value="계산하기" onclick="calc_point();"><br>
			점수합 : <input type="text" name="point_avg" id="point_avg" readonly size="14">
			<hr class="mini_hr">
			최고점수 : <input type="text" name="bestPoint" id="bestPoint" size="2">
			<hr class="mini_hr">
			평균 퍼팅 계산하기 : <input type="button" name="cal_put" id="cal_put" value="계산하기" onclick="calc_putt();"><br>
			평균 퍼팅 : <input type="text" name="put_avg" id="put_avg" readonly size="14">
			<hr class="mini_hr">
			최대비거리 : <input type="text" name="range" id="range">
			<hr class="mini_hr">
			핸디캡 : <input type="text" name="handicap" id="handicap">
			<hr class="mini_hr">
			골프장 이름 : 
			<select name="location" id="location">
				<option value="잭 니클라우스 GC 코리아">잭 니클라우스 GC 코리아</option>
				<option value="소노 펠리체 CC">소노 펠리체 CC</option>
				<option value="해슬리 나인브릿지">해슬리 나인브릿지</option>
				<option value="골드레이크 CC">골드레이크 CC</option>
			</select>
			</div>
			<br>
			<hr>
			<input type="submit" class="checkBtn_admin" value="업데이트">
			<input type="reset" class="checkBtn_admin" value="다시 입력하기">
			
			
		</div>

	</form>
	<hr>
	<form method="post" action="admin_insertCard_del.do">
		<input type="hidden" name="s_id" value="${id }">
		<input type="hidden" name="s_date" value="${date }">
		잘못올린 게시글이나 사진양식이 잘못된 경우 : <input type="submit" class="checkBtn_admin" value="반려">
	</form>
	
</article>

