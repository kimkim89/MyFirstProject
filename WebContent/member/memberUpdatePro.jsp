<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 정보 수정 DB</title>
</head>
<body>
<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		//update.jsp에서 전달받은 데이터중... pageNum값 얻기
		String id = request.getParameter("id");
		
		//액션태그 useBean으로  BoardBean객체 생성
		//하는일 : update.jsp에서 요청한 request영역의 값을 꺼내서 BoardBean객체에 저장
%>
	
	<jsp:useBean id="mdto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="mdto"/>

	

	<%
		//DB작업할 BoardDAO객체 생성
		MemberDAO mdao = new MemberDAO();
		
	int check = mdao.updateMember(mdto);
	
	if(check ==1){
%>	

	<script>
		alert("회원정보수정이 완료되었습니다.");
		location.href="../index.jsp";
	</script>
<%}else {

%>
	<script>
		alert("회원정보수정에 실패하였습니다.");
		location.href = history.back();
	</script>
<%
}
%>
	
</body>
</html>