<%@ page contentType ="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang ="ja">
<head>
<meta charset ="UTF-8">
<title>ninebynine.jsp</title>
<style>
	td{
		width:30px;
		text-align:right;

	}
	</style>
</head>
<body>
<h4 align="center">01組　40番　イムロス</h4>
<hr>
<br>
<table border ="1" align ="center">

	
<% for(int row=1; row <= 9; row++) { %>
    <TR>
   <% for(int col=1; col<=9; col++) { %>
       <TD> <%
       out.print(col * row);%>
     
        </TD>
       <%  } %>
    </TR>
<% } %>
</table>


</table>
</body>
</html>