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
	String ident = request.getParameter("inputId");
	String pass = request.getParameter("inputPass");
	String name = request.getParameter("inputName");
	
	Context ctx =null;
	DataSource ds =null;
	Connection con =null;
	PreparedStatement ps =null;
	ResultSet rs =null;





	// 発生したエラー、例外を特定するコード番号を代入する
	int errCode=0;

	// パラメータの値の有効性チェック
	if (ident == null || ident.equals("") ||
		pass == null  || pass.equals("") ||
		name == null  || name.equals("")) {
		errCode = 100;  // 無効なパラメータの場合
	} else {
		try {
			ctx = new InitialContext();
			ds=(DataSource)ctx.lookup("java:comp/env/jdbc/login");
			con=ds.getConnection();
			String strSql ="select * from password where ident = ?";
			ps = con.prepareStatement(strSql);
			ps.setString(1,ident);
			rs=ps.executeQuery();


			// 入力されたユーザーIDをキーに、データベースからデータを抽出




			// executeQuery()メソッドの戻り値であるリザルトセット(rs）は先頭データの
			// 前にカーソルがあるので、必ずnext()メソッドの実行が必要
			// そのnext()メソッドの戻り値は、データがあれば「true」、なければ「false」
			if(rs.next()){
			    // rs.next()の戻り値がtrue → データがある → 既に登録済み
			    errCode = 200;
			} else {
			    // rs.next()の戻り値がfalse → データがない → 未登録
			    // 受け取ったユーザーID、パスワード、名前でデータベースに登録する
			   strSql="insert into password(ident,pass,name) values(?,?,?)";
			   ps = con.prepareStatement(strSql);
			   ps.setString(1,ident);
			   ps.setString(2,pass);
			   ps.setString(3,name);
			   ps.executeUpdate();
			}
		} catch(SQLException e) {
			// SQLに関する処理で例外発生
			errCode = 900;
			e.printStackTrace();
        } catch(Exception e) {
            // SQL以外の例外発生
            errCode = 910;
			e.printStackTrace();
		} finally {
		    // 例外発生の有無にかかわらず、ここで記述した処理が行われる
			try {
				if (rs != null)  rs.close( );
				if (ps != null)  ps.close( );
				if (con != null) con.close( );
			} catch(SQLException e){
				// SQLに関する処理で例外発生
				errCode=900;
				e.printStackTrace();
			}
		}
	}
	// errCodeの値に応じたメッセージを表示する
	if (errCode == 0) {
		// エラーがなく、正しく登録された場合
		out.println("<h2>ユーザー登録が完了しました。</h2>");
		out.println("<hr><br>");
		out.println("<table id='regiTable'>");
		out.println("<tr><th>ユーザーID</th><td>" + ident + "</td></tr>");
		out.println("<tr><th>パスワード</th><td>" + pass + "</td></tr>");
		out.println("<tr><th>お名前</th><td>" + name + "</td></tr>");
		out.println("</table><br>");
		out.println("<a href='login.html'>ログインページへ</a>");
	} else if (errCode == 100) {
		out.println("<h2>未入力項目があります。</h2>");
		out.println("<hr><br>");
		out.println("ユーザーID、パスワード、お名前のすべての項目を入力してください。<br><br>");
		out.println("<a href='register.html'>新規ユーザー登録へ戻る</a>");
	} else if (errCode == 200) {
		out.println("<h2>ユーザーIDは登録済みです。</h2>");
		out.println("<hr><br>");
		out.println("入力されたユーザーID(<b>" + ident + "</b>)は、すでに登録済みです。<br>");
		out.println("他のユーザーIDをご利用ください。<br /><br>");
		out.println("<a href='register.html'>新規ユーザー登録へ戻る</a>");
	} else 	if (errCode == 900) {
		out.println("<h2>SQLエラー</h2>");
		out.println("<hr><br>");
		out.println("SQLでエラーが発生しました。<br>");
		out.println("管理者に連絡してください。<br><br>");
		out.println("<a href='login.html'>ログインページへ</a>");
    } else 	if (errCode == 910) {
	    out.println("<h2>データベースエラー</h2>");
	    out.println("<hr><br>");
	    out.println("データベースでエラーが発生しました。<br>");
	    out.println("管理者に連絡してください。<br><br>");
	    out.println("<a href='login.html'>ログインページへ</a>");
	}
%>
<br><br>
<hr>
<p>○1組　040番　イムロス</p>
</div>
</body>
</html>
