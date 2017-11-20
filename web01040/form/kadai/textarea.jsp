<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>テキストエリア</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<h4>入力された文章は、次のとおりです。</h4>
<table border="1">
<td>
<%
request.setCharacterEncoding("UTF-8");
  StringBuffer text = new StringBuffer(request.getParameter("textarea"));
  
 		int br = (new String(text)).indexOf('\n');
        while(br > 0){
            text.replace(br, br+1, "<BR>");
            br = (new String(text)).indexOf('\n');
       }
       out.println(text);   
       %>
 </td>      

</table><br>
<a href="textarea.html">戻る</a>
</body>
</html>