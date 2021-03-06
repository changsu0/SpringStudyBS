<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>사원관리</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
	
	
	<h2>사원등록</h2>
	
	
	<form class="form-horizontal" name="frm" id="frm" action="">
	
	<c:choose>
	    <c:when test="${ err.msg ne null }">
	        <div class="form-group has-error">
	    </c:when>
	    <c:otherwise>
	        <div class="form-group">
	    </c:otherwise>
	</c:choose>
	    <label class="control-label col-sm-4" for="empNo">사번:</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" name="empNo" id="empNo"  placeholder="${ err.msg }" maxlength="10">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-4" for="empNm">사원명:</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" name="empNm" id="empNm" 
	      placeholder="" maxlength="10" value="${ err.empNm }">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-4" for="deptNo">부서:</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" name="deptNo" id="deptNo" 
	      placeholder="" maxlength="10" value="${ err.deptNo }">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-4" for="email">Email:</label>
	    <div class="col-sm-8">
	      <input type="email" class="form-control" name="email" id="email" 
	      placeholder="" maxlength="50" value="${ err.email }">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-4" for="birth">생년월일:</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" name="birth" id="birth" 
	      placeholder="YYMMDD" maxlength="6" autocomplete="off" value="${ err.birth }">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-4" for="stDt">입사일:</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" name="stDt" id="stDt" 
	      placeholder="YYMMDD" maxlength="6" autocomplete="off" value="${ err.stDt }">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-4" for="enDt">퇴사일:</label>
	    <div class="col-sm-8">
	      <input type="text" class="form-control" name="enDt" id="enDt" 
	      placeholder="YYMMDD" maxlength="6" autocomplete="off" value="${ err.enDt }">
	    </div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-8">
		  <button type="button" class="btn btn-success" id="btnSave">저장</button>
		  <button type="button" class="btn btn-default" id="btnList">목록</button>
	    </div>
	  </div>
	</form>
	
	<script type="text/javascript">
		$( function() {
			$( "#birth" ).datepicker({
				  dateFormat: "ymmdd"
			});
			$( "#stDt" ).datepicker({
				  dateFormat: "ymmdd"
			});
			$( "#enDt" ).datepicker({
				  dateFormat: "ymmdd"
			});
		} );


	  
		$(document).ready(function() {
			
			$('#btnSave').click(function(){

				if($('#empNo').val() === null || $('#empNo').val() === ''){
					alert('사번은 필수입력');
					return false;
				}
				
				if(confirm("저장할?")){
					$('#frm').attr('action', '/user/userMgmtSave.go');
					$('#frm').submit();
				}
			});
			$('#btnList').click(function(){
				$('#frm').attr('action', '/user/userMgmtList.go');
				$('#frm').submit();
			});
		});
	</script>
</body>
</html>
