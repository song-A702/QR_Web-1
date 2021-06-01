<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.user" scope="page" />
<jsp:setProperty name="user" property="user_ID" />
<jsp:setProperty name="user" property="user_PW" />
<jsp:setProperty name="user" property="user_Name" />
<jsp:setProperty name="user" property="user_WN" />
<jsp:setProperty name="user" property="user_WpN" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[전자출입명부]</title>
</head>
<body>
	<%
		
	
		if(user.getUser_ID() == null || user.getUser_PW() == null || user.getUser_Name() == null ||
			user.getUser_WN() == null || user.getUser_WpN() == null ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
	%>
</body>
</html>