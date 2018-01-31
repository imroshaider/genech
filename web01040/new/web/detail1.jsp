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
    String id =request.getParameter("ID");
    String des1="";
    String vehicle="";
    String hotel="";
    String checkin="";
    String checkout="";
    String detail="";
    String people="";
    
            Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from temppalan where ID='"+id+"'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){  
           des1 =x.getString("Des1");  
           vehicle =x.getString("vehicle");  
           hotel =x.getString("Hotel");  
           checkin =x.getString("CheckIn");  
           checkout =x.getString("Checkout");  
           detail =x.getString("detal"); 
           people=x.getString("people"); 
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
        <tr><th>行き先：<%= des1 %></th><th></th></tr>
         <tr><th>乗り物：<%= vehicle %></th><th></th></tr>
         <tr><th>人数：<%= people %></th><th></th></tr>
         <tr><th>ホテル：<%= hotel %></th><th></th></tr>
	 <tr><th>チェックイン：<%= checkin %></th><th></th></tr>
          <tr><th>チェックアウト：<%= checkout %></th><th></th></tr>
         <tr><th>コメント：<%= detail %></th><th></th></tr>
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
