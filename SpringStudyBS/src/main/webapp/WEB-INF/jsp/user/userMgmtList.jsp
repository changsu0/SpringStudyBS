<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>사원관리</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">SpringStudyBS</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="/index.jsp">Home</a></li>
	      <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">사원관리
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="/user/userMgmtList.go">사원관리목록</a></li>
	          <li><a href="/user/userMgmtWrite.go">사원등록</a></li>
            </ul>
	      </li>
	      <li><a href="#">공통코드관리</a></li>
	      <li><a href="#">메뉴관리</a></li>
	    </ul>
	  </div>
	</nav>
	
	<h2>사원목록</h2>
	
	<form name="frm" id="frm" action="">
		<table class="table">
			<thead>
				<tr>
					<th width="50">No.</th>
					<th width="50">Check</th>
					<th width="100">사번</th>
					<th width="100">사원명</th>
					<th width="80">부서</th>
					<th width="80">Email</th>
					<th width="80">생년월일</th>
					<th width="80">입사일</th>
					<th width="80">퇴사일</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="userList" items="${list}">
					<tr>
						<td>${userList.rowNo}<input type="hidden" name="rowNo" value="${userList.rowNo}" /></td>
						<td>
							<input type="checkbox" name="chk" id="chk${userList.rowNo}" />
							<input type="hidden" name="hidchk" id="hidchk${userList.rowNo}" value="N" />
						</td>
						<td><a href="javascript:fn_userDetail('${userList.empNo}')">${userList.empNo}</a><input type="hidden" name="empNo" value="${userList.empNo}" /></td>
						<td>${userList.empNm}<input type="hidden" name="empNm" value="${userList.empNm}" /></td>
						<td>${userList.deptNo}<input type="hidden" name="deptNo" value="${userList.deptNo}" /></td>
						<td>${userList.email}<input type="hidden" name="email" value="${userList.email}" /></td>
						<td>${userList.birth}<input type="hidden" name="birth" value="${userList.birth}" /></td>
						<td>${userList.stDt}<input type="hidden" name="stDt" value="${userList.stDt}" /></td>
						<td>${userList.enDt}<input type="hidden" name="enDt" value="${userList.enDt}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	<button type="button" class="btn btn-default" id="btnWrite">사원등록</button>
	<button type="button" class="btn btn-danger" id="btnDelete">사원삭제</button>
	
	<form id="hidFrm" style="display: none;">
		<input type="hidden" name="empNo" id="empNo" />
	</form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#btnWrite').click(function(){
				$('#frm').attr('action', '/user/userMgmtWrite.go');
				$('#frm').submit();
			});
			
			$('#btnDelete').click(function(){
				if(confirm("삭제할?")){
					$('#frm').attr('action', '/user/userMgmtDelete.go');
					$('#frm').submit();
				}
			});

			$('input[name="chk"]').change(function(){
				console.log( $(this).prop('checked') );
				if( $(this).prop('checked') ){
					$('#hid' + $(this).attr('id') ).val('Y');
				}else{
					$('#hid' + $(this).attr('id') ).val('N');
				}
			});
		});

		function fn_userDetail( empNo ){
			$('#empNo').val(empNo);
			$('#hidFrm').attr('action', '/user/userMgmtDetail.go');
			$('#hidFrm').submit();
		}
	</script>
</body>
</html>
