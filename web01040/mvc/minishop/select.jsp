<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="mvc.minishop.ItemBean" %>
<%@ page import="java.util.List" %> 
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>	商品一覧</title>	
<link rel="stylesheet"  href="minishop.css">
</head>
<body>
<h3>ジャンルべ別商品一覧</h3>
01組　040番　イムロス<br>
<hr>
<table border="1px solid">
<tr><th>商品名</th><th>メーカー。著者<br>アーテイスト</th><th>価格</th><th>評価</th></tr>
<%
		ItemBean itemBean = null;

		List<ItemBean> items = (ArrayList<ItemBean>)session.getAttribute("items");
		DecimalFormat df = new DecimalFormat("#,##0");

			for(int i =0; i< items.size();i++){
				itemBean = items.get( i );
			out.println("<tr><td>");
			out.println(itemBean.getName());
			out.println("</td><td>");
			out.println(itemBean.getMaker());
			out.println("</td><td  class='td_right'>");
			out.println("&yen;" + df.format(itemBean.getPrice()));
			out.println("</td><td  class='td_center'>");
			
			out.println("<a href='itemcontroller?process=detail&ident=" + itemBean.getIdent() + "'>リンク</a>");
			out.println("</td></tr>");
		}
%>
</table>
<br>
<a href="itemcontroller">ジャンル選択に戻る</a>
</body>
</html>
