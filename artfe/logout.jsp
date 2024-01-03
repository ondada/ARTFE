<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ page import="java.sql.*" %>

<%
	session.invalidate();
	response.sendRedirect("main.jsp");
%>