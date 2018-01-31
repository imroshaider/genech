package mvc.login;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import mvc.Database.DBConnection;

public class Validate
 {
     public static boolean checkUser(String userid,String password) 
     {
      boolean st =false;
      try{
      DBConnection registerDao = new DBConnection();
      Connection con = null;
      con = DBConnection.createConnection();
         PreparedStatement ps =con.prepareStatement("select * from user where ID=? and PASS=?");
         ps.setString(1, userid);
         ps.setString(2, password);
         ResultSet rs =ps.executeQuery();
         st = rs.next();
        
      }catch(Exception e)
      {
          e.printStackTrace();
      }
         return st;                 
  }   
}
