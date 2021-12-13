<%@page import="hotelgallery.hgalleryDTO"%>
<%@page import="hotelgallery.hgalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
 <meta http-equiv="X-UA-Compatible" content="IE=edge">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <link href="../css1/style.css" rel="stylesheet">
<link href="../css/member.css" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"> </script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link href="style.css" rel="stylesheet" type="text/css">
<link href="../css/reviewboard.css" rel="stylesheet" type="text/css">
  <link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/imgboard.css" rel="stylesheet" type="text/css">
 
 
<title>Hotel the Moon 게시판 글수정</title>
</head>

<%
	String id = (String)session.getAttribute("id");
	int num = Integer.parseInt(request.getParameter("num"));
	
	hgalleryDAO hdao = new hgalleryDAO();
	hgalleryDTO hdto = hdao.getBoard(num);
	String name = hdto.getName();
	String subject = hdto.getSubject();
	String content = hdto.getContent();
	String filename = hdto.getFilename();
%>
<body>

 <jsp:include page="../inc/top.jsp" />

 <h2 style="text-align: center;margin-top: 100px;">글수정</h2>

 <div class="container-fluid">
 	<div class="row">
 		<div class="col-sm-8 col-md-offset-2" id="img_div">

<form action="hgallery_updatePro.jsp" method="post" enctype="multipart/form-data">
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="filename" value="<%=filename%>">
	<table id="notice" style="width: 100%">
			<tr>
				<th class="col-20">이름</th>
				<td><input type="text" name="name" readonly="readonly" value="<%=name%>"></td>
			</tr>
			<tr>
				<th class="col-20">제목</th>
				<td><input type="text" name="subject" value="<%=subject%>"></td>
			</tr>
			<tr>
				<th class="col-20">글내용</th>
				<td><textarea name="content" rows="13" cols="40"><%=content%></textarea></td>
			</tr>	
			
			<tr>
			<th class="col-20">이미지 파일</th>
			
			<td><input type="file" name="filename"></td>
			</tr>
			
		</table>

		<br><br>
		<input type="submit" id="img_sub2" value="등록">

</form>

</div>
</div>
</div>
</body>
</html>