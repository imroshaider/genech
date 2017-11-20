<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>	ジャンル選択</title>
</head>
<body>
<h3>ジャンル選択</h3>
01組　040番　イムロス
<hr>
お好みのジャンルを選択してください。<br>
<form method="POST" action="itemcontroller">
<input type="radio" name="genre" value="pc">パソコン&nbsp;&nbsp;
<input type="radio" name="genre" value="book" checked>ブック&nbsp;&nbsp;
<input type="radio" name="genre" value="music">ミュージック&nbsp;&nbsp;
<input type="hidden" name="process" value="select">
<input type="submit" value="選択">
</form>
</body>
</html>