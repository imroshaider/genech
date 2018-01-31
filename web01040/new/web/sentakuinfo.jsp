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
<!--	  		<form action="profile.jsp" method="post">
		<input type="submit" value="profile" class="btn btn-default" />
		</form>-->
<!--	 <form action="Logoutservlet" method="post">
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

   
      try{
          String quer = "select * from temppalan where Uid='"+a+"' and sentaku='YES' and feedback='NO'";
          preparedStatement = con.prepareStatement(quer);
ResultSet y =preparedStatement.executeQuery();

 while(y.next()){ %>
         <div class="col-sm-6">
        <br>

      <div class="panel panel-warning">
             <div class="panel-body">
                 <div class="media">

                 <a class="media-left" href="#">
                 </a>

                 <div class="media-body">
                     <h4 class="media-heading"></h4>
                              
                     <!--↓pop up-->
                     <%
                         out.println("<form action='detail.jsp' method='POST'>");
                        out.println("<input type='submit' value='企業名' class='btn btn-warning btn-lg' >"); 
                        out.println(y.getString("CName"));
                        out.println("<input type='hidden' value='"+y.getString("Cid") +"' name='Cid'>");
                        out.println("<br></form> 行き先:"+ y.getString("Des1") +"<br>IN:"+ y.getString("CheckIn") +"<br>OUT:"+ y.getString("Checkout"));
                        out.println("<br>料金:"+ y.getString("Cost") +"<br>");
                             
                        out.println("<div class='panel-footer text-right'>");
                        
                            out.println("<form action='feedback.jsp' method='POST'>");
                         out.println("<input type='hidden' value='"+y.getString("ID") +"' name='ID'>");
                          out.println("<input type='hidden' value='"+y.getString("Cid") +"' name='Cid'>");
                           out.println("<input type='hidden' value='"+y.getString("CName") +"' name='Uid'>");
                        out.println("<input type='submit' value='FeedBack' class='btn btn-warning btn-lg' >"); 
                       out.println("</form>");
                        
                          out.println("<form action='payment.jsp' method='POST'>");
                         out.println("<input type='hidden' value='"+y.getString("ID") +"' name='ID'>");
                          out.println("<input type='hidden' value='"+y.getString("Cid") +"' name='Cid'>");
                           out.println("<input type='hidden' value='"+y.getString("CName") +"' name='Cname'>");
                        out.println("<input type='submit' value='お支払い' class='btn btn-warning btn-lg' >"); 
                       out.println("</form></div>");
                
                        
                        
     

     
          
                        
%>
                 </div>
  </div>
             </div>
                  </div>
   </div>
                                  <%  
                                      
  }
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
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