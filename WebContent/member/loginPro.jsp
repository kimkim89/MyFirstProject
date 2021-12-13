<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");

		
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		
		MemberDAO memberdao = new MemberDAO();
		//check == 1 	-> 아이디, 비밀번호 맞음
		//check == 0 	-> 아이디 맞음, 비밀번호 틀림
		//check == -1 	-> 아이디 틀림
		int check = memberdao.userCheck(id, passwd);
		
		if(check == 1) {//사용자가 입력한 아이디, 비밀번호가 DB에 저장되어 있는 아이디, 비밀번호와 동일 할 때 
			
			//로그인 처리를 위해서 입력한 아이디를 세션영역에 저장
			session.setAttribute("id", id);
		
			//index.jsp 메인페이지로 포워딩
			response.sendRedirect("../index.jsp"); //현재페이지에서 한단계위인 WebContent폴더로 이동해서 다시 index.jsp 찾기
			
		}else if(check == 0) { //아이디 동일, 비밀번호 틀림
%>
		<script type="text/javascript">
			window.alert("비밀번호틀림");
			history.back(); //이전 페이지(login.jsp)로 되돌아가서 비밀번호 다시 작성 유도
		</script>
<%			
		}else{//아이디 틀림
%>
		<script type="text/javascript">
			window.alert("아이디 틀림");
			history.back(); //이전 페이지(login.jsp)로 되돌아가서 비밀번호 다시 작성 유도
		</script>


<%
		}
%>