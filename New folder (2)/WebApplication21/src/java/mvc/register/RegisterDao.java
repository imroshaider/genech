package mvc.register;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.Database.DBConnection;

public class RegisterDao{
public String registerUser(RegisterBean registerBean)
{
String ID = registerBean.getID();
String PASS = registerBean.getPASS();
String Mail = registerBean.getMail();

Connection con = null;
PreparedStatement preparedStatement= null;
con = DBConnection.createConnection();
try
{
String query1 = "insert into userprof(ID) values (?)";
preparedStatement = con.prepareStatement(query1); 
    preparedStatement.setString(1, ID);
    preparedStatement.executeUpdate();
String query = "insert into user(ID,PASS,Mail) values (?,?,?)"; //Insert user details into the table 'USERS'
preparedStatement = con.prepareStatement(query); 

//Making use of prepared statements here to insert bunch of data
preparedStatement.setString(1, ID);
preparedStatement.setString(2, PASS);
preparedStatement.setString(3, Mail);

int i= preparedStatement.executeUpdate();
if (i!=0)  //Just to ensure data has been inserted into the database
return "SUCCESS"; 
}
catch(SQLException e)
{
e.printStackTrace();

}


return "Oops.. Something went wrong there..!";  // On failure, send a message from here.
}



    Object get(String userid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}