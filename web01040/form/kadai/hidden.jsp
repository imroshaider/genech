<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>hidden.jsp</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<p>隠されていた情報は、次のとおりです。<p>
<%=request.getParameter("data") %><br>
<a href="hidden.html">戻る</a>
</body>
</html>