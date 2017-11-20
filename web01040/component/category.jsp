<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%
int category=
        Integer.parseInt(request.getParameter("category"));
        System.out.println("category=" + category);
        List<String>list=new ArrayList<String>();
    if(category==1){
    list.add("やさしいJava");
    list.add("独習Java");
    list.add("Java言プログラミングレッスン");
    }else if(category==2){
    list.add("基礎からのサーブレット/JSP");
    list.add("速習サーバーJava");
}else if(category==3){
	list.add("J2EEプログラマのためのEJBパーフェクトガイト");
}
request.setAttribute("bookList",list);
%>
<jsp:forward page="bookList.jsp" />