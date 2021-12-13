<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<header>
	<div id="wrap">
		<div id="header">
			<div style="height: 115px !important">
				<div class="logo">
					<img onclick="location.href='../index.jsp'"
						style="cursor: pointer;" src="../images1/moon_logo.png" alt="logo"
						height="115px" width="120px">
				</div>

				<%
					String id = (String) session.getAttribute("id");
					if (id == null) {
				%>
				<li style="list-style: none;">
				<a href="../member/login.jsp"
					style="color: white; text-decoration: none;"><b>Login</b></a>
					&nbsp; <a href="../member/join.jsp"
					style="color: white; text-decoration: none;"><b>Join Us</b></a></li>
				<%
					} else {
				%>

				<div id="now_login">
					<%=id%>님 로그인중... <a href="../member/logout.jsp"
						style="color: white; text-decoration:none;">logout |</a> <a href="../member/mUpdate.jsp"
						style="color: white; text-decoration: none;">회원정보수정</a>
				</div>
				<%
					}
				%>

				<ul id="navigation"
						style="text-align: center; padding-right: 105px; padding-top: 20px;">

						<li class="active"><a href="../index.jsp">
							<b style="margin: 0px -19px 0 0;">Main Page</b></a></li>
						
						<li><a href="../hotelgallery/hotelgallery.jsp">
							<b style="margin: 0px -19px 0 0;">Hotel Gallery</b></a></li>
							
						<li><a href="../membership/membership.jsp">
						<b style="margin: 0px -19px 0 0;">Membership</b></a></li>	
												
						<li><a href="../question/question.jsp"><b>Q/A Board</b></a></li>
						
						<li><a href="../contact/contact.jsp"><b>Contact Us</b></a></li>
						
					</ul>
			</div>
		</div>
	</div>
</header>