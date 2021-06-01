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

<script type="text/javascript" src="http://code.jquery.com/jquery.js>"></script>
<script type="text/javascript">
var stmnLEFT = 10; // 오른쪽 여백 
var stmnGAP1 = 0; // 위쪽 여백 
var stmnGAP2 = 150; // 스크롤시 브라우저 위쪽과 떨어지는 거리 
var stmnBASE = 150; // 스크롤 시작위치 
var stmnActivateSpeed = 35; //스크롤을 인식하는 딜레이 (숫자가 클수록 느리게 인식)
var stmnScrollSpeed = 20; //스크롤 속도 (클수록 느림)
var stmnTimer; 

function RefreshStaticMenu() { 
 var stmnStartPoint, stmnEndPoint; 
 stmnStartPoint = parseInt(document.getElementById('STATICMENU').style.top, 10); 
 stmnEndPoint = Math.max(document.documentElement.scrollTop, document.body.scrollTop) + stmnGAP2; 
 if (stmnEndPoint < stmnGAP1) stmnEndPoint = stmnGAP1; 
 if (stmnStartPoint != stmnEndPoint) { 
  stmnScrollAmount = Math.ceil( Math.abs( stmnEndPoint - stmnStartPoint ) / 15 ); 
  document.getElementById('STATICMENU').style.top = parseInt(document.getElementById('STATICMENU').style.top, 10) +
  ( ( stmnEndPoint<stmnStartPoint ) ? -stmnScrollAmount : stmnScrollAmount ) + 'px'; 
  stmnRefreshTimer = stmnScrollSpeed; 
  }
 stmnTimer = setTimeout("RefreshStaticMenu();", stmnActivateSpeed); 
 } 
function InitializeStaticMenu() {
 document.getElementById('STATICMENU').style.right = stmnLEFT + 'px';  //처음에 오른쪽에 위치. left로 바꿔도.
 document.getElementById('STATICMENU').style.top = document.body.scrollTop + stmnBASE + 'px'; 
 RefreshStaticMenu();
 }
</script>

<style type="text/css">
			#STATICMENU { margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px;}
</style>

</head>

<body onload="InitializeStaticMenu();">
	<%
		String User_ID = null;
		if(session.getAttribute("User_ID") !=null){
			User_ID = (String)session.getAttribute("User_ID");
		}
		
		String QR_name = null;
		if (session.getAttribute("QR_name") !=null){
			QR_name = (String)session.getAttribute("QR_name");	
		}
		
	%>


	<nav class ="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="login.jsp">사업장 QR 홈페이지</a>
		</div>
		
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a href="CF.jsp">출입명부 확인하기</a></li>
				</ul>
				
			<%
				if(User_ID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">접속하기<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href=login.jsp>로그인</a></li>
						<li><a href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>	
			<%
				}else{
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">회원관리<span class="caret"></span></a>
					
					<ul class="dropdown-menu">
						<li><a href=logoutAction.jsp>로그아웃</a></li>
					</ul>
				</li>
			</ul>	
			<%
				}
			%>
						
		</div>
	</nav>
	<div id="STATICMENU">
		<%
			File path = new File(application.getRealPath("/") + "QR_Code");
			File files [] = path.listFiles();
			String files_path = null;
			String qrpath = "/QR_Code/" + "QRcode_" + User_ID + ".png";
			String compare_qrname = application.getRealPath("/") + "QR_Code\\" + "QRcode_" + User_ID + ".png";
			int result = 0;
			
			for(int i = 0; i < files.length; i++) {
				files_path = files[i].toString();
				if(files_path.equals(compare_qrname) == true){
					result = 1;
				}
			}
			if (result == 0){
		%>
					<figure>
						<img src="${pageContext.request.contextPath}/qr_img/qrcode_icon.png" width="100" height="100">
						<figcaption><button onclick="location.href='QRCode.jsp'">QR코드 생성</button></figcaption>
					</figure>
		<%
			}	else{
					session.setAttribute("QRCode_name", qrpath );
		%>
				<figure>
					<a href = "Big_QR_img.jsp"><img src="${pageContext.request.contextPath}<%=qrpath %>" width="100" height="100"></a>
					<figcaption><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;출입명부<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;QR코드</p></figcaption>
				</figure>
			
		<%
				}
			
		%>
	
	
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>	
	<script src="js/bootstrap.js"></script>
	
	
</body>
</html>