<%@ include file = "db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<%
session.setAttribute("login1","successful");
%>
<jsp:forward page="login.jsp"/>
