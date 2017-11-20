<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset ="UTF-8">
<title>circle.jsp</title>
</head>
<body>
<h4>01組　40番　イムロス</h4>
<table border ="1">
<tr>
<th>半径</th>
<td>
<% request.setCharacterEncoding("UTF-8");
out.print(request.getParameter("radius")); %> 
</td>
</tr>
<tr>
<th>円周</th>
<td>
<% request.setCharacterEncoding("UTF-8");
out.print(Double.parseDouble(request.getParameter("radius")) * 2 * Math.PI); %>
</td>
</tr>
<tr>
<th>面積</th>
<td>
<% request.setCharacterEncoding("UTF-8");
out.print(Double.parseDouble(request.getParameter("radius"))*Double.parseDouble(request.getParameter("radius"))*Math.PI); %>
</td>
</tr>
</table>
<a href="circle.html">戻る</a>

</body>
</html>