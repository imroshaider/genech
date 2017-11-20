<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>参考図書</title>
</head>
<body>
<p>あなたにお薦めの書籍は次のとおりです。</p>

<%

List<String> list=(ArrayList<String>)request.getAttribute("bookList");
     int listSize= list.size();
     for(int i= 0; i< listSize;i++){
     out.println(list.get(i) + "<br>");
     }
  %>
     <br>
     <a href="category.html">戻る</a>
     <hr>
01組　040番　イムロス
</body>
</html>