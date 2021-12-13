<%@page import="questionboard.BoardDAO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%-- BoardBean객체 생성 하여  request영역에서 꺼내온 글정보를 각각 변수에 저장 --%>
	<jsp:useBean id="vo" class="questionboard.BoardVO"/>
	<jsp:setProperty property="*" name="vo"/>

<%
	vo.setDate(new Timestamp(System.currentTimeMillis()));
		
	BoardDAO dao = new BoardDAO();
	
	dao.insertBoard(vo);
		 
	response.sendRedirect("question.jsp"); 
%>
    