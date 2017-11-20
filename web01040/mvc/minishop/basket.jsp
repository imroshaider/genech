<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<jsp:useBean id="itemBasketBean" class="mvc.minishop.ItemBasketBean" scope="session" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>ItemBasketBean</title>
<link rel="stylesheet"  href="minishop.css">
</head>
<body>
<h3>バスケットの商品</h3>
01組　040番　イムロス<br>
<hr>
<table>
<tr><th>商品名</th><th>メーカー。著者<br>アーテイスト</th><th>価格</th><th>注文数</th><th>金額</th><th>削除</tr>
<%
	DecimalFormat df = new DecimalFormat("#,###");
	for(int i = 0; i<itemBasketBean.getSize( ); i++){


%>
		<tr><td><%= itemBasketBean.getItem(i).getName() %></td> 
			<td><%= itemBasketBean.getItem(i).getMaker() %></td>
			<td class="td_right">&yen;<%= df.format(itemBasketBean.getItem(i).getPrice()) %></td>
			<form method="POST" action="itemcontroller">
			<input type="hidden" name="process" value="change">
			<input type="hidden" name="number" value="<%= i %>">

			<td class="td_center">
			<input type="text" name="quantity" value="<%= itemBasketBean.getItemQuantity(i) %>" size="2">
			<input type="submit" value="変更">
			</td>
		</form>
			
			<td class="td_right">&yen;<%= df.format(itemBasketBean.getTotal(i)) %></td>
			<form method="POST" action="itemcontroller">
			<input type="hidden" name="process" value="delete">
			<input type="hidden" name="number" value="<%= i %>">
			<td class="td_center">
					<input type="submit" value="削除">
			</td>
		</form>	
		</tr>			
<%
}
%>
		<tr><th colspan="4">合計金額</th>
			<th class="td_right">&yen;<%= df.format(itemBasketBean.getSum()) %></th>
			<form method="POST" action="itemcontroller">
				<input type="hidden" name="process" value="clear">
				<th><input type="submit" value="全て"></th>
				
			</form>
			
		</tr>
</table>
<br>
<a href="itemcontroller">ジャンル選択に戻る</a>
</body>
</html>