<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>	detail</title>	
</head>
<body>


 
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
      try{
          String query = "select * from subcompany where Proess = 'NO'";
          preparedStatement = con.prepareStatement(query);
ResultSet x =preparedStatement.executeQuery();

 while(x.next()){
 
  }

  
 }
      catch(SQLException e)
{
e.printStackTrace();
}
        %>


</body>
</html>