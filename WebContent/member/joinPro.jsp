<%@page import="java.sql.Timestamp"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//1. join.jsp에서 입력한 데이터 한글처리
	request.setCharacterEncoding("UTF-8");
%>	
	
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
<%
	MemberDAO mdao = new MemberDAO();
	
	mdao.insertMember(dto);
	
	response.sendRedirect("login.jsp");
		
%>



