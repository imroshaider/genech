<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="bmiBean" class="mvc.bmi.BMIBean" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC BMI TYPE</title>
</head>
<body>
<h3>BMIによる肥満度調査結果（2）</h3>
<p>
<%=bmiBean.getName() %>さんの<br>
<br>BMI値は、<%=bmiBean.getBMI() %></b>ですので、<br>
<br>「<%=bmiBean.judgeBMI() %></b>」となります。
</p>
<hr>
<a href="/web01040/mvc/bmi/bmicontroller">入力画面に戻る</a>
<hr>
01組　040番　イムロス
</body>
</html>