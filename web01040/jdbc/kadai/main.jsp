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
<title>情報処理技術者試験</title>
<link rel="stylesheet" href="css/kadai.css">
</head>
<body>
<div class="main">
<div class="sub">
<h1 >情報処理技術者試験</h1>

<table  id="mainTable1" width="400px" align="center">
<tr>
<th class="head" align="center">No</th><th>試験区分</th><th>暗号</th>
</tr>

<%

	request.setCharacterEncoding("UTF-8");
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;
	try{
	ctx = new InitialContext();
	ds=(DataSource)ctx.lookup("java:comp/env/jdbc/itee");
	con=ds.getConnection();
	String strSql="select ident,classification,mnemonic from examination";
	
	ps = con.prepareStatement(strSql);
	rs=ps.executeQuery();
	
	while(rs.next()){
			out.println("<tr><td ><a href='detail.jsp?ident=" + rs.getInt("ident") + "'>" + rs.getInt("ident") + "</a></td>");

			out.println("<td class='left'>" + rs.getString("classification") + "</td>");
			out.println("<td>" + rs.getString("mnemonic") + "</td></tr>");
		
	}
	}catch(Exception e){
			System.out.println("error");
			
	}finally{
	  try{
	  if(rs !=null)  rs.close();
	  if(con !=null)  con.close();
	  if(ps !=null)  ps.close();
	  }catch(Exception e){
	  System.out.println("error");
			
	  }
	}

%>
</table>
<p><a href="insert.jsp">新規登録</a></p>

<h3>01組 01040番　イムロス</h3>
</div>
</div>
</body>
</html>