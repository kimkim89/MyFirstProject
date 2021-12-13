<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>

<%
	String id = (String)session.getAttribute("id");
	String pass = request.getParameter("passwd");

	MemberDAO mdao = new MemberDAO();

	int check = mdao.getPass(id, pass);
	
	if(check ==1){
		response.sendRedirect("memberUpdate.jsp");
	}else{
%>	
		<script type="text/javascript">
			alert("비밀번호를 틀렸습니다.");
			history.back();
		</script>
<%		
	}
%>

<body>

</body>
</html>