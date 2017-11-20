
package mvc.kakunin;

import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.Database.DBConnection;

/**
 *
 * @author imros
 */

public class KakuninDao{
public String kakuninupdate(KakuninBean kakuninBean) 
{
    
    String Email=kakuninBean.getEmail();
     String Pass=kakuninBean.getPass();
      String Name=kakuninBean.getName();
      String Proess="YES";
try
{
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;
     String query1 = "UPDATE  subcompany SET Proess=? where Email='"+Email+"'"; //Insert user details into the table 'USERS'
 preparedStatement = con.prepareStatement(query1);
 preparedStatement.setString(1, Proess);
  preparedStatement.executeUpdate();
 
String query = "insert  user(ID,PASS,Mail)values(?,?,?)";
 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data

preparedStatement.setString(1, Email);
preparedStatement.setString(2, Pass);
preparedStatement.setString(3, Email);


        int i=  preparedStatement.executeUpdate();




if (i!=0)  //Just to ensure data has been inserted into the database
return "SUCCESS"; 
}
//}
catch(SQLException e)
{
e.printStackTrace();
}


return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
}

    Object get(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}