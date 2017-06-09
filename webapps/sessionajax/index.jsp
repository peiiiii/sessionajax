<%@ include file = "db.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Random Login Form</title>
   <link rel="stylesheet" href="style.css">

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(http://fonts.googleapis.com/css?family=Exo:100,200,400);
@import url(http://fonts.googleapis.com/css?family=Source+Sans+Pro:700,400,300);
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/prefixfree/1.0.7/prefixfree.min.js"></script>

</head>
<body>
  <div class="body"></div>
		<div class="grad"></div>
		<div class="header">
			<div>NCHU</div>
		</div>
		<br>
		<div class="login">
      <form method="post" action="session.jsp">
          Account : <input type="text" name="account" placeholder="請輸入帳號" required/>
          <br>
          Password : <input type="password" name="pwd" placeholder="請輸入密碼" required pattern="[A-Za-z0-9]{6,12}" title="請輸入6-12英文字母或數字"/>
          <br>
          <br>
          <input type="submit"  value="登入" />
          <input type="reset"  value="重設" />
          <input type="button" onclick="window.open('insert.jsp','_self')" value="註冊"/>
      </form>
		</div>
  <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>


</body>
</html>
