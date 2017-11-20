<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>import.jsp</title>	
</head>
<body>
<h4>1組　40番　イムロス</h4>
<%
	DecimalFormat df =new DecimalFormat("#,##0");

%>
「独習Javaサーバサイド編第２版」は、<%= df.format(3600) %>円（税別）です。
</body>
</html>
