<%@page import="hotelgallery.hgalleryDTO"%>
<%@page import="hotelgallery.hgalleryDAO"%>
<%@page import="java.sql.Timestamp"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link href="../css/imgboard.css" rel="stylesheet">
</head>

<%
	request.setCharacterEncoding("UTF-8");

		int num = Integer.parseInt(request.getParameter("num"));
		
		hgalleryDAO roomsdao = new hgalleryDAO();
		
		hgalleryDTO roomsdto = roomsdao.getBoard(num);
		
		int DBnum = roomsdto.getNum(); 
		int DBReadcount = roomsdto.getCount(); 
		String DBName = roomsdto.getName();
		Timestamp DBDate = roomsdto.getRegdate();
		String DBSubject = roomsdto.getSubject(); 
		String DBContent = ""; 
		
	
		if(roomsdto.getContent() != null){
	DBContent = roomsdto.getContent().replace("\r\n", "<br/>");
		}
%>



<body>
<div class="main">
<h2><%=DBSubject %></h2>
</div>

<br><br><br>
<div class="container">
          <div class="row">
          <div class="col-md-4"></div>
          <div class="col-md-8" id="imgbdrd">
<img id="myImg" src="../../image/<%=roomsdto.getFilename() %>" alt="<%=DBContent %>">
</div>
</div>
</div>
 <!-- The Modal -->
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>

<script>

var modal = document.getElementById('myModal');

var img = document.getElementById('myImg');
var modalImg = document.getElementById("img01");
var captionText = document.getElementById("caption");
img.onclick = function(){
    modal.style.display = "block";
    modalImg.src = this.src;
    captionText.innerHTML = this.alt;
}

var span = document.getElementsByClassName("close")[0];

span.onclick = function() { 
    modal.style.display = "none";
}
</script>

</body>
</html>