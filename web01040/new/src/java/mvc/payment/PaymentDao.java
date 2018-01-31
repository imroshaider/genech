
package mvc.payment;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.Database.DBConnection;



/**
 *
 * @author imros
 */
public class PaymentDao {
    
public String paymentupdate(PaymentBean paymentBean)throws IOException, SQLException{
      String hopeid=paymentBean.getHopeid();
      String picture =paymentBean.getPicture();
      String payment="YES";
       FileInputStream fis=null;
       
  File imagee= new File("C:\\apache-tomcat-8.5.16\\webapps\\pbl3\\web\\Image\\" +picture);
  
  
       
        Connection con = DBConnection.createConnection();
       
        PreparedStatement preparedStatement = null;

         String query = "UPDATE  pselect SET Payment=? pic=? where HopeID='"+hopeid+"'"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
            
            preparedStatement.setString(1,payment);
            fis=new FileInputStream(imagee);
preparedStatement.setBinaryStream(2, (InputStream) fis, (int) (imagee.length()));
             preparedStatement.executeUpdate();
    return "SUCCESS";
        
       
}
}
