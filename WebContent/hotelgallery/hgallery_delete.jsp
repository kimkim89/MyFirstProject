<%@page import="hotelgallery.hgalleryDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int num = Integer.parseInt(request.getParameter("num"));

	hgalleryDAO rdao= new hgalleryDAO();
	
	rdao.deleteBoard(num);
%>

	<script type="text/javascript">
		alert("글 삭제 성공");
		location.href="hotelgallery.jsp"; 
	</script>