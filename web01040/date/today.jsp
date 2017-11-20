<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>今日の日付</title>
</head>
<body>
<%
  Calendar cal = Calendar.getInstance();
  

  out.println("今日は、" + cal.get(Calendar.YEAR) + "年");
  out.println((cal.get(Calendar.MONTH)+1) + "月");
   out.println(cal.get(Calendar.DATE) + "日です。<br>");
  
   %>
   <hr>
   01組　040番　イムロス </h3>
   </body>
   </html>
   