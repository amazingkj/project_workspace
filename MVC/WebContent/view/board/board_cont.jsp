<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" type="text/css" href="./css/common.css" />
 <link rel="stylesheet" type="text/css" href="./css/board.css" />
 <jsp:include page="/view/includes/header.jsp" /> 
 <script>
    // 좋아요 버튼을 클릭 시 실행되는 코드
$("#like").on("click", function () {
	$.ajax({
      url: '/board/board_cont',
      type: 'POST',
      data: { 'b_no': b_no, 'm_id': m_id },
      success: function (data) {
          if (data == 1) {             
              location.reload();
          } else {
              location.reload();
          }
      }, error: function () {
          console.log('오타 찾으세요')
      }

  });

  });

function openDelCheck(){
	var resultvalue = confirm('정말로 삭제하시겠습니까?');
	//var no=document.getElementById('b_no');
	//var page=document.getElementById('page');
	var frm = document.deletefrm;
	
	if(resultvalue==true){
		frm.action="board_del_ok.do";
		frm.submit();
		
		//document.deletefrm.submit();
		//location='board_del_ok.do';
		//location='board_cont.do?b_no=${bc.b_no}&page=${page}&state=del';
		//alert(page.value);
		//alert(no.value);
	}
	
}
    
    
     </script>
 
<meta charset="UTF-8">
<title>서블릿 MVC 게시판 내용보기 </title>
</head>
 <div class="clear"></div>
 <body class="tablebody">
 <Br><br>
<div id="bWrite_wrap" class="bWrite_wrap" style="margin-top: 200px" >
  <table id="bCont_t" class="tablebox">
   <tr>
    <td style="width:100px;" >제목</td><td class="bottom_line"><div class="b_title"><input name="b_title" class="textField" size="100%" value="${bc.b_title}"/></div></td>
   </tr>
   <tr>
    <td>내용</td><td class="bottom_line"><div class="b_cont" ><div class="textField" style="width:100%; height:500px; resize:none; border:none;" >${b_cont}</div></div></td>
   </tr>
   <tr>
    <td>조회수</td><td class="bottom_line"><div class="b_hit">${bc.b_hit}</div></td>
    </tr>
	 <tr>
    <td>좋아요</td><td>${bc.b_like}</td>
    </tr>

	<tr><td></td>
	<td class="buttontd" colspan="2">
	<form method="post" name="deletefrm">
   <input type="button" class="CheckBtn"  value="답변" onclick="location=
	   'board_cont.do?b_no=${bc.b_no}&page=${page}&state=reply';" />
	<c:if test="${id == bc.m_id}">
   <input type="button" class="CheckBtn"  value="수정" onclick="location=
	   'board_cont.do?b_no=${bc.b_no}&page=${page}&state=edit';" />
	   

<input type="hidden" id="b_no" name="b_no" value="${bc.b_no}"/>
<input type="hidden" id="page" name="page" value="${page}"/>
<input type="button" class="CheckBtn"  value="삭제" onclick="return openDelCheck();" />

	 </c:if> 
	    <input type="button" class="CheckBtn" class="buttontd" value="목록" onclick="location='board_list.do?page=${page}';" />	   	   	   
	 <c:if test="${id != bc.m_id}">
	 <c:if test="${!empty bc.b_like}">
   <input type="button" class="CheckBtn" id=like value="좋아요" onclick="return like();"/></input>
	</c:if>
	</c:if>
	
	<c:if test="${!empty id}">
	<c:if test="${empty bc.b_like}">
	<input type="button" class="CheckBtn" id=like value="좋아요 취소 " onclick="return like();"/></input>
     </c:if>
     </c:if>
     </form>
</td> 

   </tr>
  

   </table>
</div> 
</body>
</html>

 <jsp:include page="/view/includes/footer.jsp" /> 

