<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>


</head>
<link rel="stylesheet" type="text/css" href="./css/master1.css" />
<link rel="stylesheet" type="text/css" href="./css/board.css" />
<link rel="stylesheet" type="text/css" href="./css/common.css" />
<br />

<body>
	
	<div class="tab">
		<button class="tablinks" onclick="openCity(event, 'London')">회원 정보 관리</button>
		<button class="tablinks" onclick="openCity(event, 'Paris')">공지사항 등록</button>
		<button class="tablinks" onclick="openCity(event, 'Tokyo')">스코어 카드 관리 </button>
		<button class="tablinks" onclick="openCity(event, 'Seoul')">강의 등록 및 관리</button>
		<button class="tablinks" onclick="openCity(event, 'Mikuk')">필드 업체 등록 및 관리</button>
		<div style="float:right; margin:20px; padding:20px;">admin 님 환영합니다.</div>
	</div>
	
	
	

	<div id="London" class="tabcontent">
		<h3>회원 정보 관리</h3>
		
<table class="boardlist">
	<thead>
		<tr>
			<th scope="col"><a href="#">번호</a></th>
			<th scope="col"><span>회원 ID</span></th>			
			<th scope="col"><span>랭킹</span></th>
			<th scope="col"><a href="#">등급</a></th>
			<th scope="col"><a href="#">활동 지역</a></th>
			<th scope="col"><a href="#">가입 날짜</a></th>
		</tr>
	</thead>
	<tbody>
	
	<c:if test="${!empty blist}"> <%-- 검색전후 목록이 있는 경우 실행 --%>
     <c:forEach var="b" items="${blist}">
	
	
		<tr>
		
			<td class="boardNo"> 
			<c:if test="${b.b_step == 0}"> <%--원본글일 때만 글그룹번호를 출력 --%>
   		      ${b.b_ref}
       		</c:if>&nbsp;</td>

			<td class=boardSubject style="text-align:left; padding-left: 5px">
			<c:if test="${b.b_step != 0}"> <%--답변글일때만 실행, 들여쓰기와 답변글 이미지 노출 --%>
         	<c:forEach begin="1" end="${b.b_step}" step="1">
        		  &nbsp; <%--답변글만큼 들여쓰기 --%>
        	 </c:forEach>
         	<i class="fas fa-reply fa-rotate-180" style="font-size:1.7em; color:#cdcdcd"></i><%--답글 아이콘 --%>
     	   </c:if>
     		 <a href="board_cont.do?b_no=${b.b_no}&page=${page}&state=cont">${b.b_title}</a>
    		</td>
			
       			<td class="boardWriter">${b.m_id}</td>
         		<td class="boardDate">${b.b_date}</td>
         		<td class="boardlike"><i class="fas fa-heart" style="color:#56F569"></i>&nbsp;&nbsp;&nbsp;${b.b_like}</td>
     			<td class="boardView">${b.b_hit}</td>
			
			 </tr>
     </c:forEach>
    </c:if>

	<c:if test="${empty blist}">
	<tr>
  	<th colspan="6">회원 목록이 없습니다.</th>
     </tr>
    </c:if>

	</tbody>
</table>

<!-- 게시판 하단 목록 검색 쓰기 버튼-->
	<div class="fl_fr" id="bListW_menu">
	<div class="fl" >
		
			<c:if test="${(!empty find_field) && (!empty find_name)}"> <%--검색이후 --%>
    		<input type="button" name="list" value="목록" onclick="location='board_list.do?page=${page}';" />
     		</c:if>

			<select id="search_target" name="find_field">
					<option value="title_cont" <c:if test="${find_field =='title_cont'}">${'selected'}
        			 </c:if>>ID</option>
					<option value="b_title" <c:if test="${find_field =='b_title'}">${'selected'}
        			 </c:if>>등급</option>
					<option value="b_cont" <c:if test="${find_field =='b_cont'}">${'selected'}
        			 </c:if>>지역</option>
					<option value="m_id" <c:if test="${find_field =='m_id'}">${'selected'}
        			 </c:if>>가입일</option> 
				
				<%-- 댓글때문에 테이블 작업 다시 해야함 *** 	
				
				<option value="comment" <c:if test="${find_field =='b_comm'}">${'selected'}
        			 </c:if>>댓글</option>	--%>
			
					
			</select>

			

			</div>
				<div class="search_container" >
					<%-- <form class="searchForm" action="." method="post">--%>
						<input id="search" class="search" name="find_name"  type="search" value="${find_name}" placeholder="검색어를 입력해 주세요">
						<button class="icon" type="submit" ><i class="fas fa-search"></i>
						</button>
				
				</div>
	
	<br><br>
	</div>
		

    
     <%--검색전후 페이징(쪽나누기) --%>
  
	<div id="bList_paging" class="page_control">
	 <%--검색 전 페이징 --%>
	  <c:if test="${(empty find_field) && (empty find_name)}"> <%--검색필드와 검색어가 없는 경우 --%>
     <c:if test="${page<=1}"><i class="fas fa-angle-left"></i>
     </c:if>
     <c:if test="${page>1}">
      <a href="board_list.do?page=${page-1}"><i class="fas fa-angle-left"></i></a>
     </c:if>
     <%--현재 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
      <c:if test="${a == page}">${a}<%-- 현재 페이지가 선택된 경우 --%>
      </c:if>
      <c:if test="${a != page}"><%--현재페이지가 선택 안된 경우 --%>
      <a href="board_list.do?page=${a}">${a}</a>
      </c:if>      
     </c:forEach>
     
     <c:if test="${page >= maxpage}">
      <i class="fas fa-angle-right"></i>
      </c:if>
      <c:if test="${page < maxpage}">
      <a href="board_list.do?page=${page+1}"><i class="fas fa-angle-right"></i></a>
      </c:if>
    </c:if>
    
    <%--검색이후 페이징(쪽나누기)--%>
    <c:if test="${(!empty find_field) || (!empty find_name)}"> 
      <c:if test="${page<=1}">
      <i class="fas fa-angle-left"></i>
     </c:if>
     <c:if test="${page>1}">
      <a href="board_list.do?page=${page-1}&find_field=${find_field}&find_name=${find_name}"><i class="fas fa-angle-left"></i></a>
      <%--get으로 find_field와 find_name을 전달해야 검색이후 페이징 목록을 유지한다. 검색필드와 검색어를 전달하지 않으면
      검색전 전체 페이징 목록으로 이동해서 검색효과가 사라진다. --%>
     </c:if>
     
     <%--현재 쪽번호 출력 --%>
     <c:forEach var="a" begin="${startpage}" end="${endpage}" step="1">
      <c:if test="${a == page}">${a}<%-- 현재 페이지가 선택된 경우 --%>
      </c:if>
      <c:if test="${a != page}"><%--현재페이지가 선택 안된 경우 --%>
      <a href="board_list.do?page=${a}&find_field=${find_field}&find_name=${find_name}">${a}</a>
      </c:if>      
     </c:forEach>
     
     <c:if test="${page >= maxpage}">
       <i class="fas fa-angle-right"></i>
      </c:if>
      <c:if test="${page < maxpage}">
      <a href="board_list.do?page=${page+1}&find_field=${find_field}&find_name=${find_name}"><i class="fas fa-angle-right"></i></a>
      </c:if>
    </c:if>    
   </div>
</div>

	<div id="Paris" class="tabcontent">
		<h3>공지사항 등록</h3>
		<p></p>
	</div>

	<div id="Tokyo" class="tabcontent">
		<h3>스코어 카드 관리</h3>
		
		<a href="admin_insertCard.do">스코어카드 등록</a>
	</div>
	<div id="Seoul" class="tabcontent">
		<h3>강의 등록 및 관리</h3>
			<a href="class_insert.do">클래스 등록</a>
		
		<p></p>
	</div>
	<div id="Mikuk" class="tabcontent">
		<h3>필드 업체 등록 및 관리</h3>
		<p></p>
	</div>

	<script>
		function openCity(evt, cityName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
	</script>

</body>
</html>
