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

	<script type="text/javascript">
		//keyField = 검색기준값(이름,제목,내용)
		//keyWord = 검색어(검색창에 직접 타이핑하는 단어)
	
		//목록 링크를 클릭했을 때 List.jsp페이지를 재요청해 이전에 검색했던 검색어와 검색기준값을 전달함.
		function fnList() {
			
			document.list.submit();	//form태그 중 name속성인 list를 전달함.
		}
	</script>

<%
	request.setCharacterEncoding("UTF-8");

// 		out.println(request.getParameter("num") + "," 
// 					+ request.getParameter("keyField") + "," 
// 					+ request.getParameter("keyWord"));
	
%>
		<%--1. 수정할 글번호를 이용해 글번호에 해당되는 글을 검색 + DB작업을 위해 BoardDaoImpl객체 생성 --%>
		<jsp:useBean id="bdao" class="questionboard.BoardDAO"/>
<%
		//2. List.jsp에서 글제목을 눌렀을때 전달받은 3개의 값을 저장
		int num = Integer.parseInt(request.getParameter("num")); //글 번호 전달받음 	//getParameter()메서드는 항상 String타입을 반환함.
		String keyField = request.getParameter("keyField");	//검색했던 걸에 대한 검색기준값 얻기
		String keyWord = request.getParameter("keyWord"); //검색했던 글에 대한 검색어값 얻기
		//만약 검색어가 입력되었다면~~
		if(request.getParameter("keyWord") != null ){
			//검색기준값 받아와 변수에 저장
			keyField = request.getParameter("keyField");
			//검색어 받아와 변수에 저장
			keyWord = request.getParameter("keyWord");
			
		}
		
		//3. 수정할 글번호를 이용해서 글번호에 해당되는 글을 검색하기 위해 BoardDaoImpl객체의 getBoard()메소드 호출 시 
		//	 글번호를 전달하여 검색해 옴.
		BoardVO vo = bdao.getBoard(num);
		
		
		//4. getBoard메소드로부터 반환받은 BoardDto객체의 getter메소드들을 호출하여 검색한 글의 정보를 얻어
		//	 아래의 디자인 영역에 출력
		String writerID = vo.getwriterID();
		String pass = vo.getPass();
		String subject = vo.getSubject();
		String content = vo.getContent().replace("\n", "<br>");
		Timestamp date = vo.getDate();
%>


<body>
<br><br>
<table align=center width=70% border=0 cellspacing=3 cellpadding=0>
 <tr>
  <td bgcolor=gray height=25 align=center class=m style="font-size: 20px;">글읽기</td>
 </tr>
 <tr>
  <td colspan=2>
   <table border=0 cellpadding=3 cellspacing=0 width=100%> 
    <tr>
     <td align=center bgcolor=#dddddd width=10%> 글 번호 </td>
	 <td bgcolor=white align="center"><%=num%></td>
	 <td align=center bgcolor=#dddddd width=10%> 작성자 ID </td>
	 <td bgcolor=white align="center"><%=writerID%></td>
	 <td align=center bgcolor=#dddddd width=10%> 등록 날짜 </td>
	 <td bgcolor=white align="center"><%=date%></td>
	</tr>
    <tr> 
     <td align=center bgcolor=#dddddd> 제 목</td>
     <td bgcolor=white colspan=6><%=subject%></td>
   </tr>
   <tr> 
    <td colspan=4><%=content%></td>
   </tr>
   <tr>
<!--     <td colspan=4 align=right> -->
<%--      <%=ip%>로 부터 글을 남기셨습니다./  조회수 : <%=count%> --%>
<!--     </td> -->
   </tr>
   </table>
  </td>
 </tr>
 <tr>
  <td align=center colspan=2> 
	<hr size=1>
	[ <a href="javascript:fnList( )">목 록</a> | 
	
	<a href="update.jsp?num=<%=num%>">수 정</a> |
	
	<%-- 답변 링크 추가 : 	Reply.jsp로 답변글 추가 요청시...
	 					주글(부모글)의 글번호, 검색했던 검색기준값, 검색어를 전달 --%>
	<a href="delete.jsp?num=<%=num%>">삭 제</a> ]<br>
  </td>
 </tr>
</table>

		<form name="list" action="question.jsp" method="post">
			<input type="hidden" name="keyField" value="<%=keyField%>"> 
			<input type="hidden" name="keyWord" value="<%=keyWord%>">
		</form>








</body>
</html>
