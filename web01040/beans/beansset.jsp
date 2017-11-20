<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="person" class="beans.PersonBean" scope="session" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Beans Set</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name=request.getParameter("name");
	int age = Integer.parseInt(request.getParameter("age"));
	person.setName(name);
	person.setAge(age);
%>
<p>PersonBeanに氏名と年齢をセットしました。</p>
<a href="beansget.jsp">PersonBeanの値を取り出す</a>
<hr>
01組 01040番　イムロス
</body>
</html>