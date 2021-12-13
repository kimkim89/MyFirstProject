<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@page import="email.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 인증 </title>
</head>

<%
	Random r = new Random();

	String content = r.randomNum();
	
	session.setAttribute("content", content);
	
	String id = request.getParameter("id");
	
	MemberDAO mdao = new MemberDAO();
	
	MemberDTO mdto = mdao.getMember(id);
%>

<body>

	<form id="main-contact-form" name="contact-form" method="post" action="./../mailSend" style="max-width:400px; margin:50px auto;">

	<h3>고객님의 ID는 <span id="em-span"><%=id %></span> 입니다.</h3>
	
	<br><br>
	
	비밀번호 찾기 
	<br>
	
	<div class="input-container">
	<span class="log-span">email</span> 
	<input type="email" class="input-field" name="receiver" value="<%=mdto.getEmail()%>">
	</div>
	<br>
	<input type="submit" class="btn-log-2" style="height: 50px;" value="인증번호 받기">
	<input type="hidden" name="content" value="<%=content%>">
	<input type="hidden" name="name" value="<%=mdto.getName()%>">
	<input type="hidden" name="sender" class="form-control" placeholder="Email Address" required="required" value="hotelthemoon11@gmail.com">
	<input type="hidden" name="id" value="<%=id%>">
      </form>
      


</body>
</html>