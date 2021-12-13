<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="questionboard.BoardVO"%>
<%@page import="java.util.Vector"%>
<%@page import="questionboard.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q/A Board</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/baguettebox.js/1.8.1/baguetteBox.min.css">
<link rel="stylesheet" href="../css/thumbnail-gallery.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</head>
    
<style type="text/css">
    #main_img {
	width:100%; 
	height: 100px; 
	background-image: url("");
	background-size: cover;
	vertical-align: middle;
	margin: 0 0 30px 0;
	padding: 0;
	position: relative;
	}

#main_img .content {
	font-family: Arial, Helvetica, sans-serif;
	text-align : center;
  position: absolute;
  bottom: 0px;
  background: rgb(0, 0, 0); /* Fallback color */
  background: lightgray;
  color: #f0f2f9;
  width: 100%;
  padding: 20px;
}
</style>

<script type="text/javascript">
	function check(){
		if(document.search.keyWord.value == "") {
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		} else {
			document.search.submit();
		}
	}
		
	function fnRead(num){
		
		document.read.num.value = num; 
		document.read.submit(); 
	}
	
	//[처음으로] 링크 눌렀을 때 호출되는 함수
	function fnList(){
		
		document.list.action = "question.jsp";
		document.list.submit();
		
	}
	
	
</script>
</head>
<body>
<jsp:include page="../inc/top.jsp"/>

<div class="container-fluid">
    <div class="row" style="height: 60px;">&nbsp;</div>
    <div class="row" id="main_img" style="margin-top: 5px;">
		  <div class="content">
		   <h1>Q/A Board</h1>
		    <p class="page-description text-center">Hotel the Moon Membership에 관한 문의 사항을 남겨주세요.</p>
		  </div>
		
   		 </div>
</div>  

<br>
<%	
//[★순서1] DB작업을 위한 BoardDAO 객체 생성 ---------------------------------------------
%>		
	<jsp:useBean id="dao" class="questionboard.BoardDAO"/>
	

<%	
	String keyWord="";  //(10)검색어
	String keyField=""; //(11)검색기준값


	int totalNum = dao.totalNum(); 			//총 글 개수
	int numPerPage = 5;						//한 페이지 별 글 개수 
	int nowPage = 1;						//현재 페이지 
	if (request.getParameter("nowPage") != null) nowPage = Integer.parseInt(request.getParameter("nowPage")); 
	int pageFirst = (nowPage-1) * numPerPage; //각 페이지의 첫번째 글 번호
	int pagePerBlock = 3;					//블록한개 당 페이지 수
	int totalPage = totalNum/numPerPage + (totalNum%numPerPage==0? 0:1); //총페이지수
	int startBlock = ((nowPage/pagePerBlock) - (nowPage % pagePerBlock == 0? 1 : 0)) * pagePerBlock + 1; //한 블록당 시작 페이지
	int lastBlock =  startBlock + pagePerBlock -1;// 한 블록의 마지막 페이지
	if(lastBlock > totalPage) { lastBlock = totalPage; } 
	
//[★순서3] -----------------------------------------------------------------------


	request.setCharacterEncoding("UTF-8");
	
	//(10, 11) 검색기준값(keyfield-작성자,제목 같은 선택창) 선택 + 검색어(keyword) 입력+ 전달
	if(request.getParameter("keyWord") != null) {
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
//[★순서4] -----------------------------------------------------------------------
	// 입력한 검색어를 비우고 모든 레코드 검색 가능
	if(request.getParameter("reload") != null) {
		if(request.getParameter("reload").equals("true")){
			keyWord = ""; 
		}
	}			
	Vector v = dao.getBoardList(keyField, keyWord);
	

	
	
%>		
	
<table align=center border=0 width=80%>
<tr>
	<td align=left>Total : <%=totalNum%> Articles(
		<font color=red>  <%=nowPage%> / <%=totalPage%> </font>) 
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3 >
<tr>
	<td align=center colspan=2 >
		<table border=0 width=100% cellpadding=2 cellspacing=0> 
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td> 글번호 </td>
				<td> 글제목 </td>
				<td> 작성자 ID </td>
				<td> 날짜 </td>
			</tr>
			
			<%				
				if(v.isEmpty()){ 
			%>
				<tr>
					<td colspan="5" align="center">등록된 글이 없습니다.</td>
				</tr>
		<%
				}else{
					SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
					
				
			
					for(int cnt=pageFirst; cnt<(pageFirst+numPerPage); cnt++){
				
						if(cnt == totalNum) {
							break; 
						}
				
				BoardVO vo = (BoardVO)v.get(cnt); 
				int num = vo.getNum();
				String pass = vo.getPass();
				String subject = vo.getSubject();
				String writerID = vo.getwriterID();
				Timestamp date = vo.getDate();
				
							
		%>	
			<tr>
				<td align="center"><%=num%></td>
				<td><a href="#" onclick="fnRead('<%=num%>')"><%=subject%></a></td>
				<td align="center"><%=writerID%></td>	
				<td align="center"><%=s.format(date)%></td>
			</tr>
		<%					
					}
				}
		%>	
			
			
		</table>
	</td>
</tr>
<tr>
	<td><BR><BR></td>
</tr>
<tr>

	<td align="left">Go to Page 	
	
	<%
		if(startBlock > pagePerBlock) { 
	%>
		<a href="question.jsp?nowPage=<%=startBlock-pagePerBlock%>">[이전]</a>
	<%		
		} 
		for(int i=startBlock; i<=lastBlock; i++){ 
	%>	
		<a href=question.jsp?nowPage=<%=i%>><%=i%></a>
	<%	
		} 
	 
		if(lastBlock < totalPage) {
	%>
		<a href="question.jsp?nowPage=<%=startBlock+pagePerBlock%>">[다음]</a>
		
	<%
		}		
	%>
		
	</td>
	
	<td align=right>
		<a href="post.jsp">[글쓰기]</a>
		<a href="#" onclick="fnList();">[처음으로]</a>
	</td>
</tr>
</table>
<br>
<form action="question.jsp" name="search" method="post">
<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign="bottom">
			<select name="keyField" size="1">
				<option value="writerID"> 이름
				<option value="subject"> 제목
				<option value="content"> 내용
			</select>
			
			<input type="text" size="16" name="keyWord">
			<input type="button" value="찾기" onclick="check()">
			<input type="hidden" name="page" value="0">
		</td>
	</tr>
</table>	
</form>	
</center>

	<form name="list" method="post">
		<input type="hidden" name="reload" value="true" />
	</form>
	
	<form action="read.jsp" name="read" method="post">
		<input type="hidden" name="num"> 
		<input type="hidden" name="keyField" value="<%=keyField%>" />
		<input type="hidden" name="keyWorld" value="<%=keyWord%>" />
		
	</form>

</body>
</html>
