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
    table, tr, td {
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
  height: 150px;
}
tr{
  height: 40px;
  width:80%;
}
</style>
  </head>
  <body>
    <div class="body"></div>
      <div class="grad"></div>
      <div class="login2">
      <%
                  String p_search = request.getParameter("search");
                  Boolean temp = true;
                  String login = (String)session.getAttribute("login1");
                  if(!login.equals("successful")){
                    response.sendRedirect("index.jsp");
                  }else{
                  if(p_search != null){
                    String sql = "select * from Member where account='" + p_search + "'";
                    pstmt = con.prepareStatement(sql);
                    ResultSet rs = pstmt.executeQuery();
                    if(rs.next()){

                      String accountData = rs.getString("account");
                      String passwordData = rs.getString("password");
                      String userData = rs.getString("user");
                      String birthData = rs.getString("birthday");
                      String phoneData = rs.getString("phone");
                      String createData = rs.getString("createdAt");
                      temp=false;
                      %>
                      <center><div>
                        <table>
                          <tr>
                            <td><center>帳號 :</center></td>
                            <td><center> <%= accountData%></center></td>
                          </tr>
                          <tr>
                            <td><center>密碼 :</center></td>
                            <td><center> <%= passwordData%></center></td>
                          </tr>
                         <tr>
                           <td><center>用戶名稱 :</center></td>
                           <td><center><%= userData%></center></td>
                         </tr>
                         <tr>
                           <td><center>電話 :</center></td>
                           <td><center><%= phoneData%></center></td>
                         </tr>
                         <tr>
                           <td><center>生日 :</center></td>
                           <td><center><%= birthData%></center></td>
                         </tr>
                         <tr>
                           <td><center>建立日期 :</center></td>
                           <td><center><%= createData%></center></td>
                         </tr>

                   </table>
                   <input type="button" onclick="history.back()" value="回上一頁">
                 </div></center>
      <% }if(temp){
        out.println("查無此帳號!請再試一次!</br>");%>
        <input type="button" onclick="history.back()" value="回上一頁">
  <%    }
}}

      %>
    </div>
  </body>
</html>
