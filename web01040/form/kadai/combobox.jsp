<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>combobox.jsp</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<h4>コンボボックス</h4>
<%
request.setCharacterEncoding("UTF-8");
out.print("あなたの好きなフルーツは");
out.print(request.getParameter("combobox"));
out.print("ですね");
%><br>
<a href="combobox.html">戻る</a>
</body>
</html>