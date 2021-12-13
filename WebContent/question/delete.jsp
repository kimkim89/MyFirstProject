<%@page import="java.sql.Timestamp"%>
<%@page import="questionboard.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<jsp:include page="../inc/top.jsp"/>


	<jsp:useBean id="dao" class="questionboard.BoardDAO"/>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardVO vo = dao.getBoardInfo(num);
		
		String paramPass = "";
		
		String dbPass = "";
		dbPass = vo.getPass();
		
		if(request.getParameter("pass") != null) { 
			
			paramPass= request.getParameter("pass");
		
			if(!paramPass.equals(dbPass)){
	 %>
	 			<script type="text/javascript">
	 				window.alert("입력하신 비밀번호가 올바르지 않습니다.");
	 				history.go(-1); 
	 			</script>
	 <%		
			}else { 
					dao.deleteBoard(num);
			
					response.sendRedirect("question.jsp");
					
			}
			
		}
	 %>	
<html>
<head><title>Q/A Board</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	
	function check() {
		if (document.form.pass.value == "") {
		alert("패스워드를 입력하세요.");
		form.pass.focus();
		return false;
		}
		document.form.submit();
	}
</script>
</head>
<body>
<center>
<br><br>
<table width=50% cellspacing=0 cellpadding=3>
 <tr>
  <td bgcolor=#dddddd height=21 align=center>
      사용자의 비밀번호를 입력해 주세요.</td>
 </tr>
</table>
<table width=70% cellspacing=0 cellpadding=2>
<form name=form method=post action="delete.jsp" >

	<input type="hidden" name="num" value="<%=num%>">

 <tr>
  <td align=center>
   <table align=center border=0 width=91%>
    <tr> 
     <td align=center>  
	  <input type=password name="pass" size=17 maxlength=15>
	 </td> 
    </tr>
    <tr>
     <td><hr size=1 color=#eeeeee></td>
    </tr>
    <tr>
     <td align=center>
	  <input type=button value="삭제완료" onClick="check()"> 
      <input type=reset value="다시쓰기"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</form> 
</table>
</center>
</body>
</html>
