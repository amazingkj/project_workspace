<%@ page import="com.GolForYou.vo.SCBoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/view/includes/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<link rel="stylesheet" type="text/css" href="./css/ranking.css" />
<link rel="stylesheet" type="text/css" href="./css/scorecard_cont.css" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<link rel="stylesheet" type="text/css" href="./css/foot.css" />
<br>

<script src="../js/jquery.js"></script>
<script src="./js/jquery.js"></script>

<%-- 글내용 본문 --%>
<article id="sccont_main">
<br>
	<span class="sccont_title_1" id="sccont_tag">
		스코어카드 게시판
	</span>
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; margin-top:20px;">
	<div class="sccont_wrap">
		<table class="sccont_t">
			<tr height="9%">
				<th><input class="sccont_text" id="sccont_title" readonly value="[제목] ${sb.sc_title }"></th>
			</tr>
			
			<tr height="9%">
				<th><input class="sccont_text" readonly value="[방문 날짜] ${sb.sc_playdate }"></th>
			</tr>	
			<tr height="15%">
				<th>
				<div class="sccont_image">
					<img src="./upload/${sb.sc_file }" width="800px" height="200px" alt="스코어카드">
				</div>
			</tr>
			<tr height="58%">
				<th><input class="sccont_text" readonly value="${sb.sc_cont }"></th>
			</tr>
			
			<tr height="9%">
				<td>
					<div class="sccont_menu">
						<input type="button" class="CheckBtn_sccont" value="답변" onclick="location='scorecard_cont.do?sc_no=${sb.sc_no}&page=${page }&state=reply';">
						<c:if test="${(id == sb.sc_id) || (id == 'admin') }">
							<input type="button" class="CheckBtn_sccont" value="수정" onclick="location='scorecard_cont.do?sc_no=${sb.sc_no}&page=${page }&state=edit';">
							<input type="button" class="CheckBtn_sccont" value="삭제" onclick="location='scorecard_cont.do?sc_no=${sb.sc_no}&page=${page }&state=del';">
						</c:if>						
						<input type="button" class="CheckBtn_sccont" value="목록" onclick="location='scorecard_list.do?page=${page }';">						
					</div>
				</td>
			</tr>
		</table>
		
	</div>
	
</article>

<jsp:include page="/view/includes/footer.jsp" />
<br>
