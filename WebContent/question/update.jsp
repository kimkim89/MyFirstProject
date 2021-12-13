<%@page import="java.sql.Timestamp"%>
<%@page import="questionboard.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<html>
<head><title>JSPBoard</title>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
	<jsp:include page="../inc/top.jsp"/>
	
<script>
	//수정을 위해 패스워드를 입력하면 if문을 통하지 않고 바로 document.form.submit();문을 타서 수정됨.
	//수정을 위해 패스워드를 입력하지 않으면, if문을 통한 후, return false를 통해 if문을 빠져나감 (이유: 비밀번호 없이 글 수정되면 안되니까)
	function check() {
	   if (document.form.pass.value == "") {
		 alert("수정을 위해 패스워드를 입력하세요.");
	     form.pass.focus();
		 return false;
		 }
	   document.form.submit(); //name값이 form인 form태그가 위치해 있는 UpdateProc.jsp로 수정했던 값들이 전송됨.
	}
</script>
</head>
<body>

		<%--
			Read.jsp페이지에서 수정링크 클릭했을 때 수정할 글번호를 request내장객체영역에 저장한 후,
			Update.jsp로 전송해 Update.jsp페이지에서는 수정하기전 수정할 글 번호를 이용해
			한번 더 글을 검색한 후 아래의 디자인 화면에 출력하자.
		 --%>

		<jsp:useBean id="bdao" class="questionboard.BoardDAO" />
		
		<%
			//수정할 글번호 얻기
			//Read.jsp페이지에서 <a href >태그로 수정페이지를 호출했을 때 num을 넘겨주기 때문에 아래와 같이 전달된 num을 가져와야함.
			int num = Integer.parseInt(request.getParameter("num")); //getParameter()메소드는 항상 String타입을 반환하기 때문에 Integer형태로 바꿔주기 
		
			//수정할 글번호를 getBoardInfo()메소드에 전달하여 하나의 글 정보를 검색한 후, BoardDto객체에 저장한 후 반환받음.
			BoardVO vo = bdao.getBoardInfo(num);
			
			String name = vo.getwriterID();
			Timestamp date = vo.getDate();
			String subject = vo.getSubject();
			String content = vo.getContent();
			
		%>



<center>
<br><br>
<table width=460 cellspacing=0 cellpadding=3>
  <tr>
   <td bgcolor=lightgray  height=21 align=center class=m>수정하기</td>
  </tr>
</table>

<form name=form method=post action="updatePro.jsp" >

<input type="hidden" name="num" value="<%=num%>">


<table width=70% cellspacing=0 cellpadding=7>
 <tr>
  <td align=center>
   <table border=0>
    <tr>
     <td width=20%>작성자 ID</td>
     <td width=80%>
	  <input type=text name=name size=30 maxlength=20 value="<%=name%>" disabled>
	 </td>
	</tr>
    <tr>
     <td width=20%>작성 날짜</td>
     <td width=80%>
	  <input type=text name=email size=30 maxlength=30 value="<%=date%>" disabled>
	 </td>
    </tr>
	<tr>
     <td width=20%>제 목</td>
     <td width=80%>
	  <input type=text name=subject size=50 maxlength=50 value="<%=subject%>">
	 </td>
    <tr>
     <td width=20%>내 용</td>
     <td width=80%>
	  <textarea name=content rows=10 cols=50><%=content%></textarea>
	 </td>
    </tr>
	<tr>
     <td width=20%>비밀 번호</td> 
     <td width=80%><input type=password name=pass size=15 maxlength=15>
      수정시에는 비밀번호가 필요합니다.</td>
    </tr>
	<tr>
     <td colspan=2 height=5><hr size=1></td>
    </tr>
	<tr>
     <td colspan=2>
	  <input type=Button value="수정완료" onClick="check()">
      <input type=reset value="다시수정"> 
      <input type=button value="뒤로" onClick="history.back()">
	 </td>
    </tr> 
   </table>
  </td>
 </tr>
</table>
</form> 
</center>
</body>
</html>