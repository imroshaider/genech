<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.File"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>

<%@page import="java.sql.Connection"%>
<%@page import="mvc.Database.DBConnection"%>
<%@page import="mvc.Companypage.ProfileservletCompany"%>
<%@page import="java.sql.ResultSet"%>


<!DOCTYPE html>
<html lang="ja">

<head>
	<meta charset="utf-8">
	
	<title>管理</title>


	

</head>
<body>
<div align="center" top-bottom="10px">
<!--<form method="POST" action="Kakuninservlet" >-->
<TABLE border="1" algin="center">
<tr>
<th>Email</th><th>Name</th><th>Pass</th><th>Address</th><th>Code</th><th>Url</th><th>proess</th></tr>
    <%
    
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from subcompany where Proess = 'NO'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
 out.println("<form method='POST' action='Kakuninservlet' >");
 out.println("<tr><td>" + x.getString("Email") + "</td>");

 out.println("<td>" + x.getString("Name") + "</td>");
 out.println("<td>" + x.getString("Pass") + "</td>");    
 out.println("<td>" + x.getString("Address") + "</td>");
 out.println("<td>" + x.getString("Code") + "</td>");
 out.println("<input type='hidden' name='Email' value='" + x.getString("Email") + "'>");
 out.println("<input type='hidden' name='Pass' value='" +  x.getString("Pass") + "'>");
  out.println("<input type='hidden' name='Name' value='" +  x.getString("Name") + "'>");
 out.println("<td>" + x.getString("Url") + "</td><td><input type='submit' value='send'></td>");
 out.println("</form>");
  }

  
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>
</TABLE>
	

</div>
</body>
</html>