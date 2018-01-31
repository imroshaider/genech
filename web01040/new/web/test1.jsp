<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="mvc.Companypage.ProfileservletCompany"%><%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="mvc.Database.DBConnection"%>
<%@ page import="mvc.New"%>
<%@ page import="mvc.login.Loginservlet"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>企業情報編集</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/img.css" rel="stylesheet">
  <link href="css/p_1.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

  <div class="page-header">
     <h1 class="text-center">企業情報編集</h1>
  </div>

  <div class="container">
  <div class="row row-eq-height">

  <div class="col-md-3">
  <div class="form">

  <form name="form" action="ProfileservletCompany" method="post" onsubmit="return validate()">
      
                
<!--    <img src="Image/himu11.jpg" class="img-circle img1">
    <input type="file" name="image">-->
  
</div>
</div>

<%
    String CompanyID = (String)session.getAttribute("userid");    
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
    
try{
         String query = "select * from cprof where ID = '"+CompanyID+"'";
         preparedStatement = con.prepareStatement(query);
         ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
     
%>

  <div class="col-md-4 text-primary">
   <div class="form-header">
   </div>
   <div class="form">
   
      <div class="form-group">
        <p><label for="C_name">Company name</label></p>
        <input type="text" class="form-control" name="C_name" placeholder="企業名" style="width:200px;" value="<%= x.getString("CName") %>" rows="1" maxlength="14">
  <small class="form-text text-muted">8文字以内</small>
      </div>

        <div class="form-group">
            <p><label for="C_hp">HP</label></p>
            <input type="text" class="form-control" name="C_HP" placeholder="URL" style="width:200px;" value="<%= x.getString("url") %>" rows="1" maxlength="100" >
        </div>
      
      <div class="form-group">
          <p><label for="C_tel">Tel</label></p>
           <input type="text" class="form-control" style="width:200px;" value="<%= x.getString("tel") %>" name="Tel" placeholder="電話番号" rows="1" maxlength="60">
        </div>
       
      <div class="form-group">
      <p><label for="C_post">Street address</label></p>
            <input type="text" name="C_post" class="form-control" style="width:150px;"  value="<%= x.getString("post") %>" placeholder="郵便番号" rows="1" maxlength="7"> 
            <br><textarea class="form-control" style="width:300px;" name="C_address" placeholder="住所" rows="1" maxlength="60"><%= x.getString("address") %></textarea>
        </div>
       

        <div class="form-group">
            <p><label for="C_info">information</label></p>
            <textarea name="C_info" class="form-control" style="width:400px; height:100px;" placeholder="コメント" rows="1" maxlength="500"><%= x.getString("detal") %></textarea>
            <small class="form-text text-muted">500文字以内</small>
      </div>

       <% }


 }
      catch(SQLException e)
{
e.printStackTrace();
};
%>
       
       
      <div Align="right">
          <input type="hidden" name="process" value="chenge">
       <input type="submit" value="Update" name="update"  class="btn btn-primary">
      </div>
      </form>
   </div>
  </div>


  </div>
</left>
</div>
</div>
</div>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@ page import="mvc.Companypage.ProfileservletCompany"%><%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="mvc.Database.DBConnection"%>
<%@ page import="mvc.New"%>
<%@ page import="mvc.login.Loginservlet"%>
<%@ page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>企業情報編集</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/img.css" rel="stylesheet">
  <link href="css/p_1.css" rel="stylesheet">
  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>

  <div class="page-header">
     <h1 class="text-center">企業情報編集</h1>
  </div>

  <div class="container">
  <div class="row row-eq-height">

  <div class="col-md-3">
  <div class="form">

  <form name="form" action="ProfileservletCompany" method="post" onsubmit="return validate()">
      
                
<!--    <img src="Image/himu11.jpg" class="img-circle img1">
    <input type="file" name="image">-->
  
</div>
</div>

<%
    String CompanyID = (String)session.getAttribute("userid");    
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
    
try{
         String query = "select * from cprof where ID = '"+CompanyID+"'";
         preparedStatement = con.prepareStatement(query);
         ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
     
%>

  <div class="col-md-4 text-primary">
   <div class="form-header">
   </div>
   <div class="form">
   
      <div class="form-group">
        <p><label for="C_name">Company name</label></p>
        <input type="text" class="form-control" name="C_name" placeholder="企業名" style="width:200px;" value="<%= x.getString("CName") %>" rows="1" maxlength="14">
  <small class="form-text text-muted">8文字以内</small>
      </div>

        <div class="form-group">
            <p><label for="C_hp">HP</label></p>
            <input type="text" class="form-control" name="C_HP" placeholder="URL" style="width:200px;" value="<%= x.getString("url") %>" rows="1" maxlength="100" >
        </div>
      
      <div class="form-group">
          <p><label for="C_tel">Tel</label></p>
           <input type="text" class="form-control" style="width:200px;" value="<%= x.getString("tel") %>" name="Tel" placeholder="電話番号" rows="1" maxlength="60">
        </div>
       
      <div class="form-group">
      <p><label for="C_post">Street address</label></p>
            <input type="text" name="C_post" class="form-control" style="width:150px;"  value="<%= x.getString("post") %>" placeholder="郵便番号" rows="1" maxlength="7"> 
            <br><textarea class="form-control" style="width:300px;" name="C_address" placeholder="住所" rows="1" maxlength="60"><%= x.getString("address") %></textarea>
        </div>
       

        <div class="form-group">
            <p><label for="C_info">information</label></p>
            <textarea name="C_info" class="form-control" style="width:400px; height:100px;" placeholder="コメント" rows="1" maxlength="500"><%= x.getString("detal") %></textarea>
            <small class="form-text text-muted">500文字以内</small>
      </div>

       <% }


 }
      catch(SQLException e)
{
e.printStackTrace();
};
%>
       
       
      <div Align="right">
          <input type="hidden" name="process" value="chenge">
       <input type="submit" value="Update" name="update"  class="btn btn-primary">
      </div>
      </form>
   </div>
  </div>


  </div>
</left>
</div>
</div>
</div>

</body>
</html>
