<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript">
	function CheckValue(){
		if(!document.member_delete.pwd.value) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	}
</script>

</head>
<body>
		<jsp:include page="../inc/top.jsp" />
		
		<%
			String id = (String)session.getAttribute("id");
			
			MemberDAO mdao = new MemberDAO();
			
			mdao.deleteMember(id);
			
			session.invalidate();
		%>

<script>
			alert("탈퇴되었습니다.");
	
			location.href="../index.jsp";
</script>
		

</body>
</html>