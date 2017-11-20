<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ユーザー情報</title>
</head>
<body>
<% 
		request.setCharacterEncoding("UTF-8");

		String userid=(String)request.getAttribute("userid");

		String[] records=(String[])request.getAttribute("records");
%>		
<h3><%= userid %>さんのユーザー情報</h3>
<%
		for(int i =0; i < records.length; i++){
		out.println(records[i] + "<br>");
		}
%>
<br>
<a href="login.html">ログインページに戻る</a>
<hr>
01組　040番　イムロス
</body>
</html>		