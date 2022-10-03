<%@ page import="com.GolForYou.vo.SCBoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.GolForYou.dao.SCBoardDAO" %>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/view/includes/header.jsp" />
<link rel="stylesheet" type="text/css" href="./css/ranking.css" />
<link rel="stylesheet" type="text/css" href="./css/scorecard_list.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<br>


<%-- 스코어카드 업로드게시판 본문 --%>

<script src="../js/jquery.js"></script>
<script src="./js/jquery.js"></script>

<article id="scorecard_main">
<br>
	<span class="rank_title_1" id="rank_tag">
		스코어카드 게시판
	</span>
	<hr style="padding:0.5px; background-color:grey; width:1300px; margin-left:	4%; border:0; ">
	
	<div class="board_wrap">
	<form method="get" action="scorecard_list.do"> <%-- 검색기능 폼 추가 --%>
		<table class="boardlist" id="board_sclist">
			<thead>
				<tr>
					<!-- <c:if test="${id == 'admin' }">
					<th width="5%"><input type="checkbox"></th>
					</c:if> -->
					<th width="7%">번호</th>				
					<th width="52%">글제목</th>
					<th width="14%">글쓴이</th>
					<th width="13%">날짜</th>
					<th width="9%">조회수</th>
				</tr>
			</thead>
			
			<c:if test="${!empty sclist }">
				<c:forEach var="s" items="${sclist }">
				<tr>
					<!-- <c:if test="${id == 'admin' }">
					<td width="5%"><input type="checkbox"></td>
					</c:if> -->
					<td width="7%"><c:if test="${s.sc_step == 0 }">${s.sc_ref }</c:if></td>
					<td width="52%">
						<c:if test="${s.sc_step != 0 }"> <%-- 답변글일때만 실행, 들여쓰기와 답변글 이미지가 나옴 --%>
							<c:forEach begin="1" end="${s.sc_step }" step="1">
								
							</c:forEach>
							<img src="./images/AnswerLine.gif"> <%-- 답변글 이미지 --%>
						</c:if>
					<a href="scorecard_cont.do?sc_no=${s.sc_no}&page=${page}&state=cont">${s.sc_title }</a>
					</td>
					<td width="14%">${s.sc_id }</td>
					<td width="13%">${s.sc_date }</td>
					<td width="9%">${s.sc_hit }</td>
				</tr>
				</c:forEach>
			</c:if>
			
			<c:if test="${empty sclist }">
				<tr>
					<td colspan="5">게시물이 존재하지 않습니다.</td>
				</tr>
			</c:if>
			<tr>
				<td colspan="5">					
					<select name="find_field" class="searchboard">
						<option value="sc_All">제목+내용</option>
						<option value="sc_title" <c:if test="${find_field == 'sc_title' }"> ${'selected' } </c:if>>제목</option>
						<option value="sc_cont" <c:if test="${find_field == 'sc_cont' }"> ${'selected' } </c:if>>내용</option>
						<option value="sc_reply" <c:if test="${find_field == 'sc_reply' }"> ${'selected' } </c:if>>댓글</option>
						<option value="sc_id" <c:if test="${find_field == 'sc_id' }"> ${'selected' } </c:if>>아이디</option>
					</select>
					<div class="search-box_sc">
						<input type="search" value="${find_name }" name="find_name" class="search-txt_sc" onkeyup="press();" id="search_txt" placeholder="검색어를 입력하세요">						
						<button type="submit" class="search-btn_sc" onclick="searching();"><i class="fas fa-search"></i></button>
					</div>
				<input type="button" class="CheckBtn" id="CheckBtn_sc" value="글쓰기" onclick="location='scorecard_write.do?page=${page}'">
				</td>
			</tr>
		</table>
		<div class="page_control">
			<%-- 검색 전 페이징 --%>
			<c:if test="${(empty find_field) && (empty find_name) }"> <%-- 검색필드와 검색어가 없는 경우 --%>
				<c:if test="${page <= 1 }">
					[이전]
				</c:if>
				
				<c:if test="${page > 1 }">
					<a href="scorecard_list.do?page=${page-1 }">[이전]</a>
				</c:if>
				
				<%-- 현재 쪽번호 출력 --%>
				<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
					<c:if test="${a == page }"> <%-- 현재 페이지가 선택된 경우 --%>
						${a}
					</c:if>
					
					<c:if test="${a != page }">
						<a href="scorecard_list.do?page=${a }">${a}</a>
					</c:if>					
				</c:forEach>
				<c:if test="${page >= maxpage }">
					[다음]
				</c:if>
				
				<c:if test="${page < maxpage }">
					<a href="scorecard_list.do?page=${page+1 }">[다음]</a>
				</c:if>
			</c:if>
			
	      	<%-- 검색 이후 페이징 --%>
			<c:if test="${(!empty find_field) || (!empty find_name) }">
				<c:if test="${page <= 1 }">
					[이전]
				</c:if>
				
				<c:if test="${page > 1 }">
					<a href="scorecard_list.do?page=${page-1 }&find_field=${find_field}&find_name=${find_name}">[이전]</a>
					<%-- get으로 find_field와 find_name을 전달해야 검색 이후 페이징 목록을 유지 가능. 검색필드의 검색어를 전달하지 않으면 검색 전 전체 페이징 목록으로 이동해서 검색효과 사라짐. --%>
				</c:if>
				
				<%-- 현재 쪽번호 출력 --%>
				<c:forEach var="a" begin="${startpage }" end="${endpage }" step="1">
					<c:if test="${a == page }"> <%-- 현재 페이지가 선택된 경우 --%>
						${a}
					</c:if>
					
					<c:if test="${a != page }">
						<a href="scorecard_list.do?page=${a }&find_field=${find_field}&find_name=${find_name}">${a}</a>
					</c:if>					
				</c:forEach>
				<c:if test="${page >= maxpage }">
					[다음]
				</c:if>
				
				<c:if test="${page < maxpage }">
					<a href="scorecard_list.do?page=${page+1 }&find_field=${find_field}&find_name=${find_name}">[다음]</a>
				</c:if>
			</c:if>
  		</div>
  		</form>
	</div>

</article>

<jsp:include page="/view/includes/footer.jsp" />
<br>






