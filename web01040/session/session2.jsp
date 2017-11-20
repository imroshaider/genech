<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>セッション2</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String strUserName=request.getParameter("userName");
if(strUserName !=null){
	session.setAttribute("userName",strUserName);
}
%>
<h3>セッション2<br>
01組　040番　イムロス </h3>
Session ID = <%= session.getId() %><br>
名前: <%= strUserName %><br>
<form method="POST" action="session3.jsp">
職業:<input type="text" name="job"><br>
<input type="submit" value="送信">
</form>
</body>
</html>