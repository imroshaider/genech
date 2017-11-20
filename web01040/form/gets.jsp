<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>同ーパラメータ</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<% request.setCharacterEncoding("UTF-8"); %>
<%
  String[] values = request.getParameterValues("data");
  for( int i = 0 ; i < values.length ; i++){
  out.println("GETメソッドで送られてきたデータは" + values[i] + "です。<br>");

}
%>
</body>
</html>