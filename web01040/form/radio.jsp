<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF=8">
<title>ラジオボタン</title>
</head>
<body>
<h4>01組 40番　イムロス</h4>
<p>チェックボックス受信結果</p>
<p>あなたの一番好きな果物
<%
	request.setCharacterEncoding("UTF-8");
	out.println(request.getParameter("fruit"));
	%>
ですね。</p>
</body>
</html>
