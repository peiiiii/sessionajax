<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="db.jsp"%>
<%
String account = request.getParameter("account");
if(account != ""){
  String sql = "select * from Member where account ='" + account + "'";
  pstmt = con.prepareStatement(sql);
  ResultSet rs = pstmt.executeQuery();
  if(rs.next()){
    out.println("data false");
  } else {
    out.println("data true");
  }
}
%>
