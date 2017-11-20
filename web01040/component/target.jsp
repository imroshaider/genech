<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>target.jsp</title>
</head>
<body>
<%
String strPara= request.getParameter("data");
out.println("[target.jsp]パラメータの値:" + strPara +"<br>");
%>
</body>
</html>
