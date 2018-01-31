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

	<div class="page-header text-center">
		Paid
	</div>
	
	<div class="container">
	
	<div class="row">
		 <h4>
        <table class="table text-left"> <!-- thの中にデータいれる -->
        <tr><th>No.：<%= url %></th><th></th></tr>
        <tr><th>氏名：<%= url %></th><th></th></tr>
        <tr><th>ユーザーID：<%= url %></th><th></th></tr>
        <tr><th>企業名：<%= url %></th><th></th></tr>
        <tr><th>企業ID：<%= url %></th><th></th></tr>
        <tr><th>行き先：<%= url %></th><th></th></tr>
        <tr><th>宿泊先：<%= url %></th><th></th></tr>
        <tr><th>チェックイン：<%= url %></th><th></th></tr>
        <tr><th>チェックアウト：<%= url %></th><th></th></tr>
        <tr><th>料金：<%= url %></th><th></th></tr>
        <tr><th>利用機関：<%= url %></th><th></th></tr>
        <tr><th><div class="input-group"><label class="input-group-btn"><span class="btn btn-primary">Choose file<input type="file" style="display:none" class="uploadFile"></span></label><input type="text" class="form-control" readonly=""></div></tr><tr></tr></th>
        </table>
        </h4>
	
	</div>
	
	</div>

</body>
</html>