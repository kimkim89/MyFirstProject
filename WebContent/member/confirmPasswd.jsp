<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

	<%
		String passwd = request.getParameter("passwd"); 
		String content = (String)session.getAttribute("content");
	%>
	
		<h3 style="text-align: center; margin-top: 100px;"> 회원님의 비밀번호는
		<span id="em-span"><%=passwd %></span> 입니다</h3>
  		<br><br>

		<h5 style="text-align: center;"><a href="login.jsp" style="font-size: 15px; ">로그인 하러 가기</a></h5>
	

</body>
</html>