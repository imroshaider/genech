<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mvc.Database.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ja" lang="ja">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
　<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
  <title>モーダル</title>

  <!-- Bootstrap -->
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/img.css" rel="stylesheet">
  <link href="css/p_1.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="css/common.css" media="all" />
  <link rel="stylesheet" type="text/css" href="css/layerBoard.css" media="all" />

  <!-- JavaScript -->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
  <script src="js/jquery-cookie.js"></script>
  <script src="js/jquery.layerBoard.js"></script>
  <script>
  $(function(){

	   $('#layer_board_area').layerBoard({alpha:0.5});

   })
   </script>

</head>
<body>
<%
    
           
String hopeid = (String)session.getAttribute("hopeid");
    
    String Cost=" ";
    String CName=" ";
    
    
            Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from temppalan where ID='"+hopeid+"'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){  
           Cost =x.getString("Cost");  
           CName =x.getString("CName");  
          
  }
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
    
  <div class="container">
  <div class="row row-eq-height">

  <!-- modal -->
<div id="layer_board_area">
	<div class="layer_board_bg"></div>
	<div class="layer_board">

    <!-- panel -->
    <div class="panel panel-warning">
      <div class="panel-heading">企業詳細
      </div>
      <div class="panel-body">
        <h4>
        <table class="table text-left"> <!-- thの中にデータいれる -->
        <tr><th>口座番号：</th><th></th></tr>
        <tr><th>口座名：</th><th></th></tr>
        <tr><th>企業名：<%= CName %></th><th></th></tr>
        <tr><th>希望ID：<%= hopeid %></th><th></th></tr>
        <tr><th>金額：<%= Cost %></th><th></th></tr>
        </table>
        </h4>
      </div>
    </div>
    <!-- panel -->

    
 
    
		<p class="btn_close"><a href="mypage.jsp">close</a></p>
	</div>
</div>
<!-- //modal -->

  <div class="page-header">
     <h1 class="text-center">モーダル</h1>
	</div>

  <!--　再読み込み -->
<%-- <div id="wrapper">

	<p class="layer_board_btn"><a href="#">もう一度開く</a></p>

</div><!-- //再読み込み --> --%>

  


</div>
</div>

</body>
</html>
