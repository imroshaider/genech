
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context,javax.naming.InitialContext" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>dbinsert.jsp</title>
</head>
<body>
<%
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;
	try{
	ctx = new InitialContext();
	ds=(DataSource)ctx.lookup("java:comp/env/jdbc/jsp");
	con=ds.getConnection();
	String strSql="insert into person(name,company_id,age) values('深沢七郎',3,29)";
	 
	 ps = con.prepareStatement(strSql);
	 int insert_cnt=ps.executeUpdate(strSql);
	 System.out.println("dbinsert.jsp:insert_cnt=" + insert_cnt);
	 strSql="select * from person";
	ps = con.prepareStatement(strSql);
	rs=ps.executeQuery();
	while(rs.next()){
			out.println("uid = " + rs.getInt("uid") + ",name=" + rs.getString("name") + "<br>");
	}
	}catch(Exception e){
			System.out.println("try block: " + e.getMessage());
			e.printStackTrace();
	}finally{
	  try{
	  if(rs !=null)  rs.close();
	  if(con !=null)  con.close();
	  if(ps !=null)  ps.close();
	  }catch(Exception e){
	  System.out.println("finally block: " + e.getMessage());
			e.printStackTrace();
	  }
	}
	%>
	<hr>
	 <h4>01組　040番　イムロス </h4>
   </body>
   </html>