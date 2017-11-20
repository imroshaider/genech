<%@ page contentType="text/html; charset=UTF-8" %>
<jsp:useBean id="itee"
class="beans.IteeBean" scope="page" />
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Beans Set</title>
</head>
<body>
<%
 String strIdent=request.getParameter("ident");
 int ident=0;
 try{
     ident=Integer.parseInt(strIdent);

 }catch(NumberFormatException e){
  ident =1;
 }
 	System.out.println("ident=" + ident);
 	itee.dbSelect(ident);

%>
<%=itee.getIdent() %><br>
<%=itee.getClassification() %><br>
<%=itee.getMnemonic() %><br>
<%=itee.getEnglish_name() %><br>
<%=itee.getRank() %><br>
<%=itee.getTarget() %>
</body>
</html>