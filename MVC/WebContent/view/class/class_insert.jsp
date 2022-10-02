<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	관리자 페이지 1. 클래스 등록

	<div class="admin_table">
		<form name="a" method="post" action="class_insert_ok.do">
			<table id="insert_class">
				<tr>
					<th>클래스명</th>
					<td><input name="c_title" id="c_title" size="100" /></td>
				</tr>

				<tr>
					<th>클래스 강사명</th>
					<td><input name="c_teacher" id="c_teacher" size="50" /></td>
				</tr>

				<tr>
					<th>강사 소개 또는 경력사항</th>
					<td><input name="c_career" id="c_career" size="200" /></td>
				</tr>

				<tr>
					<th>클래스 전화번호</th>
					<td><input name="c_phone" id="c_phone" size="100" /></td>
				</tr>

				<tr>
					<th>강사 성별</th>
					<td><input name="c_gender" id="c_gender" size="100" /></td>
				</tr>

				<tr>
					<th>클래스 종류</th>
					<td><input name="c_kind" id="c_kind" size="100" /></td>
				</tr>

				<tr>
					<th>클래스 기본항목</th>
					<td><input name="c_info" id="c_info" size="100" /></td>
				</tr>

				<tr>
					<th>클래스 패키지 설명</th>
					<td><input name="c_desc" id="c_desc" size="100" /></td>
				</tr>

				<tr>
					<th>1회당 레슨시간(분)</th>
					<td><input name="c_time" id="c_time" size="100" /></td>
				</tr>

				<tr>
					<th>레슨 횟수</th>
					<td><input name="c_count" id="c_count" size="100" /></td>
				</tr>

				<tr>
					<th>가격</th>
					<td><input name="c_price" id="c_price" size="100" /></td>
				</tr>

				<tr>
					<th>클래스 지역</th>
					<td><input name="c_addr" id="c_addr" size="100" /></td>
				</tr>

				<tr>
					<th>이미지 경로</th>
					<td><input name="c_image" id="c_image" size="100" /></td>
				</tr>
			</table>
		<input type="submit" value="클래스 등록" />
	</form>

	</div>


</body>
</html>