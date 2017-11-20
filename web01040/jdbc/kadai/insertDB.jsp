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
<h1 align="center">情報処理技術者試験(DB新規登録)</h1>
<table class="mainTable"  align="center" >

<%
	request.setCharacterEncoding("UTF-8");
	List<String> rankList= new ArrayList<String>();
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;

	String classss = request.getParameter("classification");
	String mneonicc = request.getParameter("mnemonic");
	String englishh = request.getParameter("english");
	String cnt= request.getParameter("rank");
	String  targett= request.getParameter("target");

			if(classss == null || classss.equals("") || mneonicc == null || mneonicc.equals("") || englishh == null || englishh.equals("") || cnt == null || cnt.equals("") || targett == null || targett.equals("") ){

		out.println("<div class='line' align='center'>入力項目があります。<br>");
		out.println("全項目を入力してください。<br><br>");
		out.println("<br>");
		out.println("<a href='insert.jsp'>新規ユーザー登録へ戻る</a></div>");

		}
		else{
	
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
	 strSql="insert into examination(classification,mnemonic,english_name,rank,target)values(?,?,?,?,?)";
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
	
	ps.executeUpdate();
	strSql="select last_insert_id()";
	
	ps = con.prepareStatement(strSql);
	rs=ps.executeQuery();
	rs.next();
	int ident=rs.getInt(1);


	


			
			out.println("<tr><th>No</th><td>"+ ident + "</td></tr>");

			out.println("<tr><th>試験区分</th><td>" + request.getParameter("classification") + "</td></tr>");
			out.println("<tr><th>暗号</th><td>" + request.getParameter("mnemonic") + "</td></tr>");

			out.println("<tr><th>英語名称</th><td>" +  request.getParameter("english") + "</td></tr>");
			int cent= Integer.parseInt(request.getParameter("rank"));
			out.println("<tr><th>ランク</th><td>" +  rankList.get((cent) - 1) + "</td></tr>");
			out.println("<tr><th>対象者</th><td width='200px' height='90px'>" + request.getParameter("target") + "</td></tr></table>");
			
			out.println("<div align='center'>データを登録しました</div>");
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
}



%>
<h3 align="center">01組 01040番　イムロス</h3>
<p ><a href="main.jsp">メイン画面に戻る</a></p>

</body>
</html>