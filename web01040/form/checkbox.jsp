<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF=8">
<title>チェックボックス</title>
</head>
<body>
<h4>01組 40番　イムロス</h4>
<p>チェックボックス受信結果</p>
<%
request.setCharacterEncoding("UTF-8");
	String[] values=request.getParameterValues("fruit");
	out.println("あなたの一番好きな果物");
	for(int i=0;i<values.length;i++){
	out.print(values[i]);
if(i+1 !=values.length){
	out.print("と");
	}
}


	%>
です。</p>
</body>
</html>