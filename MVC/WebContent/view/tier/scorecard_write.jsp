<%@ page import="com.GolForYou.vo.SCBoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.GolForYou.dao.SCBoardDAO" %>
<%@ page import="java.sql.*, java.util.*" %>

<jsp:include page="/view/includes/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/ranking.css" />
<link rel="stylesheet" type="text/css" href="./css/scorecard_list.css" />
<link rel="stylesheet" type="text/css" href="./css/scorecard_write.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<br>

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
		글쓰기
	</span>
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; margin-top:20px;">
	<div class="scwrite_wrap">
		<form method="post" action="scorecard_write_ok.do" onsubmit="return check();" enctype="multipart/form-data">
		<table class="sc_t">
			<tr height="0%">
				<td colspan="2"><input type="hidden" name="sc_id" class="sc_text" id="sc_id" readonly value="${id }"></td>			
			</tr>
			
			<tr height="10%">
				<td width="50%">
					<input type="text" id="playdate_output" readonly value="방문 날짜를 선택하세요">	
					<input type="date" name="sc_playdate" class="sc_date" id="sc_playdate" onchange="document.getElementById('playdate_output').value = this.value">
					<hr class="scwrite_hr">
				</td>
				<td width="60%">
					<input type="file" name="sc_file" id="sc_file" onchange="document.getElementById('file_route').value = this.value">
					<label for="sc_file" class="file_upload_button_sc">파일 등록</label>
					<input type="text" readonly id="file_route" value="스코어카드 사진을 올리세요">
					<hr class="scwrite_hr">
				</td>				
			</tr>
			
			<tr height="10%">
				<td colspan="2"> <input name="sc_title" class="sc_text" id="sc_title" placeholder="제목을 입력하세요"><hr class="scwrite_hr"></td>			
			</tr>
		
			<tr height="70%">
				<td colspan="2"><textarea name="sc_cont" class="sc_text" id="sc_cont" placeholder="내용을 입력하세요"></textarea><hr class="scwrite_hr"></td>
			</tr>
			
			
			
			<tr height="10%">
				<td>
					<input type="submit" name="sc_submit" class="submitBtn" id="sc_submit" value="글쓰기">
					
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
