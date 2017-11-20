<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.*" %>
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
<h1 >情報処理技術者試験(評細)</h1>
<table  class="mainTable" width="400px" align="center">
<%
	request.setCharacterEncoding("UTF-8");
	List<String> rankList= new ArrayList<String>();
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;
	try{
	ctx = new InitialContext();
	ds=(DataSource)ctx.lookup("java:comp/env/jdbc/itee");
	con=ds.getConnection();
	String strSql="select * from rank";
	ps = con.prepareStatement(strSql);
	rs=ps.executeQuery();
	while(rs.next()){
	rankList.add(rs.getString("rank"));
	}
	strSql="select * from examination where ident = ?";
	
	ps = con.prepareStatement(strSql);
	int ident= Integer.parseInt(request.getParameter("ident"));
	ps.setInt(1,ident);
	
	rs=ps.executeQuery();
	rs.next();
	
	
			
			out.println("<tr><th>No</th><td><a href='upDel.jsp?ident=" + rs.getInt("ident") + "'>" + rs.getInt("ident") + "</a></td>");
			out.println("<tr><th>試験区分</th><td>" + rs.getString("classification") + "</td></tr>");
			out.println("<tr><th>暗号</th><td>" + rs.getString("mnemonic") + "</td></tr>");
			out.println("<tr><th>英語名称</th><td>" + rs.getString("english_name") + "</td></tr>");
			out.println("<tr><th>ランク</th><td>" +  rankList.get(rs.getInt("rank") - 1 ) + "</td></tr>");
			//out.println("<tr><th>ランク</th><td>" + "レベル"　+ rs.getInt("rank")  + "</td></tr>");
			out.println("<tr><th>対象者</th><td>" + rs.getString("target") + "</td></tr>");
			
		
	
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
<h3>01組 01040番　イムロス</h3>
<p><a href="main.jsp">メイン画面に戻る</a></p>
</div>
</div>
</body>
</html>