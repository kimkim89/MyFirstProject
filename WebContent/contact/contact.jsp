<%@page import="javafx.scene.control.Alert"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<link rel="stylesheet" href="css1/style.css" type="text/css">
	<link href="../css1/style.css" rel="stylesheet">
	<link href="../css/member.css" rel="stylesheet">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../inc/top.jsp" />

	<div id="contents" style="margin:0 auto !important;">
		<div class="section">
			<h1 style="text-align: center;"><b>Contact Us</b></h1>
			<p> If you have any question about our membership, <br> please don't hesitate to contact us.<br>
				We hope you have the most comfortable travel with our service<br>
			<br><br>
				멤버십에 관하여 질문이 있으신 경우에는 <br> 언제든지 Hotel the Moon 고객 센터로 연락주세요.<br>
				Hotel the Moon과 함께 편안한 여행 및 여가 시간을 보내시길 바랍니다.	
				<br>			
			</p>
			<form action="contactPro.jsp" method="post" class="message">
				<input type="text" name="name" placeholder="name" onFocus="this.select();" onMouseOut="javascript:return false;"/> 
				<input type="text" name="phone" placeholder="phone" onFocus="this.select();" onMouseOut="javascript:return false;"/>
				<input type="text" name="email" placeholder="email" onFocus="this.select();" onMouseOut="javascript:return false;"/>
				<input type="text" name="subject" placeholder="subject" onFocus="this.select();" onMouseOut="javascript:return false;"/>
				<textarea name="content">
				</textarea>
				<input type="submit" value="Send" />
			</form>
		</div>
		<div class="section contact" style="height:702px;">
			<p>
				For Any Questions : <span style="font-size: 24px;"> 82) 070-001-0011</span>
			</p>
			<p>
				Or you can visit us at: <span>Hotel The Moon<br> <small style="font-size: 15px;">109 Dongcheon-ro,<br> Busanjin-gu, Busan,<br> Republic of Korea 47246</small></span>
			</p>
			<p> Hotel Direct : <span style="font-size: 24px;"> 82) 070-001-1155</span></p>
			<p> For 24 Hour Reservation : <span style="font-size: 24px;"> 82) 070-555-7878</span></p>
			
		</div>
	</div>


</body>
</html>