<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ユーザー登録</title>
<link rel="stylesheet" href="login.css">
</head>
<body>
<div id="main">
<%
	request.setCharacterEncoding("UTF-8");
	String ident = request.getParameter("ID");
	String pass = request.getParameter("password");
	String name = request.getParameter("email");
	
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;





	
			ctx = new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/pbl2");
			con=ds.getConnection();
			String strSql ="select * from user where ID = ?";
			ps = con.prepareStatement(strSql);
			ps.setString(1,ident);
			rs=ps.executeQuery();


			
		
			   strSql="insert into user(ID,PASS,Mail) values(?,?,?)";
			   ps = con.prepareStatement(strSql);
			   ps.setString(1,ident);
			   ps.setString(2,pass);
			   ps.setString(3,name);
			   ps.executeUpdate();
		
	
%>
<br><br>
<hr>
<p>○1組　040番　イムロス</p>
</div>
</body>
</html>
