package mvc.Database;
import java.sql.Connection;
import java.sql.DriverManager;
public class DBConnection {
public static Connection createConnection()
{
Connection con = null;
String url = "jdbc:mysql://localhost:3306/pbl2"; //MySQL URL followed by the database name
String username = "pbl2"; //MySQL username
String password = "pbl2"; //MySQL password
try 
{
try 
{
Class.forName("com.mysql.jdbc.Driver"); //loading MySQL drivers 
} 
catch (ClassNotFoundException e)
{
e.printStackTrace();
}
con = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
System.out.println("Printing connection object "+con);
} 
catch (Exception e) 
{
e.printStackTrace();
}
return con; 
}
    Object str;

    Object get(String userid) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}