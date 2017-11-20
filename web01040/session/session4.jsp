<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>セッション4</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String strAge= request.getParameter("age");
if(strAge !=null) {
	session.setAttribute("age",strAge);
}
%>
<h3>セッション4<br>
01組　040番　イムロス </h3>
Session ID=<%= session.getId() %><br>
名前: <%=(String)session.getAttribute("userName") %><br>
職業: <%=(String)session.getAttribute("job") %><br>
年齢: <%= strAge %><br>
<hr>
<% session.removeAttribute("job"); %>
<a href="session5.jsp">次へ(職業のセッション情報破棄済み)</a>
</body>
</html>