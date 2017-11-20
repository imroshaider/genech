<%@ page import ="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");
    String ident = request.getParameter("ID");
    String pass = request.getParameter("password");
    String name = request.getParameter("email");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pbl2",
            "pbl2", "pbl2");
    Statement st = con.createStatement();
    //ResultSet rs;
    int i = st.executeUpdate("insert into user(ID, PASS, Mail) values ('" + ident + "','" + pass + "','" + name );
    
%>