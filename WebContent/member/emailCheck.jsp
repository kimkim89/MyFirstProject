<%@page import="member.passwd"%>
<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>이메일 인증</title>
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<link href="../css/login.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<%
	String content = (String)session.getAttribute("content");
	String id= request.getParameter("id");
	
	MemberDAO mdao = new MemberDAO();
	MemberDTO mdto = mdao.getMember(id);
	String passwd = mdto.getPasswd();

	
%>


<script type="text/javascript">

	function checkConfirmPass() {
		var code = document.fr.con_chk.value;
		var authNum = <%=content%>;
		
		if(!code && code=="") {
			alert("인증번호를 입력해주세요");
			return false;
		}
		
		if(authNum == code) {
			
			alert("인증 성공!");
			
		<%
			session.removeAttribute("content");
		%>
			document.fr.submit();
			
		} else {
			alert("인증번호가 틀립니다. 다시 입력해 주세요.");
			return false;
		}
	}
</script>

</head>
<body>
		<jsp:include page="../inc/top.jsp" />
		<h3 style="text-align: center; margin-top: 100px;"> <span id="em-span"><%=id%></span>님 인증번호를 입력해주세요</h3>
	
	<form name="fr" method="post" action="confirmPasswd.jsp" style="max-width:400px; margin:50px auto;">

	
	<div class="input-container">
	<span class="log-span2">인증번호</span> 
	<input type="text" class="input-field" name="con_chk">
	<input type="hidden" name="passwd" value="<%=passwd%>"> 
	</div>
	<br>
	<input type="button" class="btn-log-2" onclick="checkConfirmPass(); return false;" style="height: 50px;" value="입력">
     </form>
</body>
</html>