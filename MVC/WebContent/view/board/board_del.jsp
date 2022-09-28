<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="./js/jquery.js"></script>
 <link rel="stylesheet" type="text/css" href="./css/common.css" />
 <link rel="stylesheet" type="text/css" href="./css/board.css" />
</head>
<body>
<br><br>
<div id="bDel_wrap"  style="margin-top: 200px" >
<h2 class="bDal_title">게시물 삭제</h2>
<form method="post" action="board_del_ok.do">
<input type="hidden" name="b_no" value="${bc.b_no}"/>
<input type="hidden" name="page" value="${page}"/>
<table>
 <tr>
 <th>정말 삭제하시겠습니까?</th>
 </tr>
</table>
<div id="bDel_menu">
 <input type="submit" class="CheckBtn" value="삭제" >
 <input type="reset" class="CheckBtn" value="취소"
  onclick="window.close();" />
</div>
</form>
</div>
</body>