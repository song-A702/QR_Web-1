<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<title>출입자 전화번호 입력</title>
</head>
<body>
<form>
	<div class="form-group">
		<h2>출입자 전자명부 작성</h2>
		<form action="NumConn.jsp" method="post">
		<label for ="InputNumber">휴대번호 입력 :</label>
	 	<input type="text"  class="from-control" name="number" placeholder="휴대번호를 입력하세요"/>
	 	</div>
	</form>
		<button type="submit" >전송</button>
	
	
</body>
</html>