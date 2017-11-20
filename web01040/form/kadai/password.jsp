<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>password.jsp</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<%request.setCharacterEncoding("UTF-8");
out.print("入力されたユーザーIDは、");
out.print(request.getParameter("name")); 
out.print("です。<br>"); %>

<%request.setCharacterEncoding("UTF-8");
out.print("入力されたパスワードは、");
out.print(request.getParameter("password")); 
out.print("です。<br>"); %>
<a href="password.html">戻る</a>

</body>
</html>