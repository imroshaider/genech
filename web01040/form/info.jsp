<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>info.jsp</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<%
request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("name")); %>
さんの年齢 <%request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("age")); %>
です。
</body>
</html>