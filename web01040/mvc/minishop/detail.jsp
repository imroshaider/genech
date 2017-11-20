<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<jsp:useBean id="itemBean" class="mvc.minishop.ItemBean" scope="session" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>評細表示</title>
<link rel="stylesheet"  href="minishop.css">
</head>
<body>
<%
	DecimalFormat df = new DecimalFormat("#,##0");
%>
<h3>商品評細表示</h3>
01組　040番　イムロス<br>
<hr>
<form method="POST" action="itemcontroller">
<table border="1px">
<tr><th>商品名</th>
<td><%=itemBean.getName() %></td></tr>
<tr><td colspan="2"><div class="td_center">
<img class="detail_img" src="images/<%=itemBean.getImage() %>"></div></td></tr>
<tr><th>メーカー。著者<br>アーテイスト</th>
<td><%=itemBean.getMaker() %></td></tr>
<tr><th>価　格</th>
<td>&yen;<%=df.format(itemBean.getPrice()) %></td></tr>
<tr><th>注文数</th>
<td><input type="text" name="quantity" size="2" value="1"></td></tr>
<tr><td colspan="2" class="td_center"><input type="submit" value="バスケットに入れる"></td></tr>
</table>
<input type="hidden" name="process" value="addBasket">
</form>
<br>
<a href="itemcontroller?process=returnselect">ジャンル別商品一覧に戻る</a>
</body>
</html>	