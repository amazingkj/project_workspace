<%@ page import="com.GolForYou.vo.SCBoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.GolForYou.dao.SCBoardDAO" %>
<%@ page import="java.sql.*, java.util.*" %>

<jsp:include page="/view/includes/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/header.css" />
<link rel="stylesheet" type="text/css" href="./css/ranking.css" />
<link rel="stylesheet" type="text/css" href="./css/scorecard_list.css" />
<link rel="stylesheet" type="text/css" href="./css/scorecard_write.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<link rel="stylesheet" type="text/css" href="./css/foot.css" />
<br>
<script src="../js/jquery.js"></script>
<script src="./js/jquery.js"></script>

<%-- 스코어카드 게시판 글쓰기페이지 본문 --%>

<script>
	function check(){
		if($.trim($('#sc_title').val()) == ''){
			alert('제목을 입력하세요');
			$('#sc_title').val('').focus();
			return false;
		}
		if($.trim($('#sc_cont').val()) == ''){
			alert('내용을 입력하세요');
			$('#sc_cont').val('').focus();
			return false;
		}
	}
</script>

<article class="scboardwrite_main">
<br>
	<span class="rank_title_1" id="rank_tag">
		답변
	</span>
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; margin-top:20px;">
	<div class="scwrite_wrap">
		<form method="post" action="scorecard_reply_ok.do" onsubmit="return check();">
		<%-- 답변 히든값 --%>
		<input type="hidden" name="sc_ref" value="${sb.sc_ref }">
		
		<%-- 원본글과 답변글을 묶어주는 그룹번호명 --%>
		<input type="hidden" name="sc_step" value="${sb.sc_step }">
		
		<%-- 원본글이면 0, 첫번째 답변글이면 1 즉 원본글과 답변글을 구분하는 번호값이면서 몇 번째 답변글인지 알려주는 식 --%>
		<input type="hidden" name="sc_level" value="${sb.sc_level }">
		
		<input type="hidden" name="page" value="${page}"> <%-- 페이징(쪽나누기)에서 책갈피 기능때문에 페이지번호를 히든으로 전달. --%>
		<table class="sc_t">
			<tr height="0%">
				<td colspan="2"><input type="hidden" name="sc_id" class="sc_text" id="sc_id" readonly value="${id }"></td>			
			</tr>
			
			<tr height="10%">
				<td colspan="2"> <input name="sc_title" class="sc_text" id="sc_title" value="Re:[${sb.sc_title }]"><hr class="scwrite_hr"></td>			
			</tr>
		
			<tr height="70%">
				<td colspan="2"><textarea name="sc_cont" class="sc_text" id="sc_cont" placeholder="내용을 입력하세요"></textarea><hr class="scwrite_hr"></td>
			</tr>
		
			<tr height="10%">
				<td>
					<input type="submit" name="sc_submit" class="submitBtn" id="sc_submit" value="답변">
					
				</td>
				<td>
					<input type="button" name="sc_list" class="submitBtn" id="sc_list" value="목록" onclick="location='scorecard_list.do?page=${page}'">
				</td>
			</tr>
		</table>	
		</form>
	</div>
	
</article>

<jsp:include page="/view/includes/footer.jsp" />
<br>
