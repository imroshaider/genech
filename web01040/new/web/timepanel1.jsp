<%@page contentType="text/html; charset=UTF-8"%>
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
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
	<title>提案済</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/img.css" rel="stylesheet">

</head>

<body>
<div class="container">
	<div class="row">

	<div class="page-header">

    	 </div>

    <div class="tab-pane active" id="tab2">
	 	<br><br>
			
            <%
     response.setIntHeader("Refresh", 20);
     Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from travelsearch where count=!'0' order by zikan desc";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){ %>
                        <div class="col-sm-6">
				<br>
 
			<div class="panel panel-primary">
			       <div class="panel-body"><div class="media">

			           <a class="media-left" href="#">
			           </a>

			           <div class="media-body"><!-- 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　-->
			          <h4 class="media-heading">user名</h4><!-- ユーザーリンククリックでプロフ表示 -->
                                       <%  
                                          out.println("<h4 class='media-heading'>" + x.getString("Name") +"</h4>");
                                        out.println("<p>場所:" + x.getString("Des1") + "</p>");
                                       
			              out.println("<p>IN:" + x.getString("CheckIn") + "</p>");
                                      out.println("<p>OUT:" + x.getString("Checkout") + "</p>");
			              %>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
			    <div align="left"><strong>5</strong>件の企業が提案</div>
			    <input type="submit" value="提案" name="plan" name="plan" class="btn btn-primary">
			　</from>
			
			 </div>
   
	</div>
                  </div>
	 </div>
 <% }

  
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
     
        
   <!-- 以下提案済みタブ -->
<!--	 <div class="tab-pane" id="tab2">
	 	<br><br>
			<div class="col-sm-6">
				<br>
			<div class="panel panel-primary">
						 <div class="panel-body"><div class="media">

								 <a class="media-left" href="#">
								 </a>

								 <div class="media-body"> 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　
										 <h4 class="media-heading">user名</h4> ユーザーリンククリックでプロフ表示 
										 <p>場所:和歌山県　予算:30000～</p>
										 <p>IN:2017/12/6 16:00<br>
										 OUT:2017/12/7 13:00</p>
								 </div>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
					<div align="left"><strong>5</strong>件の企業が提案</div>
					<input type="submit" value="提案済" id="plan" name="plan" class="btn btn-success">
			　</from>
			</div>
			</div>
			</div>


			<div class="col-sm-6">
			<br>
			<div class="panel panel-primary">
						 <div class="panel-body"><div class="media">

								 <a class="media-left" href="#">
								 </a>

								 <div class="media-body"> 必要なデータ　ユーザーの情報(ID,prof)、希望情報(場所、予算、チェックイン/アウト、提案数)　
										 <h4 class="media-heading">user名</h4> ユーザーリンククリックでプロフ表示 
										 <p>場所:兵庫県　予算:15000～</p>
										 <p>IN:2017/12/2 16:00<br>
										 OUT:2017/12/3 13:00</p>
								 </div>
			</div>
			</div>
			<div class="panel-footer text-right">
			<form action="">
					<div align="left"><strong>10</strong>件の企業が提案</div>
					<input type="submit" value="提案済" id="plan" name="plan" class="btn btn-success">
			　</from>
			</div>
			</div>
			</div>
	 </div>-->
	
   

	
	</div>
	</div>
        </div>
     </body>
     </html>
