
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
	<title>マイページ</title>


	<link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/img.css" rel="stylesheet">

</head>
<body>
<TABLE border="1" algin="center">
<tr>
<th>Email</th><th>Name</th><th>des1</th><th>des2</th><th>des3</th><th>cost</th><th>hope</th><th>zikan</th><th>in</th><th>out</th><th>count</th></tr>
    <%
     response.setIntHeader("Refresh", 20);
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from travelsearch order by zikan desc";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){

 out.println("<tr><td>" + x.getString("ID") + "</td>");

 out.println("<td>" + x.getString("Name") + "</td>");
 out.println("<td>" + x.getString("Des1") + "</td>");    
 out.println("<td>" + x.getString("Des2") + "</td>");
 out.println("<td>" + x.getString("Des3") + "</td>");
  out.println("<td>" + x.getString("Cost") + "</td>");
   out.println("<td>" + x.getString("Hope") + "</td>");
    out.println("<td>" + x.getString("zikan") + "</td>");
     out.println("<td>" + x.getString("CheckIn") + "</td>");
      out.println("<td>" + x.getString("Checkout") + "</td>");
       out.println("<td>" + x.getString("count") + "</td>");
 
  }

  
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
</TABLE>
	


 
</body>
</html>
