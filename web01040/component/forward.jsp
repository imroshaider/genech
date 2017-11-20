<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>forward.jsp</title>
</head>
<body>
<%
String strPara = request.getParameter("data");
out.println("[forward.jsp]パラメータの値:" + strPara +"<br>");
%>
<jsp:forward page="target.jsp" />
</body>
</html>