<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel the Moon</title>
<link rel="stylesheet" href="css1/style.css" type="text/css">
<link href="../css/login.css" rel="stylesheet" type="text/css">


</head>
<body>
	<header>
		<div id="wrap">
			<div id="header">
				<div style="height: 115px !important;">
					<div class="logo">
						<img onclick="location.href='index.jsp'" style="cursor: pointer;"
							src="images1/moon_logo.png" alt="logo" height="115px"
							width="200px">
					</div>

					<%
						String id = (String) session.getAttribute("id");
						if (id == null) {
					%>
					<li style="list-style: none;">
						<a href="member/login.jsp" style="color: white; text-decoration: none;" ><b>Login</b></a>
						&nbsp; <a href="member/join.jsp" style="color: white; text-decoration: none;"><b>Join
								Us</b></a></li>
					<%
						} else {
					%>

					<div id="now_login">
						<%=id%>님 로그인중... <a href="member/logout.jsp"
							style="color: white; text-decoration: none;">logout |</a> <a href="member/mUpdate.jsp"
							style="color: white; text-decoration: none;">회원정보수정</a>
					</div>
					<%
						}
					%>

					<ul id="navigation"
						style="text-align: center; padding-right: 105px; padding-top: 20px;">

						<li class="active"><a href="index.jsp">
							<b style="margin: 0px -19px 0 0;">Main Page</b></a></li>
						
						<li><a href="hotelgallery/hotelgallery.jsp">
							<b style="margin: 0px -19px 0 0;">Hotel Gallery</b></a></li>
							
						<li><a href="membership/membership.jsp">
						<b style="margin: 0px -19px 0 0;">Membership</b></a></li>	
												
						<li><a href="question/question.jsp"><b>Q/A Board</b></a></li>
						
						<li><a href="contact/contact.jsp"><b>Contact Us</b></a></li>
						
					</ul>
				</div>
			</div>
		</div>
	</header>

	<br>
	<div id="adbox">
		<div class="clearfix">
			<img src="images1/bedroom1.jpg" alt="Img" height="700" width="1500">

		</div>
	</div>
	<br><br><br><br><br><br><br><br>
	<div id="contents">
		<div id="tagline" class="clearfix">
			<h1 style="text-align:center; font:70px;" >
				<b>Welcome to Hotel the Moon Membership</b>
			</h1>
			<div>
				<p>	Hotel the Moon provides the most extraordinary benefits for you! 
					
				</p>
				<p>	Register for the Hotel the Moon Membership<br> 
					and experience the most special moment!</p>
			</div>
			<div>
				<p> Hotel the Moon이 제공하는 가장 특별한 혜택 Hotel the Moon Membership </p>
				<p>Hotel the Moon Membership에 가입하여 <br> 다양하고 즐거운 혜택을 경험해보세요.</p>
		
			</div>
		</div>
	</div>

	<div id="footer">
		<div class="clearfix">
			<div id="connect">
				<a href="https://www.facebook.com" target="_blank" class="facebook"></a><a
					href="https://www.google.com" target="_blank" class="googleplus"></a><a
					href="https://www.twitter.com" target="_blank" class="twitter"></a><a
					href="https://www.tumblr.com/" target="_blank" class="tumbler"></a>
			</div>
			<p style="color:white;"><big>© 2022 Jaein Kim. All Rights Reserved.</big></p>
		</div>
	</div>

</body>
</html>