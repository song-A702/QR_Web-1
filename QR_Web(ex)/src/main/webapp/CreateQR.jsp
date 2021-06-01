<%@ page import="com.google.zxing.qrcode.QRCodeWriter"%>
<%@ page import="java.io.File, java.util.UUID" %>
<%@ page import="java.awt.image.BufferedImage, javax.imageio.ImageIO" %>
<%@ page import="com.google.zxing.common.BitMatrix"%>
<%@ page import="com.google.zxing.BarcodeFormat"%>
<%@ page import="com.google.zxing.client.j2se.MatrixToImageWriter"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%

	String url = request.getParameter("url");
	int nCheck = 1;
	String savedFileName = "QRcode.png";
	
	if(url==null || url.equals("") || !url.startsWith("http")){
		nCheck=0;
	}
	else{
		File path = new File("C:\\QR_Code");
		if(!path.exists()) path.mkdir();
		
		QRCodeWriter writer = new QRCodeWriter();
		BitMatrix qrCode = writer.encode(url, BarcodeFormat.QR_CODE, 200, 200);
		BufferedImage qrImage = MatrixToImageWriter.toBufferedImage(qrCode);
		ImageIO.write(qrImage, "PNG", new File(path + "\\" + savedFileName));
		}

	
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>[전자출입명부]</title>
</head>
<body>
<h1>QRcode 생성</h1>
<%
	if(nCheck == 1){
		out.println("QR코드가 C드라이브 'QR_Code' 폴더에 생성되었습니다. :-)<p/>");
	}
	else{
		out.print("잘못된 URL 입니다.<p/>");
	}

%>

<a href="QRCode.jsp">다시 생성</a>
</body>
</html>
