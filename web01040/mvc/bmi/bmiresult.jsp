<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bmiBean" class="mvc.bmi.BMIBean" scope="session" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>MVC BMI RESULT</title>
</head>
<body>
<h3>BMIによる肥満度調査結果(1)</h3>
<p>
<%= bmiBean.getName() %>さんの<br>
身長は<%= bmiBean.getHeight() %>cm、体量は<%= bmiBean.getWeight() %>kg<br>ですので、
BMI値は<%= bmiBean.getBMI() %></b>となります。<br>
</p>
<hr>
<a href="/web01040/mvc/bmi/bmicontroller">入力画面に戻る</a>
&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/web01040/mvc/bmi/bmicontroller?process=type">タイプを表示する</a>
<hr>
01組　040番　イムロス
</body>
</html>
