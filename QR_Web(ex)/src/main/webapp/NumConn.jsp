<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.sql.*"
    pageEncoding="UTF-8"%>
<%@ page import="cust.Cust" %>
<%@ page import="cust.CustDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset ="UTF-8">
<title></title>

</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	

	String number =request.getParameter("number");
	
	Connection conn =null;
	PreparedStatement pstmt =null;
	String url ="jdbc:mysql://localhost:3306/CUST?characterEncoding=UTF-8&serverTimezone=UTC";
	String user ="root", pw = "root";
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	conn = DriverManager.getConnection(url,user,pw);
	
	String sql = "INSERT INTO CUST (number) VALUES (?)";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, number);
	
	pstmt.executeUpdate();
	
	pstmt.close();
	conn.close();
	

%>
<script>
alert("저장 성공!");
</script>

</body>

</html>
	