<%@page import="questionboard.BoardVO"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
		request.setCharacterEncoding("UTF-8");
		
		int num = Integer.parseInt(request.getParameter("num"));

%>
		<jsp:useBean id="dao" class="questionboard.BoardDAO"/>
		<jsp:useBean id="vo" class="questionboard.BoardVO" />
		<jsp:setProperty property="*" name="vo" />
		
<%

		//수정할 글번호를 통해서 수정할 글번호를 다시 검색해서 가져옴
		BoardVO tmpVo = dao.getBoardInfo(num);

		//DB에서 검색된 수정할 글 정보 중에서 DB에 저장된 비밀번호값을 얻기
		String storedPass = tmpVo.getPass(); //storedPass=DB에 저장된 비밀번호값
		
		//Update.jsp페이지에서 글 수정 시 입력한 비밀변호값 얻기
		String paramPass = vo.getPass(); //paramPass=웹브라우저에서 글 수정 시 사용자가 입력한 비밀번호값 //위의 setProperty태그에서 얻어서 비밀번호값 가져옴.
		
		//Update.jsp페이지에서 글 수정 시 입력한 비밀번호와 DB에 저장되어 있는 비밀번호가 다르면?
		if(!paramPass.equals(storedPass)){
%>
			<script type="text/javascript">
				window.alert("입력하신 글의 비밀번호가 올바르지 않습니다.");
				history.back();			// ← Update.jsp페이지로 다시 돌아감.
			</script>
	
<%		//----------- 


		//else구문1
		}else{ //입력한 비밀번호와 DB에 저장되어 있는 글에 대한 비밀번호가 같다면
			
			//BoardDaoImpl객체의 updateBoard메소드를 호출하면, 매개변수로 위에 액션태그로 생성된 BoardDto객체를 전달하여 Update작업을 명령함.
			int result = dao.updateBoard1(vo); //글수정에 성공하면 1을 반환받고 실패하면 0을 반환 받아 처리함.
			
			if(result == 0) {
		%>				
			<script>
				alert("수정실패");
				history.back();
			</script>
		<%			
			}else{
		%>			
			<script>
				alert("수정 성공");
				location.href="question.jsp";
			</script>	
<%
			}
		}
			
%>

		
		
		
		
		
		