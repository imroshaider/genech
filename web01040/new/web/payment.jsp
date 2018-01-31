<%@ page language="java" contentType="text/html; charset=utf-8" %>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import="mvc.Database.DBConnection"%>
<%@page import="mvc.login.Loginservlet"%>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv='Content-Style-Type' content='text/javascript'>
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>マイページ</title>


  <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/m_box.css" rel="stylesheet">
        <link href="css/login.css" rel="stylesheet">
        <link href="css/img.css" rel="stylesheet">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
  <script src="js/mypage.js"></script>

</head>
<body>
<div class="container">
  <div class="row">

  
  <div class="page-header">

   </div>

  </br>
    <%
       Blob img = null;
       byte[ ] imgData = null ;
//        LoginBean mypage= new LoginBean();
//String id= mypage.getUserid();

          String a = (String)session.getAttribute("userid");
       
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from userprof where ID='"+a+"'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
     String nishi=x.getString("name");
img=x.getBlob("image");
imgData = img.getBytes(1,(int)img.length());
FileOutputStream fo = new FileOutputStream("C:\\apache-tomcat-8.5.16\\webapps\\pbl3\\web\\Image\\himu11.jpg"); 
fo.write(x.getBytes("image"));



      %>
     <div class="col-xs-6 col-md-2"><center>
    　<ul class="nav nav-pills nav-stacked">
    <img src="Image/himu11.jpg" class="img-circle img1"></br>
    Name:<%= nishi %> </br>
<!--        <form action="profile.jsp" method="post">
    <input type="submit" value="profile" class="btn btn-default" />
    </form>-->
<!--   <form action="Logoutservlet" method="post">
   <input type="submit" value="Logout" class="btn btn-default" />
   </form>-->
   <li class="active"><a href="#">Menu</a></li>
         <li><a href="mypage.jsp">Home</a></li>
         <li><a href="profile.jsp">profile</a></li>
    <li><a href="sentakuinfo.jsp">選択情報</a></li>
    <li><a href="index.jsp">Logout</a></li>
      </ul>
   </center></div>
    <div class="col-md-6">
                         <%  fo.close();
  }
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>  
     <!-- リアルタイム -->
     
         <%               
    String Number = (String)session.getAttribute("hopeid");
    String UserName = "";
    String UserID = "";
    String Destination = "";
    String Hotel = "";
    String CheckIn = "";
    String CheckOut = "";
    String CompanyName = "";
    String Cost = "";
    String AccountName = "Test___AccountName";
    String AccountNumber = "Test__AccountNumber";
    String Vehicle = "";
   
    

try{
      String query = "select * from temppalan where ID='"+Number+"'";
      preparedStatement = con.prepareStatement(query);
      ResultSet x =preparedStatement.executeQuery();

while(x.next()){
    
      Number = x.getString("ID");
      UserName = x.getString("UName");
      UserID = x.getString("Uid");
      Destination = x.getString("Des1");
      Hotel = x.getString("Hotel");
      CheckIn = x.getString("CheckIn");
      CheckOut = x.getString("CheckOut");
      CompanyName = x.getString("CName");
      Cost = x.getString("Cost");
      Vehicle = x.getString("vehicle");
      
      }
      
}catch(SQLException e){    
e.printStackTrace();
}
        %>
    
         <div class="col-sm-6">
       
             <h4>
        <table class="table text-left"> <!-- thの中にデータいれる -->
        <tr><th>希望ID.</th><th><%= Number %></th></tr>
        <tr><th>氏名：</th><th><%= UserName %></th></tr>
        <tr><th>ユーザーID：</th><th><%= UserID %></th></tr>
        <tr><th>行き先：</th><th><%= Destination %></th></tr>
        <tr><th>宿泊先：</th><th><%= Hotel %></th></tr>
        <tr><th>CheckIn：</th><th><%= CheckIn %></th></tr>
        <tr><th>Checkout：</th><th><%= CheckOut %></th></tr>
        <tr><th>企業名：</th><th><%= CompanyName %></th></tr>
        <tr><th>金額：</th><th><%= Cost %></th></tr>
        <tr><th>口座番号：</th><th><%= AccountNumber %></th></tr>
        <tr><th>口座名：</th><th><%= AccountName %></th></tr>
        <tr><th>利用機関：</th><th><%= Vehicle %></th></tr>
        <tr><th><div class="input-group"><form action="PaymentServlet" method="POST"><label class="input-group-btn"><span class="btn btn-primary">Choose file<input type="file" name="pic"></span></label><input type="text" class="form-control" readonly=""></div><th>
        <input type="submit" value="Paid"><input type="hidden" name="id" value="<%=Number%>"></form></th></th></tr>
                    
       
        </table>
        </h4>
      
   </div>
                                 
</div>
    <!--リアルタイム部分最後-->

  <div class="col-xs-6 col-md-4 bg-warning">
   <form action="KibouServlet" method="POST">
<div class="form-group">
    <label class="control-label">目的地①：</label>
    <select class="form-control" style="width:120px;" name="Des1">
    <option value="area_null">希望なし</option>
    <option value="osaka">大阪府</option>
    <option value="kyoto">京都府</option>
    <option value="hyogo">兵庫県</option>
    <option value="shiga">滋賀県</option>
    <option value="wakayama">和歌山県</option>
    </select>
</div>
<div class="form-group">
  <label class="control-label">目的地②：</label>
  <select class="form-control" style="width:120px;" name="Des2">
  <option value="area_null">希望なし</option>
  <option value="osaka">大阪府</option>
  <option value="kyoto">京都府</option>
  <option value="hyogo">兵庫県</option>
  <option value="shiga">滋賀県</option>
  <option value="wakayama">和歌山県</option>
  </select>
</div>
<div class="form-group">
  <label class="control-label">目的地③：</label>
  <select class="form-control" style="width:120px;" name="Des3">
  <option value="area_null">希望なし</option>
  <option value="osaka">大阪府</option>
  <option value="kyoto">京都府</option>
  <option value="hyogo">兵庫県</option>
  <option value="shiga">滋賀県</option>
  <option value="wakayama">和歌山県</option>
  </select>
</div>
<div class="form-group">
    <label class="control-label">人数：</label>
    <input type="textarea" name="People" />
</div>
  <div class="form-group">
    <label class="control-label">予算：</label>
    <select class="form-control" style="width:120px;" name="Cost">
      <option value="cost_null">希望なし</option>
      <option value="6000">～6000円</option>
      <option value="8000">～8000円</option>
      <option value="10000">～10000円</option>
      <option value="15000">～15000円</option>
      <option value="20000">20000円～</option>
    </select>
  </div>
        <label class="control-label">希望：</label>
         <input type="textarea" name="Hope">
   <div class="form-group">
     <label class="control-label">日程：</label>
     <p>
     チェックイン：<input type="date" class="form-control" name="CheckIn"></p>
     <p>
     チェックアウト：<input type="date" class="form-control" name="Chekout"></p>
  　</div>
       
    <div Align="right">
     <input type="submit" value="送信" class="btn btn-default" />
    </div>
   </form>
 </div>

 </div>

</div>

 
</body>
</html>