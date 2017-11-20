<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>セッション3</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String strJob= request.getParameter("job");
if(strJob !=null) {
	session.setAttribute("job",strJob);
}
%>
<h3>セッション3<br>
01組　040番　イムロス </h3>
Session ID=<%= session.getId() %><br>
名前: <%=(String)session.getAttribute("userName") %><br>
職業: <%= strJob %><br>
<form method="PSOT" action="session4.jsp">
年齢: <input type="text" name="age"><br>
<input type="submit" value="送信">
</form>
</body>
</html>