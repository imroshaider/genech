<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="person" class="beans.PersonBean" scope="session" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Beans Get</title>
</head>
<body>
PersonBeanから氏名と年齢を取り出します。<br>
<p>
氏名　：<%= person.getName() %><br>
年齢　:<%= person.getAge() %>
</p>
<a href="beansform.jsp">入力フォームに戻す</a>
<hr>
01組 01040番　イムロス
</body>
</html>