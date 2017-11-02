/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.Companypage;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.Database.DBConnection;
import mvc.Companypage.CompanyBean;


/**
 *
 * @author imros
 */
public class comapanyDao {
    
public String companyeupdate(CompanyBean companyBean) throws IOException
{
    
    
  
String Email=companyBean.getEmail();
String Name = companyBean.getName();
String Pass = companyBean.getPass();
String Address = companyBean.getAddress();
String Code = companyBean.getCode();
String Url = companyBean.getUrl();
String Proess="NO";


try
{
    Connection con = DBConnection.createConnection();
    PreparedStatement preparedStatement = null;

     
String query1  = "insert into subcompany(Email,Name ,Pass, Address ,Code ,Url,Proess) values (?,?,?,?,?,?,?)";
preparedStatement = con.prepareStatement(query1); 

preparedStatement.setString(1, Email);
preparedStatement.setString(2, Name);
preparedStatement.setString(3, Pass);
preparedStatement.setString(4, Address);
preparedStatement.setString(5, Code);
preparedStatement.setString(6, Url);
preparedStatement.setString(7, Proess);

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