<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>redirect.jsp</title>
</head>
<body>
<%
String strPara= request.getParameter("data");
out.println("[redirect.jsp]パラメータの値:" + strPara +"<br>");
response.sendRedirect("target.jsp");
%>
</body>
</html>