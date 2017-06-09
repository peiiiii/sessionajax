<%@ include file = "db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title></title>
    <link rel="stylesheet" href="style.css">

    <style>
    table, th, td {
        border: 1px solid black;
        border-collapse: collapse;

    }
    table {
  		border-collapse: collapse;
  		border-spacing: 0;
  	}
    table{
    table-layout: fixed;
    width: 300px;
}
table{
  height: 100px;
}
th{
  height: 25%;
  width:80%;
}
    </style>
  </head>
  <body>
    <div class="body1"></div>
      <div class="grad"></div>
      <div class="login1">
    <%
        String p_account = request.getParameter("account");
        String p_password = request.getParameter("pwd");
        Boolean temp = true;
        String login = (String)session.getAttribute("login1");
        try{



        if(login.equals("successful")){
        if(p_account != null && p_password != null){
          String sql = "select * from Member where account='" + p_account + "' and password ='" + p_password +"'";
          String sql1 = "select * from Member ;";
          pstmt = con.prepareStatement(sql);
          ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
              out.println("登入成功!</br>");
              out.println("登出請按此--><a href='logout.jsp'>Log out</a>");
              temp=false;
              pstmt = con.prepareStatement(sql1);
              rs = pstmt.executeQuery();
              %>
              <center>
                <div class="f">
                <form action="detail.jsp" method="post">
                <input type="text" name="search" placeholder="請輸入要查詢的帳號">
                <input type="submit" name="search1" value="搜尋">
                </form>
              </div>
              </center>
    <%
          while(rs.next()){

              String accountData = rs.getString("account");
              String passwordData = rs.getString("password");
              %>
              <div>
                <br>
                <table>
                  <tr>
                    <td><center>帳號 :</center></td>
                    <td><center> <%= accountData%></center></td>
                  </tr>
                 <tr>
                   <td><center>密碼 :</center></td>
                   <td><center><%= passwordData%></center></td>
                 </tr>
           </table>
         </div>
    <%        }
            }
          if(temp){
            out.println("登入失敗!請再試一次!");
            response.setHeader("Refresh","1;url=index.jsp");
          }
        }
      }else{
          response.sendRedirect("index.jsp");
        }
      }catch(Exception ex){
        response.sendRedirect("index.jsp");
      }

    %>
  </div>
  </body>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
</html>
