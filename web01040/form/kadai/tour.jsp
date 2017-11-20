<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE=html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>見積り結果</title>
<link rel="Stylesheet" href="tour.css">
</head>
<body>
<div id="main">
<h4>ハワ旅行見積り結果</h4>
<% request.setCharacterEncoding("UTF-8");
		DecimalFormat df = new DecimalFormat("#,##0");

		String[] courseNames={"エコノミークラス","ビジネスクラス","LCC(ローコストキャリア)クラス"};
		int[] coursePrice={150000,200000,100000};
		String[] options={"ポリネシア文化センター","サンセットクルーズ","キラウエア火山観光"};
		int[] optionprices={5000,10000,40000};


		int course=Integer.parseInt(request.getParameter("course"))-1;

		String[] strOptions=request.getParameterValues("option");

		int total=0;
%>
<table id="mainTable">
<tr> 
     <td><%= courseNames[course] %></td>
     <td class="rightPos">&yen;<%=df.format(coursePrice[course]) %></td>
 </tr>
 <%
       total +=coursePrice[course];
       if(strOptions !=null) {
       
         int index=0;
         for(int i=0;i<strOptions.length;i++){
         index=Integer.parseInt(strOptions[i])-1;
         //System.out.println("index=" + index);
         out.println("<tr><td>" + options[index] + "</td>");
         out.println("<td class='rightPos'>&yen;" + df.format(optionprices[index]) + "</td></tr>");
         total +=optionprices[index];
         }

      }
      %>
      <tr>
      <td class="titleColor">合計金額</td>
      <td class="titleColorrightPos">&yen;<%=df.format(total) %></td>
      </tr>
      </table>
      <br>
     
      <a href="tour.html">見積り画面に戻る</a>
      <hr>
      01組　040番　イムロス
</div>
</body>
</html>