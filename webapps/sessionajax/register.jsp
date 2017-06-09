<%@ include file = "db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
    <div class="body"></div>
      <div class="grad"></div>
      <div class="login2">
    <%
    try{
     String p_account = request.getParameter("account");
     String p_password = request.getParameter("password");
     String p_user = request.getParameter("user");
     String p_birth = request.getParameter("birth");
     String p_phone = request.getParameter("phone");
      if(p_password != null && p_account != null && p_user != null && p_birth != null && p_phone != null){
        String sql = "select * from Member where account='" + p_account + "'";
        pstmt = con.prepareStatement(sql);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
          out.println("帳號已被註冊, 請改用別的帳號!");
          response.setHeader("Refresh","3;url=insert.jsp");
        }else{

          String sql1 = "insert into Member(account,password,user,birthday,phone) values(?,?,?,?,?)";
          pstmt = con.prepareStatement(sql1);
          pstmt.setString(1,p_account);
          pstmt.setString(2,p_password);
          pstmt.setString(3,p_user);
          pstmt.setString(4,p_birth);
          pstmt.setString(5,p_phone);
          pstmt.executeUpdate();
          out.println("註冊成功！3秒後返回首頁！");
          response.setHeader("Refresh","3;url=index.jsp");
        }}}catch(SQLException sqle)
        { out.println("SQL Exception : " + sqle);}
      pstmt.close();
    %></div>
  </body>
</html>
