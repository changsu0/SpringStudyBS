<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사원관리</title>
</head>
<body>
	<h2>사원관리화면</h2>
	<table border="1">
		<tr>
			<th width="50">Check</th>
			<th width="50">No.</th>
			<th width="100">사번</th>
			<th width="100">사원명</th>
			<th width="80">부서</th>
			<th width="80">Email</th>
			<th width="80">생년월일</th>
			<th width="80">입사일</th>
			<th width="80">퇴사일</th>
		</tr>
		<tr>
			<td>체크박스 넣으세요</td>
			<td>List 순서</td>
			<td>알아서</td>
			<td>이름</td>
			<td>부서명</td>
			<td>Email</td>
			<td>DB는 yymmdd 화면에는 yy. mm. dd</td>
			<td>생년월일 동일</td>
			<td>생년월일 동일</td>
		</tr>
	</table>
	<a href="#this" class="btn" id="btnSearch">조회</a>
	<a href="#this" class="btn" id="btnWrite">등록</a>
	<a href="#this" class="btn" id="btnDelete">삭제</a>
	
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
</body>
</html>
