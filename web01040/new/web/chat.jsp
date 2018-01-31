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
                             fo.close();
                 }
                  }
                  catch(SQLException e){
                    e.printStackTrace();
                  }
 %>
     <div class="col-xs-6 col-md-2"><center>
    　
	  <img src="Image/himu11.jpg" class="img-circle img1"></br>
	     Name:<%= nishi %> </br>
      <ul class="nav nav-pills nav-stacked">
    	     <li class="active"><a href="#">Menu</a></li>
           <li><a href="mypage.jsp">Home</a></li>
           <li><a href="profile.jsp">profile</a></li>
	         <li><a href="sentakuinfo.jsp">選択情報</a></li>
	         <li><a href="index.jsp">Logout</a></li>
      </ul>
	 </center></div>
    <div class="col-md-6">


         <div class="col-sm-6">
        
                              
    
</div>
  </div>

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