/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mvc.feedback;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import mvc.Database.DBConnection;
import mvc.feedback.FeedbackBean;


public class FeedbackDao{
public String feedbackupdate(FeedbackBean feedbackBean) throws IOException
{
    
String Uid = feedbackBean.getUid();
String hopeid = feedbackBean.getHopeid();
String Cid =feedbackBean.getCid();
String Pdetail = feedbackBean.getPdetail();
String Cdetail = feedbackBean.getCdetail();
String Next = feedbackBean.getNext();
String comment = feedbackBean.getComment();
int rank = Integer.parseInt(Pdetail);
rank+=Integer.parseInt(Cdetail);
String feedback ="YES";
try
{
   Connection con = null;
PreparedStatement preparedStatement= null;
con = DBConnection.createConnection();
     String query1  = "insert into feedback(HopeID,UID,CID,Pdetail,Cdetail,next,comment) values (?,?,?,?,?,?,?)";
preparedStatement = con.prepareStatement(query1); 
 preparedStatement.setString(1, hopeid);
  preparedStatement.setString(2, Uid);
   preparedStatement.setString(3, Cid);
   preparedStatement.setString(4, Pdetail);
    preparedStatement.setString(5, Cdetail);
     preparedStatement.setString(6, Next);
      preparedStatement.setString(7, comment);
   
   

int i= preparedStatement.executeUpdate();
String quer = "UPDATE  temppalan SET feedback=? where ID='"+hopeid+"'"; //Insert user details into the table 'USERS'
            preparedStatement = con.prepareStatement(quer); //Making use of prepared statements here to insert bunch of data
            
            preparedStatement.setString(1,feedback);
             preparedStatement.executeUpdate();

String query = "UPDATE  cprof SET rank=rank + ? where ID='"+Cid+"'"; //Insert user details into the table 'USERS'
 preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data

preparedStatement.setInt(1, rank);


preparedStatement.executeUpdate();


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