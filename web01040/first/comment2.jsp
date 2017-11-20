<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>comment.jsp</title>
</head>
<body>
<h4>1組　40番　イムロス</h4>
<%
	//これはJavaの1行コメントです。
	out.println("Javaの1行コメントは「//」で記述します。<br>");
	/*
	これは復数行にわたるコメントです。
	*/
	out.println("復数行にわたるコメントは「/* */で記述します。");
%>
</body>
</html>

