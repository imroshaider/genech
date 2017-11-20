<%@ page contentType="text/html; charset=UTF-8" %>
<%@page import="java.sql.SQLException"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mvc.Database.DBConnection"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Planning</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</head>
<body>
    <%
    String name=" ";
    Connection con = DBConnection.createConnection();
  PreparedStatement preparedStatement = null;
String id = (String)request.getSession().getAttribute("userid");

     String uid=request.getParameter("uid");
     Integer people=2;
     System.out.println(uid);

             
     try{
          String query = "select * from subcompany where Email='"+id+"'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
 name=x.getString("Name");

     }


 }
      catch(SQLException e)
{
e.printStackTrace();
}
      String query1 = "select * from travelsearch where Uid='"+uid+"'";
          preparedStatement = con.prepareStatement(query1);
ResultSet y =preparedStatement.executeQuery();

 while(y.next()){

        %>
 
	<div class="page-header text-center">
	<h1>プラン提案ページ</h1>
	</div>
	<!-- コンテナ1 -->
	<div class="container text-center">
	
	 <div class="col-md-2">
	 	<br />
	 </div>
	 
	 <div class="col-md-8">
        <!-- 入力フォーム -->
		<form action="TeianServlet" method="post" class="form-horizontal">
		<div class="form-group">
			<label for="input_text" class="col-md-3 control-label">企業名</label>
			<div class="col-md-9">
			  <input type="text" value="<%=name%>" class="form-control" name="CName" placeholder="<%=name%>"/><br />
			</div>
		</div>
		<div class="form-group">
			<label for="input_text" class="col-md-3 control-label">人数</label>
			<div class="col-md-9">
			  <input type="text"  value="<%=people%>" class="form-control" name="people"  /><br />
			</div>
		</div>
		<div class="form-group">
			<label for="input_text" class="col-md-3 control-label">行き先</label>
			<div class="col-md-9">
			  <select class="form-control" id="ABCDE" name="des1">
			  	<option value="<%=y.getString("Des1")%>"><%=y.getString("Des1")%></option>
			  	<option value=""><%=y.getString("Des2")%><%=y.getString("Des2")%></option>
			  	<option value="<%=y.getString("Des3")%>"><%=y.getString("Des3")%></option>
			  </select><br />
			  <input type="text" class="form-control" name="hotel" placeholder="ホテル名orホテルのURL" /><br />
			</div>
		</div>
		<div class="form-group">
			<label for="input_text" class="col-md-3 control-label">チェックイン日時</label>
			<div class="col-md-9">
			  <input type="date" value="<%=y.getString("CheckIn")%>" class="form-control" name="checkin" placeholder="チェックイン日時" /><br />
			</div>
		</div>
		<div class="form-group">
			<label for="input_text" class="col-md-3 control-label">チェックアウト日時</label>
			<div class="col-md-9">
			  <input type="date" value="<%=y.getString("Checkout")%>"  class="form-control" name="checkout" placeholder="チェックアウト日時" /><br />
			  <input type="text" class="form-control" name="vehicle" placeholder="乗り物" /><br />
			  <input type="text" value="<%=y.getString("Cost")%>" class="form-control" name="cost" placeholder="料金" /><br />
			  <input type="text" class="form-control" name="detail" placeholder="プラン詳細" /><br />
			</div>
		</div>
                          <input type="hidden" value="<%=y.getString("ID")%>" name="userid">
                           <input type="hidden" value="<%=y.getString("Name")%>" name="username">
                           <input type="hidden" value="<%=uid%>" name="uuid">
                           <% }%>
		<input type="submit" value="提案する" class="btn btn-primary">
		</form>
		<!-- 入力フォームここまで -->
	 </div>
	 
	 <div class="col-md-2">
	 	<br />
	 </div>
	 
	</div>
	<!-- コンテナ1ここまで -->

<script src="//code.jquery.com/jquery.js"></script>
<script src="js/bootstrap.min.js">
</script>
</body>
</html>