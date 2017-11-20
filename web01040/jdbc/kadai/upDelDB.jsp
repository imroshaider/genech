<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.*" %>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>情報処理技術者試験</title>
<link rel="stylesheet" href="css/kadai.css">
</head>
<body>
<div class="main">
<div class="sub">
<h1 align="center">情報処理技術者試験(DB更新・削除)</h1>
<table  class="mainTable" width="400px" align="center">
<%
	request.setCharacterEncoding("UTF-8");
	List<String> rankList= new ArrayList<String>();
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;
	String check=null;
	String strSql= null;

try{

	if(request.getParameter("radio") != null) {
                if(request.getParameter("radio").equals("updel")) {
	ctx = new InitialContext();
	ds=(DataSource)ctx.lookup("java:comp/env/jdbc/itee");
	con=ds.getConnection();
	strSql="select * from rank";
	ps = con.prepareStatement(strSql);
	rs=ps.executeQuery();
	while(rs.next()){
	rankList.add(rs.getString("rank"));
	}
	strSql="update  examination set classification=?,mnemonic=?,english_name=?,rank=?,target=? where ident = ?";
	ps = con.prepareStatement(strSql);
	String classification= request.getParameter("classification");
	ps.setString(1,classification);
	String mnemonic= request.getParameter("mnemonic");
	ps.setString(2,mnemonic);
	String english= request.getParameter("english");
	ps.setString(3,english);
	int rank= Integer.parseInt(request.getParameter("rank"));
	ps.setInt(4,rank);
	String target= request.getParameter("target");
	ps.setString(5,target);

	int ident= Integer.parseInt(request.getParameter("ident"));
	ps.setInt(6,ident);
	ps.executeUpdate();

	check = "updel";
}else{
	ctx = new InitialContext();
	ds=(DataSource)ctx.lookup("java:comp/env/jdbc/itee");
	con=ds.getConnection();
	strSql="select * from rank";
	ps = con.prepareStatement(strSql);
	rs=ps.executeQuery();
	while(rs.next()){
	rankList.add(rs.getString("rank"));
	}
	strSql = "delete from examination where ident= ?";
	ps = con.prepareStatement(strSql);
	int ident= Integer.parseInt(request.getParameter("ident"));
	ps.setInt(1,ident);
	ps.executeUpdate();
	check ="del";

	}
}			
			out.println("<tr><th>No</th><td>"+ request.getParameter("ident") + "</td></tr>");

			out.println("<tr><th>試験区分</th><td>" + request.getParameter("classification") + "</td></tr>");
			out.println("<tr><th>暗号</th><td>" + request.getParameter("mnemonic") + "</td></tr>");

			out.println("<tr><th>英語名称</th><td>" +  request.getParameter("english") + "</td></tr>");
				int cent= Integer.parseInt(request.getParameter("rank"));
			out.println("<tr><th>ランク</th><td>" +  rankList.get((cent) - 1) + "</td></tr>");
			out.println("<tr><th>対象者</th><td width='200px' height='90px'>" + request.getParameter("target") + "</td></tr></table>");
			if(check.equals("updel")){
			out.println("<div align='center'>データを更新しました</div>");
	}else  {
		out.println("<div align='center'>データを削除しました</div>");
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

<h3>01組 01040番　イムロス</h3>
<p><a href="main.jsp">メイン画面に戻る</a></p>
</div>
</div>
</body>