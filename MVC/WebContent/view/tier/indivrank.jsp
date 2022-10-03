<%@page import="com.GolForYou.dao.ScoreCardDAO"%>
<%@page import="com.GolForYou.dao.rankDAO"%>
<%@ page import="java.sql.*, java.util.*, javax.sql.*, javax.naming.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/view/includes/header.jsp" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
<link rel="stylesheet" type="text/css" href="./css/ranking.css" />
<link rel="stylesheet" type="text/css" href="./css/indivrank.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<br/>
<%
String id = request.getParameter("rId");
if(id == null) {	 
	id = (String)session.getAttribute("id");;
}

rankDAO dao = new rankDAO();

int getCount = dao.playCount(id);

ScoreCardDAO sdao = new ScoreCardDAO();

String[] viewDate = new String[getCount];
String[] viewLocation = new String[getCount];
int[] viewBestScore = new int[getCount];
int[] viewRange = new int[getCount];
for(int i=0 ; i<getCount ; ++i) {
	viewDate[i] = sdao.getDate(id).get(i);
	viewLocation[i] = sdao.getLocation(id).get(i);
	viewBestScore[i] = sdao.getBestScore(id).get(i);
	viewRange[i] = sdao.getRange(id).get(i);
}
%>
<%-- 개인 본문 --%>
<script src="../js/jquery.js"></script>
<script src="./js/jquery.js"></script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script> <!-- chart.js -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
<article class="ind_main">
	<br>
	<span class="rank_title_1" id="rank_tag_1">
		랭킹존
	</span>
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; margin-top:20px;">
	<div class="ind_wrap">	
		<div class="one">		
			<div class="ind_info">
				<div class="ind_profile">
					
				</div>
				<div class="ind_ID">
					<div class="ind_prof">
						<strong id="ind_id">${id }</strong> 님은
					</div>
					<div class="ind_prof">
						<img id="tier_img" src="${tierURL }" alt="티어이미지">
						<strong style="font-color:red;">${tierStr }</strong> 등급입니다
					</div>
					
					
				</div>
			</div>
			
		</div>
		
		<div class="two">
			
			<div class="graph_wrap">
				<canvas id="myChart" width="300" height="70"></canvas>
	            <script>
	               const ctx = document.getElementById('myChart').getContext('2d');
	               const myChart = new Chart(ctx, {
	                   type: 'bar',
	                   data: {
	                       labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	                       datasets: [{
	                           label: '월별 골프장 방문 횟수',
	                           data: ["<c:out value='${jan}'/>", 
	                        	   "<c:out value='${feb}'/>", 
	                        	   "<c:out value='${mar}'/>", 
	                        	   "<c:out value='${apr}'/>",
	                        	   "<c:out value='${may}'/>", 
	                        	   "<c:out value='${jun}'/>", 
	                        	   "<c:out value='${jul}'/>", 
	                        	   "<c:out value='${aug}'/>",
	                        	   "<c:out value='${sep}'/>",
	                        	   "<c:out value='${oct}'/>",
	                        	   "<c:out value='${nov}'/>",
	                        	   "<c:out value='${dec}'/>"],
	                           backgroundColor: [
	                               'rgba(255, 99, 132, 0.2)',
	                               'rgba(54, 162, 235, 0.2)',
	                               'rgba(255, 206, 86, 0.2)',
	                               'rgba(75, 192, 192, 0.2)',
	                               'rgba(153, 102, 255, 0.2)',
	                               'rgba(255, 159, 64, 0.2)',
	                               'rgba(255, 0, 255, 0.2)',
	                               'rgba(255, 206, 86, 0.2)',
	                               'rgba(75, 192, 192, 0.2)',
	                               'rgba(153, 102, 255, 0.2)',
	                               'rgba(255, 159, 64, 0.2)',
	                               'rgba(255, 0, 255, 0.2)'
	                           ],
	                           borderColor: [
	                               'rgba(255, 99, 132, 1)',
	                               'rgba(54, 162, 235, 1)',
	                               'rgba(255, 206, 86, 1)',
	                               'rgba(75, 192, 192, 1)',
	                               'rgba(153, 102, 255, 1)',
	                               'rgba(255, 159, 64, 1)',
	                               'rgba(255, 0, 255, 1)',
	                               'rgba(255, 206, 86, 1)',
	                               'rgba(75, 192, 192, 1)',
	                               'rgba(153, 102, 255, 1)',
	                               'rgba(255, 159, 64, 1)',
	                               'rgba(255, 0, 255, 1)'
	                           ],
	                           borderWidth: 0.7
	                       }]
	                   },
	                   options: {
	                       scales: {
	                           y: {
	                               beginAtZero: true
	                           }
	                       }
	                   }
	               });
	            </script>
			</div>
		</div>
		
		<div class="three">			
			<div class="three_one">
				<div class="ind_infowrap">
					<div class="info_rank">
						<strong>${rankno}</strong>
					</div>
					<div class="info2" id="iPoint">
						POINT : <b>&nbsp;${rPoint}</b>점
					</div>
					
					<div class="info2" id="iPutting">
						평균 퍼팅 : ${strPutting}
					</div>
					
					<div class="info2" id="iHandicap">
						최근 핸디캡 : ${s_handicap }
					</div>
					
					<div class="info2" id="iLog">
						플레이 횟수 : ${getCount }
					</div>							
				</div>
			</div>
			<hr>
			
			<div class="three_two">
				<table class="indList" id="ind0">
					<tr>
						<th width="15%" id="ListDay">날짜</th>
						<th width="40%" id="ListLocation">골프장</th>
						<th width="15%" id="ListRange">최대 비거리</th>
						<th width="15%" id="ListMax">최고득점</th>
						<th width="15%" id="ListImg">카드</th>
					</tr>
				</table>	
			</div>
			
		</div>
	
	</div>
	
	<script>
		var historyCount = "<c:out value='${getCount}'/>"; //테스트용으로 전적이 40번 있다고 가정. 나중엔 데이터베이스 내의 자료 수를 불러와야함.
		var divCount = $('.ind_history').length;  //rank class에 해당하는 div 개수(현재 0).
		
		var id = "<c:out value='${id}'/>";
		
		$(".three_two").html("<table class='indList' id='ind0'>"
				+"<tr>"
				+"<th width='15%' id='ListDay'>날짜</th>"
				+"<th width='45%' id='ListLocation'>골프장</th>"
				+"<th width='16%' id='ListRange'>최대 비거리</th>"
				+"<th width='12%' id='ListMax'>최고득점</th>"
				+"<th width='12%' id='ListImg'>카드</th>"
				+"</tr>"
				+"</table>"
				+"<div class='ind_history' id='ind_history_1'>");
		
		while(historyCount > divCount){
			
			
			var divHistory = $("<div></div>").addClass("ind_history").attr('id',"ind_history_"+(divCount+1)); //
			$("#ind_history_"+divCount).after(divHistory);	//rank클래스 div 생성	
			
			$("#ind_history_"+(divCount+1)).html("<div class='iDate' id='iDate_"+(divCount+1)+"'>"); //iDate클래스 div 생성
			
			var divDate2 = $("<div></div>").addClass("iDate2").attr('id',"iDate2_"+(divCount+1));
			$("#iDate_"+(divCount+1)).after(divDate2); //iDate2클래스 div 생성
			
			var divLocation = $("<div></div>").addClass("iLocation").attr('id',"iLocation_"+(divCount+1));
			$("#iDate2_"+(divCount+1)).after(divLocation); //iLocation클래스 div 생성
			
			var divRange = $("<div></div>").addClass("iRange2").attr('id',"iRange_"+(divCount+1));
			$("#iLocation_"+(divCount+1)).after(divRange); //iRange클래스 div 생성
			
			var divHighScore = $("<div></div>").addClass("iHighScore").attr('id',"iHighScore_"+(divCount+1));
			$("#iRange_"+(divCount+1)).after(divHighScore); //iHighScore클래스 div 생성
			
			var divScoreCard = $("<div></div>").addClass("iScoreCard").attr('id',"iScoreCard_"+(divCount+1));
			$("#iHighScore_"+(divCount+1)).after(divScoreCard); //iHighScore클래스 div 생성
			
			//document.getElementById('iDate_'+(divCount+1)).innerHTML = "생성된날짜";
			//document.getElementById('iLocation_'+(divCount+1)).innerHTML = "생성된골프장소";
			//document.getElementById('iRange_'+(divCount+1)).innerHTML = "생성된최대비거리";
			//document.getElementById('iHighScore_'+(divCount+1)).innerHTML = "생성된그날최고득점";
			document.getElementById('iScoreCard_'+(divCount+1)).innerHTML = "<i class='far fa-clipboard'></i>";
			
			divCount = $('.ind_history').length;
		}
		
		$(".ind_profile").css({
			"background-image": "url('./upload/member/<c:out value='${img}'/>')",
			"background-repeat" : "no-repeat",
			"background-size" : "90px 90px",			
		});
		
		function showSCImg(i){
			window.open("scorecardImg.do?iDate="+$('#iDate_'+i).text()+"&id="+id,"a","width=400,height=400,left=100,top=50");
		}
		
		var id = $("#ind_id").text();
		
		for(var i=1 ; i<=historyCount ; ++i){			
			$("#iScoreCard_"+i).attr("onclick","showSCImg("+i+");");
		}
		

	</script>
	<%
	for(int i=0 ; i<getCount ; ++i){
	%>
		<script>
		$("#iDate_"+(<%=i+1%>)).append("<%=viewDate[i]%>");
		$("#iDate2_"+(<%=i+1%>)).append("<%=viewDate[i].substring(0,4)+"년"+viewDate[i].substring(5,7)+"월"+viewDate[i].substring(8,10)+"일"%>");
		$("#iLocation_"+(<%=i+1%>)).append("<%=viewLocation[i]%>");
		$("#iHighScore_"+(<%=i+1%>)).append("<%=viewBestScore[i]%>");
		$("#iRange_"+(<%=i+1%>)).append("<%=viewRange[i]%>m");
		
		var loc = $('#iLocation_'+<%=i+1%>).text();
		
		if(loc == '잭 니클라우스 GC 코리아'){
			$('#iLocation_'+<%=i+1%>).css({
				"background-image": "linear-gradient(rgba(255,255,255,0.5),rgba(255,255,255,0.5)),url('./images/tier/JACK_NICKLAUS_GOLF_CLUB_KOREA.jpg')",
				"background-size" : "330px 80px"	
				});
		}else if(loc == '소노 펠리체 CC'){
			$('#iLocation_'+<%=i+1%>).css({
				"background-image": "linear-gradient(rgba(255,255,255,0.5),rgba(255,255,255,0.5)),url('./images/tier/SONO_FELICE_COUNTRY_CLUB.jpg')",
				"background-size" : "330px 80px"
				});
		}else if(loc == '해슬리 나인브릿지'){
			$('#iLocation_'+<%=i+1%>).css({
				"background-image": "linear-gradient(rgba(255,255,255,0.5),rgba(255,255,255,0.5)),url('./images/tier/HAESLEY_NINE_BRIDGE.jpg')",
				"background-size" : "330px 80px"
				});
		}else if(loc == '골드레이크 CC'){
			$('#iLocation_'+<%=i+1%>).css({
				"background-image": "linear-gradient(rgba(255,255,255,0.5),rgba(255,255,255,0.5)),url('./images/GOLD_LAKE_CC.jpg')",
				"background-size" : "330px 80px"
				});
		}
		</script>
	<%	
	}
	%>
	

</article>

<jsp:include page="/view/includes/footer.jsp" />


