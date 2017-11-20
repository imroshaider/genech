<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>GETメトッドの処理</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<p>GETメトッドで送られたきたデータは
<%
request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("data")); %> です。</p>
</body>
</html>