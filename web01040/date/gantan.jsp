<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>正月までの日数</title>
</head>
<body>
<%
Calendar calToday = Calendar.getInstance();
Calendar calGantan = Calendar.getInstance();
 calGantan.set(2017,0,1);
long diff=(calGantan.getTimeInMillis() - calToday.getTimeInMillis())/(1000*60*60*24);

String[] aryWeek={"　","日","月","火","水","木","金","土"};

  out.println("現在、" + calToday.get(Calendar.YEAR) + "年");
  out.println((calToday.get(Calendar.MONTH)+1) + "月");

  out.println(calToday.get(Calendar.DATE) + "日(" + aryWeek[calToday.get(Calendar.DAY_OF_WEEK)] + ")");
 out.println(calToday.get(Calendar.HOUR_OF_DAY) + "時");
  out.println(calToday.get(Calendar.MINUTE) + "分");
  out.println(calToday.get(Calendar.SECOND) + "秒");
  out.println(calToday.get(Calendar.MILLISECOND) + "ミリ秒です。<br>");
  out.print("正月まで、あと" + diff +"日です。<br>");

 
 %>
   <hr>
   01組　040番　イムロス </h3>
   </body>
   </html>
