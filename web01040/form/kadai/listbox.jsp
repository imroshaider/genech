<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>listbox.jsp</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<h4>リストボックス</h4>
<%
request.setCharacterEncoding("UTF-8");
String[] values=request.getParameterValues("listbox");
	out.println("あなたの好きなフルーツは");
	for(int i=0;i<values.length;i++){
	out.print(values[i]);
if(i+1 !=values.length){
	out.print("と");
	}
}
out.print("ですね");
%><br>
<a href="listbox.html">戻る</a>
</body>
</html>