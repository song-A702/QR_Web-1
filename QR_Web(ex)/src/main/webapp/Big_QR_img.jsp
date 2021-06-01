<%@ page import="java.io.File" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width-device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>[전자출입명부]</title>
<style>

div {
		text-align: center;
		margin-top: 150px;
	}

</style>
</head>
<body>
	<%
		String QRCode_name = null;
		if(session.getAttribute("QRCode_name") !=null){
			QRCode_name = (String)session.getAttribute("QRCode_name");
		}
	%>
	
	<div>
		<img src="${pageContext.request.contextPath}<%=QRCode_name %>" width = "500" hight = "500">
		<h1>저희 가게를 방문해주셔서 감사합니다😊<h1>
	</div>








<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
<script src="js/bootstrap.js"></script>
	
	
</body>
</html>